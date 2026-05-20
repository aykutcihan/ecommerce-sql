-- ============================================================
-- E-Commerce Database Schema
-- Step 1: Table definitions (no constraints yet)
-- ============================================================


-- ----------------------------
-- 1. CATEGORIES
-- ----------------------------
CREATE TABLE categories (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100),
    created_at  TIMESTAMP DEFAULT NOW()
);


-- ----------------------------
-- 2. PRODUCTS
-- ----------------------------
CREATE TABLE products (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(200),
    description TEXT,
    price       NUMERIC(10, 2),
    stock       INTEGER,
    category_id INTEGER REFERENCES categories(id),
    created_at  TIMESTAMP DEFAULT NOW()
);


-- ----------------------------
-- 3. CUSTOMERS
-- ----------------------------
CREATE TABLE customers (
    id          SERIAL PRIMARY KEY,
    first_name  VARCHAR(100),
    last_name   VARCHAR(100),
    email       VARCHAR(255) UNIQUE,
    phone       VARCHAR(20),
    created_at  TIMESTAMP DEFAULT NOW()
);


-- ----------------------------
-- 4. ORDERS
-- ----------------------------
CREATE TABLE orders (
    id           SERIAL PRIMARY KEY,
    customer_id  INTEGER REFERENCES customers(id),
    status       VARCHAR(50),
    total_amount NUMERIC(10, 2),
    created_at   TIMESTAMP DEFAULT NOW()
);


-- ----------------------------
-- 5. ORDER ITEMS
-- ----------------------------
CREATE TABLE order_items (
    id          SERIAL PRIMARY KEY,
    order_id    INTEGER REFERENCES orders(id),
    product_id  INTEGER REFERENCES products(id),
    quantity    INTEGER,
    unit_price  NUMERIC(10, 2)
);
