# E-Commerce SQL

A fully functional database layer for an Amazon-like e-commerce platform — no application code, no frontend, just the data model and the queries that power it.

## Product Vision

### What we're building
A relational database that models a real-world e-commerce system: customers, products organized into categories, orders, and order line items. Every layer — from schema design to advanced analytics — is written in PostgreSQL.

### Why it exists
To demonstrate SQL proficiency through working code. Rather than claiming SQL knowledge, this project shows it: normalized schema design, data integrity via constraints and indexes, and a query library that progresses from basic SELECTs to window functions and CTEs.

### What success looks like
- A junior developer can fork this repo and run it locally in under 5 minutes.
- A recruiter can read this README and immediately understand what was built and why.

### Out of scope
- Application code (Node.js, Python, etc.)
- REST API or GraphQL layer
- Authentication and authorization
- Migration tooling

---

## Project Structure

```
ecommerce-sql/
├── schema/
│   ├── 01_tables.sql        # Table definitions
│   ├── 02_indexes.sql       # Performance indexes
│   └── 03_constraints.sql   # Business rule constraints
├── seeds/
│   └── seed_data.sql        # Sample data (100+ orders)
├── queries/
│   ├── 01_basic.sql         # SELECT, filter, sort
│   ├── 02_aggregations.sql  # GROUP BY, HAVING, subqueries
│   └── 03_advanced.sql      # Window functions, CTEs
├── views/
│   └── views.sql            # Reusable report views
├── functions/
│   └── functions.sql        # Business logic functions
└── README.md
```

---

## Domain Model

| Entity | Description |
|---|---|
| `customers` | Registered users who place orders |
| `categories` | Product groupings (Electronics, Clothing, etc.) |
| `products` | Items for sale, each belonging to one category |
| `orders` | A purchase event tied to a customer |
| `order_items` | Individual line items within an order |

---

## How to Run

```sql
-- 1. Create the database
CREATE DATABASE ecommerce;

-- 2. Run schema
\i schema/01_tables.sql
\i schema/02_indexes.sql
\i schema/03_constraints.sql

-- 3. Load seed data
\i seeds/seed_data.sql

-- 4. Run any query file
\i queries/01_basic.sql
```

---

## Sample Questions Answered

- Which products generated the most revenue this month?
- Who are the top 10 customers by lifetime value?
- What is the average order value per category?
- Which products have never been ordered?
- How does this month's revenue compare to last month?
