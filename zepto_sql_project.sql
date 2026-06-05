drop table if exists products;

CREATE TABLE products (
    category VARCHAR(100),
    name TEXT,
    mrp INT,
    discountpercent INT,
    availablequantity INT,
    discountedsellingprice INT,
    weightingms INT,
    outofstock BOOLEAN,
    quantity INT
);

SELECT * FROM products LIMIT 5;

--Data cleaning checking null values,duplicates and negative prices.
SELECT *
FROM products
WHERE name IS NULL;

SELECT name,
       COUNT(*)
FROM products
GROUP BY name
HAVING COUNT(*) > 1;

SELECT *
FROM products
WHERE mrp < 0
   OR discountedsellingprice < 0;

--category analysis
SELECT category,
       COUNT(*) AS total_products
FROM products
GROUP BY category
ORDER BY total_products DESC;

--pricing analysis
SELECT category,
       ROUND(AVG(discountedsellingprice),2) AS avg_price
FROM products
GROUP BY category
ORDER BY avg_price DESC;

--highest discount
SELECT name,
       discountpercent
FROM products
ORDER BY discountpercent DESC
LIMIT 10;

--out of stock
SELECT category,
       COUNT(*) AS out_of_stock_products
FROM products
WHERE outofstock = TRUE
GROUP BY category
ORDER BY out_of_stock_products DESC;

/*Revenue Estimation
Revenue=SellingPrice×Quantity*/
SELECT category,
       SUM(discountedsellingprice * quantity) AS estimated_revenue
FROM products
GROUP BY category
ORDER BY estimated_revenue DESC;

--giving rank number
SELECT category,
       name,
       discountedsellingprice,
       RANK() OVER(
           PARTITION BY category
           ORDER BY discountedsellingprice DESC
       ) AS rank_num
FROM products;

--Which products are priced above average
WITH avg_price AS (
    SELECT AVG(discountedsellingprice) AS avg_sp
    FROM products
)
SELECT name,
       discountedsellingprice
FROM products, avg_price
WHERE discountedsellingprice > avg_sp;

---- Creating a view to identify highly discounted products
CREATE VIEW top_discount_products AS
SELECT name,
       discountpercent
FROM products
WHERE discountpercent > 50; 

--creating index
CREATE INDEX idx_category
ON products(category);
