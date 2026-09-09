# 📊 Retail Sales Analysis using SQL

## 📌 Project Overview

This project focuses on analyzing retail sales transaction data using **MySQL and SQL**.

The objective is to explore sales performance, customer behavior, product categories, and transaction patterns using SQL queries commonly used in data analytics.

This is a beginner-level portfolio project created to strengthen practical SQL and data analysis skills.

---

## 🎯 Objectives

- Set up a retail sales database using MySQL
- Explore and understand the dataset
- Identify missing values
- Analyze sales performance by product category
- Analyze customer purchasing behavior
- Identify high-value transactions
- Find top customers based on total sales
- Analyze monthly sales patterns
- Analyze transactions by gender and category
- Analyze customer counts across product categories
- Analyze orders by time of day

---

## 🛠️ Tools & Technologies

- **MySQL**
- **SQL**
- **MySQL Workbench**
- **GitHub**

---

## 📂 Dataset

The dataset contains retail transaction records with the following information:

| Column | Description |
|---|---|
| `transactions_id` | Unique transaction identifier |
| `sale_date` | Date of the transaction |
| `sale_time` | Time of the transaction |
| `customer_id` | Unique customer identifier |
| `gender` | Customer gender |
| `age` | Customer age |
| `category` | Product category |
| `quantity` | Number of products purchased |
| `price_per_unit` | Price per unit |
| `cogs` | Cost of goods sold |
| `total_sale` | Total value of the transaction |

---

## 🗄️ Database Setup

### Database

```sql
CREATE DATABASE IF NOT EXISTS sql_project_p1;
USE sql_project_p1;
