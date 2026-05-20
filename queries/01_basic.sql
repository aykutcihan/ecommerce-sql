-- ============================================================
-- Basic Queries — Explore the data
-- ============================================================


-- ----------------------------
-- CATEGORIES
-- ----------------------------

-- All categories
SELECT * FROM categories;


-- ----------------------------
-- PRODUCTS
-- ----------------------------

-- All products
SELECT * FROM products;

-- Products in Electronics
SELECT * FROM products WHERE category_id = 1;

-- Products under $50
SELECT * FROM products WHERE price < 50;

-- Products sorted by price (highest first)
SELECT * FROM products ORDER BY price DESC;

-- Out of stock products
SELECT * FROM products WHERE stock = 0;


-- ----------------------------
-- CUSTOMERS
-- ----------------------------

-- All customers
SELECT * FROM customers;

-- Find a customer by email
SELECT * FROM customers WHERE email = 'james.wilson@email.com';


-- ----------------------------
-- ORDERS
-- ----------------------------

-- All orders
SELECT * FROM orders;

-- Only delivered orders
SELECT * FROM orders WHERE status = 'delivered';

-- Orders placed in May 2026
SELECT * FROM orders WHERE created_at >= '2026-05-01' AND created_at < '2026-06-01';

-- Orders sorted by total amount (highest first)
SELECT * FROM orders ORDER BY total_amount DESC;


-- ----------------------------
-- ORDER ITEMS
-- ----------------------------

-- All order items
SELECT * FROM order_items;

-- Items in order #1
SELECT * FROM order_items WHERE order_id = 1;
