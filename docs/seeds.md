# Seed Data

## What is Seed Data?

Seed data is a controlled set of sample records loaded into the database for development and testing. It makes queries meaningful — you cannot test "top selling products" against an empty table.

## INSERT Syntax

```sql
INSERT INTO table_name (column1, column2) VALUES
    (value1, value2),
    (value3, value4);
```

You only specify the columns you want to fill. Columns with `SERIAL` or `DEFAULT` are handled automatically by PostgreSQL.

## Why Separate Files?

Tables have dependencies — `products` references `categories`, `orders` references `customers`. You must insert parent data before child data, or foreign key constraints will fail.

```
01_categories.sql   ← no dependencies
02_products.sql     ← depends on categories
03_customers.sql    ← no dependencies
04_orders.sql       ← depends on customers
05_order_items.sql  ← depends on orders and products
```

## Resetting the Database

To wipe all data and start fresh:

```sql
TRUNCATE order_items, orders, products, customers, categories
RESTART IDENTITY CASCADE;
```

- `TRUNCATE` — removes all rows instantly (faster than `DELETE`)
- `RESTART IDENTITY` — resets all `SERIAL` sequences back to 1
- `CASCADE` — automatically truncates dependent tables in the right order

## Seed Summary

| File | Table | Rows |
|---|---|---|
| 01_categories.sql | categories | 5 |
| 02_products.sql | products | 20 |
| 03_customers.sql | customers | 10 |
| 04_orders.sql | orders | 20 |
| 05_order_items.sql | order_items | 50 |
