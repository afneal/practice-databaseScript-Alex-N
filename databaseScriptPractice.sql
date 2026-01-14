START TRANSACTION;

DROP TABLE IF EXISTS customers, orders, payments;

CREATE TABLE customers (
customer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
order_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
customer_id INT NOT NULL REFERENCES customers(customer_id),
order_date DATE NOT NULL,
total_amount DECIMAL NOT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE payments (
payment_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
payment_method VARCHAR(50) NOT NULL,
payment_amount DECIMAL NOT NULL,
payment_date DATE NOT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO customers (name, email) VALUES ('Alex', 'alex@email.com'),('Connor', 'connor@email.com');
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2026-01-01', 250.00),(1, '2026-01-02', 100.00), (2, '2026-01-04', 50.00);
INSERT INTO payments (payment_method, payment_amount, payment_date) VALUES
('credit', 250.00, '2026-01-01'),('cash', 100.00, '2026-01-02'), ('giftcard',50.00, '2026-01-04');

COMMIT;

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM payments;

