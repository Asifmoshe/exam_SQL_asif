part B in SQL

CREATE TABLE in_store (
tv_id serial PRIMARY KEY,
catalog_number varchar(25) UNIQUE NOT null,
price REAL NOT NULL CHECK (price > 0),
stock_quantity int DEFAULT 0
);

CREATE TABLE televisions (
tv_id int PRIMARY KEY REFERENCES in_store(tv_id) ON DELETE CASCADE,
brand varchar(25) NOT NULL,
model varchar(25) NOT NULL,
screen_size int NOT NULL,
resolution varchar(25) NOT NULL,
release_year int DEFAULT 2012,
smart_tv varchar(10) CHECK (smart_tv IN ('yes','no')),
os varchar(25),
panel_type varchar(10) CHECK (panel_type IN ('oled', 'qled', 'led'))
);

insert into in_store (catalog_number, price, stock_quantity) values
('adu238hde4', 1999.99, 6),
('iks435ntd3', 1765.50, 8),
('okc567nre2', 2000.00, 10);

insert into televisions (tv_id, brand, model, screen_size, resolution, release_year, smart_tv, os, panel_type) values
(1, 'Samsung', 'Q80T', 55, '4K', 2021, 'yes', 'Tizen', 'qled'),
(2, 'LG', 'CX', 65, '8K', 2020, 'yes', 'webOS', 'oled'),
(3, 'Sony', 'X750H', 50, '4K', 2019, 'no', NULL, 'led');
