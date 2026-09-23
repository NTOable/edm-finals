CREATE TABLE customers (
customer_id INTEGER PRIMARY KEY,
name TEXT NOT NULL,
email TEXT UNIQUE,
city TEXT,
created_on DATE DEFAULT CURRENT_DATE );

ALTER TABLE customers ADD COLUMN phone TEXT;
ALTER TABLE customers RENAME COLUMN phone TO contact_no;

CREATE TABLE orders (
order_id INTEGER PRIMARY KEY,
customer_id INTEGER NOT NULL,
order_date DATE,
amount REAL,
status TEXT DEFAULT 'Pending',
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id) );

INSERT INTO customers
(customer_id, name, email, city, contact_no)
VALUES
(1, 'Acme Corp', 'ap@acme.com', 'Denver', '42679693'),
(2, 'Bluebird LLC', 'b@bird.com', 'Boulder', '96723453');

INSERT INTO orders
(order_id, customer_id, order_date, amount, status)
VALUES
(1, 1, '2026-09-23', '500', 'Served'),
(2, 1, '2026-09-23', '350', ''),
(3, 1, '2026-09-23', '250', 'Served'),
(4, 2, '2026-09-23', '600', '');
