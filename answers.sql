part B in SQL

CREATE TABLE brands (
brand_id SERIAL PRIMARY KEY,
brand_name VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE panel_types (
panel_id SERIAL PRIMARY KEY,
panel_name VARCHAR(10) UNIQUE NOT NULL  -- 'OLED', 'QLED', 'LED'
);

CREATE TABLE operating_systems (
os_id SERIAL PRIMARY KEY,
os_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE televisions (
tv_id SERIAL PRIMARY KEY,
catalog_number VARCHAR(25) UNIQUE NOT NULL,
brand_id INT NOT NULL REFERENCES brands(brand_id),
model VARCHAR(50) NOT NULL,
screen_size INT NOT NULL,
resolution VARCHAR(25) NOT NULL,
release_year INT DEFAULT 2012,
smart_tv VARCHAR(3) CHECK (smart_tv IN ('yes','no')),
os_id INT REFERENCES operating_systems(os_id),
panel_id INT NOT NULL REFERENCES panel_types(panel_id),
price REAL NOT NULL CHECK (price > 0),
stock_quantity INT DEFAULT 0
);

INSERT INTO brands (brand_name) VALUES
('samsung'),
('LG'),
('sony');

INSERT INTO panel_types (panel_name) VALUES
('oled'),
('qled'),
('led');

INSERT INTO operating_systems (os_name) VALUES
('tizen'),
('webOS');

INSERT INTO televisions
(catalog_number, brand_id, model, screen_size, resolution, release_year, smart_tv, os_id, panel_id, price, stock_quantity)
VALUES
('adu238hde4', 1, 'Q80T', 55, '4K', 2021, 'yes', 1, 2, 1999.99, 6),
('iks435ntd3', 2, 'CX', 65, '8K', 2020, 'yes', 2, 1, 1765.50, 8),
('okc567nre2', 3, 'X750H', 50, '4K', 2019, 'no', NULL, 3, 2000.00, 10);


