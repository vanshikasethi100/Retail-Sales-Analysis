CREATE DATABASE E_commerce;

CREATE TABLE E_Commerce(
       customer_id INT PRIMARY KEY,
	   order_date DATE,
	   product_id INT,
	   category_id INT,
	   category_name VARCHAR(50),
	   product_name VARCHAR(50),
	   quantity	INT,
	   price FLOAT,
	   payment_method VARCHAR(30),
	   city VARCHAR(50),
	   review_score FLOAT,
	   gender CHAR(1),
	   age INT
);

SELECT * FROM E_Commerce;

--Check for NULL Values--
SELECT 
COUNT(*) FILTER (WHERE customer_id IS NULL) AS customer_id_nulls,
COUNT(*) FILTER (WHERE order_date IS NULL) AS order_date_nulls,
COUNT(*) FILTER (WHERE product_id IS NULL) AS product_id_nulls,
COUNT(*) FILTER (WHERE category_id IS NULL) AS category_id_nulls,
COUNT(*) FILTER (WHERE category_name IS NULL) AS category_nulls,
COUNT(*) FILTER (WHERE product_name IS NULL) AS product_name_nulls,
COUNT(*) FILTER (WHERE price IS NULL) AS price_nulls,
COUNT(*) FILTER (WHERE payment_method IS NULL) AS payment_method_nulls,
COUNT(*) FILTER (WHERE quantity IS NULL) AS quantity_nulls,
COUNT(*) FILTER (WHERE city IS NULL) AS city_nulls,
COUNT(*) FILTER (WHERE review_score IS NULL) AS review_nulls,
COUNT(*) FILTER (WHERE gender IS NULL) AS gender_nulls,
COUNT(*) FILTER (WHERE age IS NULL) AS age_nulls
FROM E_Commerce;

--Check for Duplicate Records--
SELECT customer_id, product_id, COUNT(*)
FROM E_Commerce
GROUP BY customer_id, product_id
HAVING COUNT(*) > 1;

--Check negative or zero price--
SELECT * 
FROM E_Commerce
WHERE price <= 0;

--Check negative quantity--
SELECT * 
FROM E_Commerce
WHERE quantity <= 0;

--Check unrealistic age--
SELECT *
FROM E_Commerce
WHERE age < 10 OR age > 100;

--Clean Text Columns--
UPDATE E_Commerce
SET city = TRIM(city),
    category_name = TRIM(category_name),
    product_name = TRIM(product_name),
    payment_method = TRIM(payment_method);

--Standardize format--
UPDATE E_Commerce
SET city = INITCAP(city),
    category_name = INITCAP(category_name),
    payment_method = INITCAP(payment_method),
    gender = INITCAP(gender);

SELECT * FROM E_Commerce;

--Validate Gender Values--
SELECT DISTINCT gender FROM E_Commerce;

--Handle NULL in gender--
UPDATE E_Commerce
SET gender = 'U'
WHERE gender IS NULL;

--Handle NULL in review_score--
UPDATE E_Commerce
SET review_score = (
    SELECT AVG(review_score)
    FROM E_Commerce
)
WHERE review_score IS NULL;

--Create Revenue Column--
ALTER TABLE E_Commerce
ADD COLUMN revenue NUMERIC(12,2);

--Fill the revenue values--
UPDATE E_Commerce
SET revenue = quantity * price;

--Total Revenue--
SELECT SUM(revenue) AS total_revenue
FROM E_Commerce;

--Total Orders--
SELECT COUNT(*) AS total_orders
FROM E_Commerce;

--Average Order Value--
SELECT ROUND(AVG(revenue),2) AS avg_order_value
FROM E_Commerce;

--Best Selling Product--
SELECT product_name,
SUM(quantity) AS total_units_sold
FROM E_Commerce
GROUP BY product_name
ORDER BY total_units_sold DESC;

--Most Profitable Product--
SELECT product_name,
SUM(revenue) AS total_revenue
FROM E_Commerce
GROUP BY product_name
ORDER BY total_revenue DESC;

--Sales by Category--
SELECT category_name,
SUM(revenue) AS revenue
FROM E_Commerce
GROUP BY category_name
ORDER BY revenue DESC;

--Preferred Payment Method--
SELECT payment_method,
COUNT(*) AS orders
FROM E_Commerce
GROUP BY payment_method
ORDER BY orders DESC;

--City Performance--
SELECT city,
SUM(revenue) AS total_sales
FROM E_Commerce
GROUP BY city
ORDER BY total_sales DESC;

--Age Group Segmentation--
SELECT
CASE
    WHEN age < 20 THEN 'Teen'
    WHEN age BETWEEN 20 AND 35 THEN 'Young Adult'
    WHEN age BETWEEN 36 AND 55 THEN 'Adult'
    ELSE 'Senior'
END AS age_group,
COUNT(*) AS orders,
SUM(revenue) AS revenue
FROM E_Commerce
GROUP BY age_group
ORDER BY revenue DESC;

--Repeat Customers--
SELECT customer_id,
COUNT(*) AS total_orders,
SUM(revenue) AS total_spent
FROM E_Commerce
GROUP BY customer_idSS
HAVING COUNT(*) > 1
ORDER BY total_spent DESC;










