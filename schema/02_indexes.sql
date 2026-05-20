-- ============================================================
-- E-Commerce Database Schema
-- Step 2: Indexes for query performance
-- ============================================================


-- products: frequently filtered by category
CREATE INDEX idx_products_category_id ON products(category_id);

-- orders: frequently filtered by customer and sorted by date
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_orders_created_at  ON orders(created_at);

-- order_items: frequently joined to orders and products
CREATE INDEX idx_order_items_order_id   ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);
