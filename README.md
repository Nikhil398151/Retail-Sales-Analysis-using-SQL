# 🛒 Retail Sales Analysis | SQL Project

## 📌 Project Overview

This project focuses on analyzing retail sales data using SQL to generate meaningful business insights.  
The dataset contains transaction-level sales records including customer demographics, product categories, and revenue details.

The objective of this project is to demonstrate strong SQL skills in:
- Data Cleaning
- Data Exploration
- Business Problem Solving
- Aggregations & Window Functions
- Time-Based Analysis

---

## 🗂️ Database Information

**Database Name:** `project_with_learning`  
**Table Name:** `retail_sales`

---

## 📊 Table Structure

| Column Name       | Data Type | Description |
|-------------------|----------|-------------|
| transactions_id   | INT (PK) | Unique transaction ID |
| sale_date         | DATE     | Date of sale |
| sale_time         | TIME     | Time of sale |
| customer_id       | INT      | Unique customer ID |
| gender            | VARCHAR  | Customer gender |
| age               | INT      | Customer age |
| category          | VARCHAR  | Product category |
| quantiy           | INT      | Quantity sold |
| price_per_unit    | FLOAT    | Price per unit |
| cogs              | FLOAT    | Cost of goods sold |
| total_sale        | FLOAT    | Total transaction amount |

---

## 🧹 Data Cleaning Process

The following steps were performed before analysis:

- Checked for NULL values across all columns
- Removed incomplete or invalid records
- Verified total record count after cleaning

This ensures accuracy and reliability of insights.

---

## 📈 Business Questions & Analysis

The following key business problems were solved using SQL:

1. Retrieve all sales made on a specific date (2022-11-05)
2. Identify Clothing category transactions in November 2022 with quantity ≥ 4
3. Calculate total sales and total orders per category
4. Find average age of customers who purchased from the Beauty category
5. Retrieve transactions where total sales exceeded 1000
6. Analyze total transactions by gender in each category
7. Determine the best-selling month in each year (using Window Functions)
8. Identify top 5 customers based on total spending
9. Count unique customers per category
10. Analyze sales distribution by time shift:
    - Morning (<12)
    - Afternoon (12–17)
    - Evening (>17)

---

## 🛠️ SQL Concepts Used

- SELECT, WHERE
- GROUP BY
- ORDER BY
- COUNT(), SUM(), AVG()
- DISTINCT
- CASE WHEN
- EXTRACT() (Date functions)
- CTE (WITH Clause)
- Window Functions (RANK)

---

## 📊 Key Insights

- Identified top revenue-generating customers
- Determined best-performing months each year
- Analyzed customer purchasing behavior by gender
- Observed time-based sales trends
- Compared sales performance across product categories

---

## 🚀 How to Run This Project

1. Create the database:
   ```sql
   CREATE DATABASE project_with_learning;
