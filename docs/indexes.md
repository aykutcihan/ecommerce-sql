# Indexes

## What is an Index?

An index is a data structure that speeds up data retrieval. Without an index, PostgreSQL scans every row in a table to find matches — called a **sequential scan**. With an index, it jumps directly to the relevant rows — called an **index scan**.

Think of it like a book index: instead of reading every page to find "PostgreSQL", you look it up in the back and go directly to the right page.

## When to Add an Index

Add an index on columns that are frequently used in:

```sql
WHERE category_id = 1       -- filtering
ORDER BY created_at DESC    -- sorting
JOIN ... ON order_id = ...  -- joining
```

## The Cost of Indexes

Indexes are not free. Every `INSERT`, `UPDATE`, and `DELETE` must also update the index. Too many indexes slow down writes. Only index columns you actually query against.

## Automatic Indexes

PostgreSQL automatically creates an index for:

| Constraint | Index created |
|---|---|
| `PRIMARY KEY` | Yes — always |
| `UNIQUE` | Yes — always |

You never need to manually index a primary key or unique column.

## Our Indexes

```sql
-- products: frequently filtered by category
CREATE INDEX idx_products_category_id ON products(category_id);

-- orders: frequently filtered by customer and sorted by date
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_orders_created_at  ON orders(created_at);

-- order_items: frequently joined to orders and products
CREATE INDEX idx_order_items_order_id   ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);
```

## Useful Commands

```sql
\di                  -- list all indexes in the database
\d tablename         -- show table structure including its indexes
```

Example output of `\d orders`:

```
Indexes:
    "orders_pkey" PRIMARY KEY, btree (id)        ← auto (PRIMARY KEY)
    "idx_orders_created_at" btree (created_at)   ← manually added
    "idx_orders_customer_id" btree (customer_id) ← manually added
```
