
-- 1. Brands
CREATE TABLE brand (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(190)
);
INSERT INTO brand (brand_id, brand_name) VALUES
(1, 'Nike'),
(2, 'Apple');

-- 2. Colors
CREATE TABLE color (
    color_id INT PRIMARY KEY,
    color_name VARCHAR(100)
);
INSERT INTO color (color_id, color_name) VALUES
(1, 'Red'),
(2, 'Black');

-- 3. Product Categories
CREATE TABLE product_category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(190)
);
INSERT INTO product_category (category_id, category_name) VALUES
(1, 'Clothing'),
(2, 'Electronics');

-- 4. Products
CREATE TABLE product (
    product_id INT PRIMARY KEY,
    name VARCHAR(255),
    brand_id INT,
    base_price DECIMAL(10,2),
    category_id INT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);
INSERT INTO product (product_id, name, brand_id, base_price, category_id) VALUES
(1, 'Running Shoes', 1, 120.00, 1),
(2, 'iPhone 14', 2, 999.99, 2);

-- 5. Product Images
CREATE TABLE product_image (
    image_id INT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(265),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
INSERT INTO product_image (image_id, product_id, image_url) VALUES
(1, 1, 'https://example.com/shoe.jpg'),
(2, 2, 'https://example.com/iphone.jpg');

-- 6. Size Categories
CREATE TABLE size_category (
    size_category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);
INSERT INTO size_category (size_category_id, category_name) VALUES
(1, 'Clothing Sizes'),
(2, 'Phone Storage');

-- 7. Size Options
CREATE TABLE size_option (
    size_id INT PRIMARY KEY,
    size_value VARCHAR(30),
    size_category_id INT,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);
INSERT INTO size_option (size_id, size_value, size_category_id) VALUES
(1, 'M', 1),
(2, 'L', 1),
(3, '128GB', 2),
(4, '256GB', 2);

-- 8. Product Variations
CREATE TABLE product_variation (
    variation_id INT PRIMARY KEY,
    product_id INT,
    color_id INT,
    size_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_id) REFERENCES size_option(size_id)
);
INSERT INTO product_variation (variation_id, product_id, color_id, size_id) VALUES
(1, 1, 1, 1),
(2, 1, 1, 2),
(3, 2, 2, 3);

-- 9. Product Items
CREATE TABLE product_item (
    item_id INT PRIMARY KEY,
    product_id INT,
    variation_id INT,
    stock_quantity INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);
INSERT INTO product_item (item_id, product_id, variation_id, stock_quantity) VALUES
(1, 1, 1, 50),
(2, 1, 2, 30),
(3, 2, 3, 100);

-- 10. Attribute Categories
CREATE TABLE attribute_category (
    attribute_category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);
INSERT INTO attribute_category (attribute_category_id, category_name) VALUES
(1, 'Physical'),
(2, 'Technical');

-- 11. Attribute Types
CREATE TABLE attribute_type (
    attribute_type_id INT PRIMARY KEY,
    type_name VARCHAR(100),
    data_type VARCHAR(50),
    attribute_category_id INT,
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id)
);
INSERT INTO attribute_type (attribute_type_id, type_name, data_type, attribute_category_id) VALUES
(1, 'Weight', 'number', 1),
(2, 'Material', 'text', 1),
(3, 'Battery Life', 'text', 2);

-- 12. Product Attributes
CREATE TABLE product_attribute (
    attribute_id INT PRIMARY KEY,
    product_id INT,
    attribute_type_id INT,
    attribute_value VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);
INSERT INTO product_attribute (attribute_id, product_id, attribute_type_id, attribute_value) VALUES
(1, 1, 1, '0.8'),
(2, 1, 2, 'Mesh'),
(3, 2, 3, '18 hours');
