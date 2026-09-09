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
DESCRIBE retail;

SELECT COUNT(*) AS total_rows
FROM retail;

select * from retail;

select count(distinct customer_id) from retail;
select count(distinct category) from retail;
select distinct category from retail;

select * from retail
where sale_date="2022-11-05";

SELECT *
FROM retail
WHERE category = 'Clothing'
  AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
  AND quantity >= 4;
  
select category,
sum(total_sale) as net_sale,
count(*) as total_orders
from retail
group by category;

select avg(age) from retail
where category="Beauty";

select * from retail
where total_sale>1000;

select category,gender,count(*) as total_trans
from retail
group by category,gender

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

SELECT 
    customer_id,
    SUM(total_sale) AS total_sales
FROM retail
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

select category,
count(distinct customer_id) as cnt_unq_cs
from retail
group by category