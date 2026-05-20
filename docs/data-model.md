# Data Model

## Overview

This database models a simplified e-commerce platform. Five tables cover the full purchase lifecycle: browsing products by category, placing an order, and tracking individual items within that order.

```
categories
    └── products
            └── order_items
                    └── orders
                            └── customers
```

---

## Tables

### 1. categories
Stores product groupings (Electronics, Clothing, Books, etc.).

| Column | Type | Notes |
|---|---|---|
| id | SERIAL | Auto-incrementing integer. No manual input needed. |
| name | VARCHAR(100) | Up to 100 characters. |
| created_at | TIMESTAMP | Defaults to current time automatically. |

**Key concepts:**
- `SERIAL` — PostgreSQL auto-increment. Each new row gets the next integer (1, 2, 3...).
- `PRIMARY KEY` — Uniquely identifies every row. No two categories can share the same `id`. This is what other tables reference when forming relationships.

---

### 2. products
Items available for purchase. Each product belongs to one category.

| Column | Type | Notes |
|---|---|---|
| id | SERIAL | Auto-incrementing primary key. |
| name | VARCHAR(200) | Product title. |
| description | TEXT | Unlimited length. Better than VARCHAR for long text. |
| price | NUMERIC(10, 2) | Up to 10 digits, 2 decimal places. e.g. 99999999.99 |
| stock | INTEGER | Whole number, no decimals needed. |
| category_id | INTEGER | Foreign key → categories.id |
| created_at | TIMESTAMP | Defaults to current time. |

**Key concepts:**
- `NUMERIC(10, 2)` vs `FLOAT` — Money must never use FLOAT. Floating point arithmetic causes rounding errors (e.g. 0.1 + 0.2 = 0.30000000004). NUMERIC is exact.
- `TEXT` vs `VARCHAR` — VARCHAR enforces a character limit. TEXT is unlimited. For descriptions, TEXT is the right choice.
- `FOREIGN KEY` — `category_id REFERENCES categories(id)` means this column must contain a value that exists in `categories.id`. Attempting to insert a non-existent category_id will throw an error.

**Relationship:** `categories` → `products` is **One-to-Many**. One category can have many products. One product belongs to exactly one category.

---

### 3. customers
Registered users who place orders. Independent table — no foreign keys.

| Column | Type | Notes |
|---|---|---|
| id | SERIAL | Auto-incrementing primary key. |
| first_name | VARCHAR(100) | — |
| last_name | VARCHAR(100) | — |
| email | VARCHAR(255) | Must be unique across all rows. |
| phone | VARCHAR(20) | Stored as text, not integer — phone numbers can start with 0 or contain +. |
| created_at | TIMESTAMP | Defaults to current time. |

**Key concepts:**
- `UNIQUE` — Enforces that no two rows can have the same value in this column. Two customers cannot share the same email address. PostgreSQL will throw an error if you try.
- Why `VARCHAR` for phone? Because phone numbers are not math. You never add or multiply them. Storing as integer would drop leading zeros and break international formats like +90 555 000 0000.

---

### 4. orders
A purchase event linked to a customer.

| Column | Type | Notes |
|---|---|---|
| id | SERIAL | Auto-incrementing primary key. |
| customer_id | INTEGER | Foreign key → customers.id |
| status | VARCHAR(50) | pending / shipped / delivered / cancelled |
| total_amount | NUMERIC(10, 2) | Stored explicitly — see note below. |
| created_at | TIMESTAMP | Defaults to current time. |

**Key concepts:**
- `FOREIGN KEY` — `customer_id REFERENCES customers(id)`. Every order must belong to an existing customer.
- **Denormalization** — `total_amount` could be calculated by summing `order_items`. We store it anyway for performance. Recalculating on every query is expensive at scale. Storing it once is a deliberate trade-off: slight redundancy in exchange for faster reads.

**Relationship:** `customers` → `orders` is **One-to-Many**. One customer can place many orders.

---

### 5. order_items
Individual line items within an order. This is a **junction table** that resolves the Many-to-Many relationship between orders and products.

| Column | Type | Notes |
|---|---|---|
| id | SERIAL | Auto-incrementing primary key. |
| order_id | INTEGER | Foreign key → orders.id |
| product_id | INTEGER | Foreign key → products.id |
| quantity | INTEGER | How many units of this product. |
| unit_price | NUMERIC(10, 2) | Price at time of purchase — see note below. |

**Key concepts:**
- **Many-to-Many** — One order can contain many products. One product can appear in many orders. You cannot model this with a single foreign key. A junction table sits between the two and holds one row per (order, product) pair.
- **Why store `unit_price`?** — Product prices change over time. If you reference `products.price` directly, historical order totals would change whenever a price is updated. Capturing the price at purchase time preserves an accurate financial record.

---

## Relationship Map

```
categories (1) ──────────── (N) products
customers  (1) ──────────── (N) orders
orders     (1) ──────────── (N) order_items
products   (1) ──────────── (N) order_items
```

| Relationship | Type | Via |
|---|---|---|
| categories → products | One-to-Many | products.category_id |
| customers → orders | One-to-Many | orders.customer_id |
| orders ↔ products | Many-to-Many | order_items (junction table) |
