# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales Analysis  
**Level**: Beginner  
**Database**: `sql_project_p1`  
**Table**: `retail`  
**Tool**: MySQL / MySQL Workbench  

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Exploration**: Explore the retail sales dataset and understand its structure and contents.
3. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.
4. **SQL Practice**: Practice SQL concepts such as filtering, aggregation, grouping, sorting, subqueries, and window functions.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `sql_project_p1`.
- **Table Creation**: A table named `retail` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
CREATE DATABASE sql_project_p1;

USE sql_project_p1;

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
```

### 2. Data Exploration & Cleaning

- **Table Structure**: Understand the structure of the retail table.
- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.

```sql
DESCRIBE retail;

SELECT COUNT(*) AS total_rows
FROM retail;

SELECT *
FROM retail;

SELECT COUNT(DISTINCT customer_id)
FROM retail;

SELECT COUNT(DISTINCT category)
FROM retail;

SELECT DISTINCT category
FROM retail;
```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

1. **Write a SQL query to retrieve all columns for sales made on '2022-11-05':**

```sql
SELECT *
FROM retail
WHERE sale_date = '2022-11-05';
```

2. **Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is at least 4 in the month of Nov-2022:**

```sql
SELECT *
FROM retail
WHERE category = 'Clothing'
  AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
  AND quantity >= 4;
```

3. **Write a SQL query to calculate the total sales (total_sale) and total orders for each category:**

```sql
SELECT
    category,
    SUM(total_sale) AS net_sale,
    COUNT(*) AS total_orders
FROM retail
GROUP BY category;
```

4. **Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category:**

```sql
SELECT
    AVG(age) AS avg_age
FROM retail
WHERE category = 'Beauty';
```

5. **Write a SQL query to find all transactions where the total_sale is greater than 1000:**

```sql
SELECT *
FROM retail
WHERE total_sale > 1000;
```

6. **Write a SQL query to find the total number of transactions made by each gender in each category:**

```sql
SELECT
    category,
    gender,
    COUNT(*) AS total_trans
FROM retail
GROUP BY category, gender;
```

7. **Write a SQL query to calculate the average sale for each month and find out the best-selling month in each year:**

```sql
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
```

8. **Write a SQL query to find the top 5 customers based on the highest total sales:**

```sql
SELECT
    customer_id,
    SUM(total_sale) AS total_sales
FROM retail
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;
```

9. **Write a SQL query to find the number of unique customers who purchased items from each category:**

```sql
SELECT
    category,
    COUNT(DISTINCT customer_id) AS cnt_unq_cs
FROM retail
GROUP BY category;
```

## Findings

- **Customer Demographics**: The dataset can be explored to understand customer information such as age and gender.
- **Category Performance**: Total sales and total orders can be compared across different product categories.
- **High-Value Transactions**: Transactions with a total sale amount greater than 1000 can be identified.
- **Sales Trends**: Monthly average sales can be analyzed to identify the highest-performing month in each year.
- **Customer Insights**: The analysis identifies the top 5 customers based on total sales and unique customers by category.

## Reports

- **Sales Summary**: A summary of total sales and order counts for each category.
- **Trend Analysis**: Insights into average sales across different months and years.
- **Customer Insights**: Reports on top customers and unique customer counts per category.
- **Transaction Analysis**: Analysis of high-value transactions and transaction distribution by gender and category.

## SQL Concepts Used

- `CREATE DATABASE`
- `CREATE TABLE`
- `DESCRIBE`
- `SELECT`
- `WHERE`
- `DISTINCT`
- `COUNT()`
- `COUNT(DISTINCT)`
- `SUM()`
- `AVG()`
- `GROUP BY`
- `ORDER BY`
- `LIMIT`
- `DATE_FORMAT()`
- `YEAR()`
- `MONTH()`
- Subqueries
- Window Functions
- `RANK()`
- `PARTITION BY`

## Conclusion

This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data exploration, and business-driven SQL queries. The project demonstrates how SQL can be used to analyze retail sales data, understand customer behavior, compare product categories, identify high-value transactions, and discover sales trends.

## How to Use

1. **Set Up the Database**: Run the database and table creation queries provided in this README file.
2. **Import the Dataset**: Import the retail sales CSV dataset into the `retail` table.
3. **Run the Queries**: Execute the SQL queries provided in this README to perform the analysis.
4. **Explore and Modify**: Modify the queries to explore different aspects of the dataset or answer additional business questions.

## Repository Structure

```text
retail-sales-analysis-sql-project/
│
├── README.md
├── SQL - Retail Sales Analysis_utf .csv
└── retail sales analysis sql project.sql
```

## Tools Used

- **MySQL**
- **MySQL Workbench**
- **SQL**
- **GitHub**
- **CSV Dataset**

## GitHub Repository

This project is available on GitHub:

https://github.com/Bhavani22246/retail-sales-analysis-sql-project

## Author - Bhavani Kulkarni

This project is part of my portfolio, showcasing the SQL skills I have developed as part of my Data Analytics learning journey. It demonstrates my ability to work with retail sales data, perform data exploration, analyze sales and customer information, and solve business-oriented questions using MySQL.

Thank you for checking out my project!
