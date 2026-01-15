START TRANSACTION;

DROP TABLE IF EXISTS customers, orders, special_menu_items, urban_eats;

CREATE TABLE urban_eats (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
seating_capacity int NOT NULL,
location VARCHAR(100),
manager VARCHAR(50),
year_opened INT,
serves_alcohol BOOLEAN DEFAULT 0
);

CREATE TABLE customers (
customer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
loyalty_points int DEFAULT 0
);

CREATE TABLE orders (
order_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
customer_id INT NOT NULL REFERENCES customers(customer_id),
restaurant_id INT NOT NULL REFERENCES urban_eats(id),
order_date DATE NOT NULL,
total_amount DECIMAL NOT NULL
);

CREATE TABLE special_menu_items (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
restaurant_id INT NOT NULL,
food_name VARCHAR(50),
price DECIMAL NOT NULL
);

INSERT INTO urban_eats (seating_capacity, location, manager, year_opened, serves_alcohol) VALUES (50, '123 Main St.', 'Bob Barker', 1997, 1), (100, '456 South Broadway', 'Lucy Lou', 2025, 0);
INSERT INTO customers (first_name, last_name, email, loyalty_points) VALUES ('Alex', 'Neal', 'alex@email.com', 1000),('Connor', 'Bodeman', 'connor@email.com', 200);
INSERT INTO orders (customer_id, restaurant_id, order_date, total_amount) VALUES
(1, 1, '2026-01-01', 250.00),(1, 2, '2026-01-02', 100.00), (2, 1, '2026-01-04', 50.00);
INSERT INTO special_menu_items (food_name, restaurant_id, price) VALUES
('spaghetti', 2, 5.50),('steak and potatoes', 1, 15.79), ('carbonara',2,  12.50);

COMMIT;

SELECT * FROM urban_eats;
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM special_menu_items;

