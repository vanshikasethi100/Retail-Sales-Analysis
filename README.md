# Retail-Sales-Analysis
This project presents an end-to-end SQL analysis of a retail sales dataset using PostgreSQL. The goal was to simulate a real-world data analyst workflow — starting from raw transactional data and transforming it into meaningful business insights
Project Workflow

1. Data Understanding:
Explored table structure, validated data types, and inspected records to understand available attributes such as customer details, product information, transaction values, and review scores.

2. Data Cleaning & Preparation:
Handled NULL values (gender, review scores)
Removed duplicate transactions
Standardized text fields (city, category, payment method)
Validated numeric columns (price, quantity, age)
Created a new revenue metric (quantity × price)

3. Data Analysis (SQL Queries):
Performed business-oriented analysis including:
 Total Revenue & Orders
 Average Order Value (AOV)
 Top Products & Categories
 City-wise Sales Performance
 Payment Method Preferences
 Age Group Segmentation
 Repeat Customer Identification

Key Insights:
Certain products and categories drive majority of revenue
Specific customer age groups contribute higher spending
Repeat customers generate significantly more value
Higher review scores are associated with increased purchase amounts
Sales vary across cities indicating regional demand differences
