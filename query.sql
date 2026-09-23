CREATE TABLE customers (
customer_id INTEGER PRIMARY KEY, 
name TEXT NOT NULL, 
email TEXT UNIQUE, 
city TEXT
);

CREATE TABLE orders (
order_id INTEGER PRIMARY KEY,
customer_id INTEGER NOT NULL,
order_date DATE,
amount REAL,
status TEXT DEFAULT 'Pending',
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id) 
);

ALTER TABLE customers ADD COLUMN created_on DATE DEFAULT CURRENT_DATE;
ALTER TABLE customers ADD COLUMN phone;
ALTER TABLE customers RENAME COLUMN phone TO contact_no;

DROP TABLE orders; -- Deletes the entire 'orders' table

INSERT INTO customers (customer_id, name, email, city, contact_no) VALUES (1, 'Abelardo', 'abe@mail.com', 'QC', '9123023');
INSERT INTO customers (customer_id, name, email, city, contact_no)
VALUES
(2, 'Acme Corp', 'ap@acme.com', 'Denver', '42679693'),
(3, 'Bluebird LLC', 'b@bird.com', 'Boulder', '96723453'),
(4, 'Don', 'd@don.com', 'Danny', '93471232');

INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (104, 1, '2026-09-23', '500', 'Pending');
INSERT INTO customers (customer_id, name, email, city, contact_no) VALUES (5, 'Aguada', 'JA@mail.com', '', '09135813');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (102, 1, '2026-09-29', '250', 'Pending');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (111, 1, '2026-09-27', '900', 'Pending');
INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES (112, 1, '2026-09-31', '1200', 'Serving');
INSERT INTO customers (customer_id, name, email, city, contact_no) VALUES (6, 'Meek', '', 'Danny', '15374347');

SELECT * FROM customers;
SELECT name, city FROM customers;
SELECT * FROM customers WHERE city = 'Denver';
SELECT * FROM orders WHERE amount > 500;
SELECT * FROM orders WHERE status = 'Paid';
SELECT * FROM customers WHERE name LIKE 'B%';
SELECT * FROM orders WHERE amount >= 200 AND amount <= 1000;
SELECT * FROM customers WHERE city IN ('Denver', 'Boulder');
SELECT * FROM orders WHERE status = 'Paid' AND amount > 1000;
SELECT * FROM customers WHERE email = '';
SELECT amount FROM orders ORDER BY amount DESC;
SELECT name FROM customers ORDER BY name DESC;
SELECT * FROM orders ORDER BY order_date ASC LIMIT 3;
UPDATE customers SET city = 'Denver Metro' WHERE customer_id = 4;
UPDATE orders SET status = 'Paid' WHERE order_id = 102;
DELETE FROM orders WHERE order_id = 104;

-- This query is stopped by the UNIQUE constraint used by the 'email' attribute, which makes sure that there can be no duplicate emails inside the 'customers' table.
-- Running this particular query without any condition may result in the deletion of the entire 'orders' table.
