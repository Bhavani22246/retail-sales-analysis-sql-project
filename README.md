# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales Analysis  
**Level**: Beginner  
**Database**: `sql_project_p1`  
**Table**: `retail`  
**Tool**: MySQL / MySQL Workbench

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data.

The project involves setting up a retail sales database, importing retail sales data, performing exploratory data analysis (EDA), checking data quality, and answering specific business questions using SQL queries.

This project is ideal for beginners who are starting their journey in Data Analytics and want to build a strong foundation in SQL and MySQL.

---

## Objectives

1. **Set up a retail sales database**: Create a database and table to store retail sales data.
2. **Import the Dataset**: Load the provided retail sales CSV dataset into MySQL.
3. **Data Quality Check**: Identify records containing missing or NULL values.
4. **Exploratory Data Analysis (EDA)**: Explore the dataset using SQL queries.
5. **Business Analysis**: Answer business questions using SQL.
6. **Generate Insights**: Analyze sales, customers, categories, time periods, and transactions.

---

# Project Structure

## 1. Database Setup

The project starts by creating a database named `sql_project_p1`.

```sql
CREATE DATABASE IF NOT EXISTS sql_project_p1;

USE sql_project_p1;

2. Table Creation

A table named retail is created to store the retail sales data.

The table contains information about:

Transaction ID
Sale Date
Sale Time
Customer ID
Gender
Age
Product Category
Quantity
Price Per Unit
Cost of Goods Sold (COGS)
Total Sale
CREATE TABLE retail (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(50),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
3. Understanding the Table
Describe the Table Structure
DESCRIBE retail;

This query displays the column names, data types, keys, and other information about the table.

4. Data Exploration
4.1 Count Total Number of Records
SELECT COUNT(*) AS total_rows
FROM retail;

This query returns the total number of records available in the retail table.

4.2 Display All Records
SELECT *
FROM retail;

This query displays all rows and columns from the dataset.

4.3 Count Unique Customers
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM retail;

This query calculates the number of unique customers in the dataset.

4.4 Count Unique Categories
SELECT COUNT(DISTINCT category) AS unique_categories
FROM retail;

This query calculates the number of unique product categories.

4.5 Display Unique Categories
SELECT DISTINCT category
FROM retail;

This query displays all unique product categories available in the dataset.

5. Data Quality Check

Before performing analysis, it is important to check whether the dataset contains missing values.

Check for NULL Values
SELECT *
FROM retail
WHERE sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;

This query identifies records containing NULL values.

6. Data Analysis & Business Questions

The following SQL queries are used to answer different business questions related to the retail sales dataset.

Question 1: Sales Made on a Specific Date
Business Question

Write a SQL query to retrieve all columns for sales made on 2022-11-05.

SQL Query
SELECT *
FROM retail
WHERE sale_date = '2022-11-05';
Purpose

This query helps analyze all transactions that occurred on a specific date.

Question 2: Clothing Sales in November 2022
Business Question

Write a SQL query to retrieve all transactions where:

Category is Clothing
Sale occurred in November 2022
Quantity sold is at least 4
SQL Query
SELECT *
FROM retail
WHERE category = 'Clothing'
  AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
  AND quantity >= 4;
Purpose

This query identifies clothing transactions with higher quantities during November 2022.

Question 3: Total Sales and Orders by Category
Business Question

Write a SQL query to calculate the total sales and number of orders for each category.

SQL Query
SELECT
    category,
    SUM(total_sale) AS net_sale,
    COUNT(*) AS total_orders
FROM retail
GROUP BY category
ORDER BY net_sale DESC;
Purpose

This query helps compare sales performance between different product categories.

Question 4: Average Age of Beauty Customers
Business Question

Write a SQL query to find the average age of customers who purchased products from the Beauty category.

SQL Query
SELECT
    ROUND(AVG(age), 2) AS avg_age
FROM retail
WHERE category = 'Beauty';
Purpose

This query helps understand the average age of customers purchasing Beauty products.

Question 5: High-Value Transactions
Business Question

Write a SQL query to find all transactions where the total sale amount is greater than 1000.

SQL Query
SELECT *
FROM retail
WHERE total_sale > 1000;
Purpose

This query identifies high-value transactions.

Question 6: Transactions by Gender and Category
Business Question

Write a SQL query to find the total number of transactions made by each gender in each category.

SQL Query
SELECT
    category,
    gender,
    COUNT(*) AS total_transactions
FROM retail
GROUP BY category, gender
ORDER BY category, gender;
Purpose

This query helps understand transaction distribution by gender across different product categories.

Question 7: Highest Average Sale Month in Each Year
Business Question

Write a SQL query to calculate the average sale for each month and find the month with the highest average sale in each year.

SQL Query
SELECT
    year,
    month,
    avg_sale
FROM (
    SELECT
        YEAR(sale_date) AS year,
        MONTH(sale_date) AS month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER (
            PARTITION BY YEAR(sale_date)
            ORDER BY AVG(total_sale) DESC
        ) AS sale_rank
    FROM retail
    GROUP BY YEAR(sale_date), MONTH(sale_date)
) AS t1
WHERE sale_rank = 1;
Purpose

This query identifies the month with the highest average sale for each year.

SQL Concepts Used
YEAR()
MONTH()
AVG()
GROUP BY
Subquery
RANK()
Window Functions
PARTITION BY
Question 8: Top 5 Customers by Total Sales
Business Question

Write a SQL query to find the top 5 customers based on their highest total sales.

SQL Query
SELECT
    customer_id,
    SUM(total_sale) AS total_sales
FROM retail
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;
Purpose

This query identifies the customers who generated the highest total sales.

Question 9: Unique Customers by Category
Business Question

Write a SQL query to find the number of unique customers who purchased products from each category.

SQL Query
SELECT
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail
GROUP BY category
ORDER BY unique_customers DESC;
Purpose

This query helps determine how many unique customers purchased from each product category.

Question 10: Orders by Time Shift
Business Question

Create different time shifts and calculate the number of orders for each shift.

Shift Definition
Morning: Before 12 PM
Afternoon: 12 PM to 5 PM
Evening: After 5 PM
SQL Query
SELECT
    CASE
        WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS total_orders
FROM retail
GROUP BY shift
ORDER BY total_orders DESC;
Purpose

This query helps understand when customers place the highest number of orders during the day.

7. Additional SQL Exploration

The following queries were also used during the project to practice basic SQL analysis.

Find Transactions Above a Certain Sale Amount
SELECT *
FROM retail
WHERE total_sale > 1000;
Find Sales for a Particular Category
SELECT *
FROM retail
WHERE category = 'Beauty';
Find Sales for a Particular Customer
SELECT *
FROM retail
WHERE customer_id = 1;
Sort Transactions by Total Sale
SELECT *
FROM retail
ORDER BY total_sale DESC;
Find the Highest Sale
SELECT MAX(total_sale) AS highest_sale
FROM retail;
Find the Lowest Sale
SELECT MIN(total_sale) AS lowest_sale
FROM retail;
Find the Average Sale
SELECT ROUND(AVG(total_sale), 2) AS average_sale
FROM retail;
Calculate Total Sales
SELECT SUM(total_sale) AS total_sales
FROM retail;
8. SQL Concepts Used

This project covers the following SQL concepts:

Database Creation
Table Creation
DESCRIBE
SELECT
WHERE
DISTINCT
COUNT()
COUNT(DISTINCT)
SUM()
AVG()
MIN()
MAX()
ROUND()
GROUP BY
ORDER BY
LIMIT
CASE
IS NULL
DATE_FORMAT()
YEAR()
MONTH()
HOUR()
Subqueries
Window Functions
RANK()
PARTITION BY
Aggregate Functions
Filtering
Sorting
Data Exploration
Data Quality Checking
9. Key Analysis Areas

The project focuses on the following areas:

Sales Analysis

Analyze total sales and order counts across different product categories.

Customer Analysis

Identify unique customers and top customers based on total sales.

Category Analysis

Understand customer purchases and sales performance across product categories.

Transaction Analysis

Identify high-value transactions and analyze transaction counts.

Time-Based Analysis

Analyze sales by date, month, year, and time of day.

Demographic Analysis

Explore customer age and gender patterns across categories.

10. Findings

The analysis focuses on the following business insights:

Customer Demographics: Analyze customer age and gender distribution across product categories.
Category Performance: Compare total sales and order counts across different categories.
High-Value Transactions: Identify transactions with sales greater than 1000.
Sales Trends: Analyze monthly average sales and identify the highest-performing month in each year.
Customer Insights: Identify the top 5 customers based on total sales.
Unique Customers: Determine the number of unique customers purchasing from each category.
Time-Based Insights: Analyze order volume across Morning, Afternoon, and Evening shifts.
11. Reports

The SQL analysis can be used to create the following reports:

Sales Summary

A summary of total sales and order counts by product category.

Customer Insights

Analysis of top customers and unique customers across categories.

Category Performance

Comparison of sales performance across different product categories.

Trend Analysis

Analysis of average monthly sales and yearly sales patterns.

Transaction Analysis

Analysis of high-value transactions and transaction distribution by gender and category.

Shift Analysis

Analysis of order volume across different times of the day.

12. Conclusion

This project serves as a beginner-friendly introduction to SQL for Data Analysts.

It covers the complete process of working with a retail sales dataset, including:

Database creation
Table creation
Data import
Data exploration
Data quality checking
Filtering
Aggregation
Grouping
Sorting
Date and time analysis
Customer analysis
Category analysis
Subqueries
Window functions

By completing this project, I gained practical experience using SQL to solve business-oriented data analysis problems.

The project demonstrates how SQL can be used to transform raw retail sales data into meaningful information that can support business decision-making.

13. How to Use
Step 1: Clone the Repository

Clone this repository from GitHub.

Step 2: Open MySQL Workbench

Open MySQL Workbench or another MySQL-compatible SQL environment.

Step 3: Create the Database

Run:

CREATE DATABASE IF NOT EXISTS sql_project_p1;

USE sql_project_p1;
Step 4: Create the Table

Run the table creation query:

CREATE TABLE retail (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(50),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
Step 5: Import the Dataset

Import the provided CSV file into the retail table.

Step 6: Check the Data

Run:

SELECT COUNT(*) AS total_rows
FROM retail;

SELECT *
FROM retail;
Step 7: Run the Analysis Queries

Execute the business analysis queries provided in this README or in the SQL project file.

Step 8: Explore Further

Modify the existing queries or create new SQL queries to discover additional insights from the dataset.

14. Repository Structure
retail-sales-analysis-sql-project/
│
├── README.md
│
├── SQL - Retail Sales Analysis_utf .csv
│
└── retail sales analysis sql project.sql
15. Tools Used
MySQL
MySQL Workbench
SQL
GitHub
CSV Dataset
16. GitHub Repository

The complete project, dataset, SQL queries, and documentation are available on GitHub.

Repository:

https://github.com/Bhavani22246/retail-sales-analysis-sql-project

17. About the Project

This project was created as part of my learning journey in SQL and Data Analytics.

The main goal of this project was to gain practical experience with SQL by working with a retail sales dataset and solving real-world business questions.

The project helped me practice SQL fundamentals as well as more advanced concepts such as subqueries and window functions.

18. Author

Bhavani Kulkarni

Aspiring Data Analyst | SQL | MySQL | Data Analytics

Thank You

Thank you for checking out my Retail Sales Analysis SQL Project!


### One important thing

This version now has **all the queries in the README itself**:

- Database creation
- `USE`
- Table creation
- `DESCRIBE`
- Record count
- `SELECT *`
- Unique customers
- Unique categories
- `DISTINCT`
- NULL check
- Date filtering
- Clothing + November 2022
- Category sales
- Beauty average age
- High-value transactions
- Gender/category analysis
- Monthly/yearly analysis with `RANK()`
- Top 5 customers
- Unique customers by category
- Shift analysis
- Plus additional `SUM`, `AVG`, `MIN`, `MAX`, sorting, customer/category exploration queries.

Also, **all queries are written for MySQL**, so you won't have the PostgreSQL `TO_CHAR()` / `EXTRACT()` errors from your old README.

