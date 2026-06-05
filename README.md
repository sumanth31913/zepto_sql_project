# Zepto SQL Data Analysis Project

## Overview
This project analyzes Zepto product dataset using PostgreSQL and SQL queries.

## Tools Used
- PostgreSQL
- pgAdmin 4
- SQL
- GitHub

## Dataset Information
The dataset contains:
- Product category
- Product name
- MRP
- Discount percentage
- Available quantity
- Discounted selling price
- Stock availability
- Product quantity

## Project Tasks
- Data cleaning
- NULL value checking
- Duplicate detection
- Negative price validation
- Category analysis
- Pricing analysis
- Product insights

## SQL Concepts Used
- SELECT
- WHERE
- GROUP BY
- HAVING
- ORDER BY
- Aggregate Functions
- Data Cleaning Queries

## Example Query

```sql
SELECT category,
       COUNT(*) AS total_products
FROM products
GROUP BY category
ORDER BY total_products DESC;
```

## Project Screenshots

Screenshots are available in the screenshots folder.

## Author
Sumanth Mannem
