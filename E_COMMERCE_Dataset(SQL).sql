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

