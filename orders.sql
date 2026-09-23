CREATE TABLE orders (
order_id INTEGER PRIMARY KEY,
customer_id INTEGER NOT NULL,
order_date DATE,
amount REAL,
status TEXT DEFAULT 'Pending',
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id));