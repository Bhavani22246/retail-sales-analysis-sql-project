# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales Analysis  
**Level**: Beginner  
**Database**: `sql_project_p1`

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify missing values and ensure the data is suitable for analysis.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project uses a database named `sql_project_p1`.
- **Table Creation**: A table named `retail` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
CREATE DATABASE sql_project_p1;

USE sql_project_p1;

CREATE TABLE retail
(
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

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset.

```sql
SELECT COUNT(*) AS total_rows
FROM retail;

SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM retail;

SELECT COUNT(DISTINCT category) AS category_count
FROM retail;

SELECT DISTINCT category
FROM retail;

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
```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

1. **Write a SQL query to retrieve all columns for sales made on '2022-11-05':**

```sql
SELECT *
FROM retail
WHERE sale_date = '2022-11-05';
```

2. **Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:**

```sql
SELECT *
FROM retail
WHERE category = 'Clothing'
  AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
  AND quantity >= 4;
```

3. **Write a SQL query to calculate the total sales (total_sale) for each category:**

```sql
SELECT
    category,
    SUM(total_sale) AS net_sale,
    COUNT(*) AS total_orders
FROM retail
GROUP BY category
ORDER BY net_sale DESC;
```

4. **Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category:**

```sql
SELECT
    ROUND(AVG(age), 2) AS avg_age
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
    COUNT(*) AS total_transactions
FROM retail
GROUP BY category, gender
ORDER BY category, gender;
```

7. **Write a SQL query to calculate the average sale for each month and find the best-selling month in each year:**

```sql
SELECT
    year,
    month,
    avg_sale
FROM
(
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
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail
GROUP BY category
ORDER BY unique_customers DESC;
```

10. **Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):**

```sql
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
```

## Findings

- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the number of unique customers across different categories.
- **Shift Analysis**: Order counts can be compared across Morning, Afternoon, and Evening shifts to understand customer purchasing patterns.

## Reports

- **Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
- **Trend Analysis**: Insights into sales trends across different months and shifts.
- **Customer Insights**: Reports on top customers and unique customer counts per category.

## Conclusion

This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.

## How to Use

1. **Clone the Repository**: Clone this project repository from GitHub.
2. **Set Up the Database**: Create the `sql_project_p1` database and `retail` table using the SQL script provided in the repository.
3. **Import the Dataset**: Import the retail sales CSV dataset into the `retail` table.
4. **Run the Queries**: Open the SQL project file and run the queries to perform the analysis.
5. **Explore and Modify**: Feel free to modify the queries to explore different aspects of the dataset or answer additional business questions.

## Author - Bhavani Kulkarni

This project is part of my portfolio, showcasing my SQL skills and my learning journey toward becoming a data analyst. The project demonstrates practical experience with MySQL, data exploration, data cleaning, and business-focused SQL analysis.

### Repository

- **GitHub**: https://github.com/Bhavani22246/retail-sales-analysis-sql-project.git

Thank you for checking out my project!
