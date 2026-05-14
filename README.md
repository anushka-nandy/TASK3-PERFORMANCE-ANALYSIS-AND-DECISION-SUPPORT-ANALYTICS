# Advanced Retail Sales Analytics & Business Intelligence Project

## 📌 Project Overview

This project was developed as part of a Data Analytics & Business Intelligence Internship. The objective of the project was to analyze retail sales data, generate meaningful business insights, perform advanced SQL analysis, and create an interactive executive-level dashboard using Excel, PostgreSQL, and Power BI.

The project focuses on understanding sales trends, profitability, customer behavior, category performance, and KPI-based business decision making.

---

# 🛠 Tools & Technologies Used

* Microsoft Excel
* PostgreSQL (pgAdmin)
* Power BI
* SQL
* DAX
* Data Visualization Techniques

---

# 📂 Dataset Information

The project uses a Superstore-style retail sales dataset containing information related to:

* Orders
* Customers
* Products
* Sales
* Profit
* Quantity
* Discounts
* Regions
* Categories
* Segments

---

# ✅ Project Workflow

## 1️⃣ Data Cleaning & Preparation (Excel)

* Removed duplicate records
* Handled missing values
* Standardized formatting
* Fixed inconsistent data
* Prepared clean dataset for analysis

---

## 2️⃣ SQL Data Analysis (PostgreSQL)

### SQL Concepts Used

* SELECT Statements
* WHERE Conditions
* GROUP BY
* ORDER BY
* HAVING Clause
* CASE Statements
* Subqueries
* Aggregate Functions
* DATE_TRUNC()
* LAG()
* Time Intelligence Analysis

### Analysis Performed

* Monthly Sales Analysis
* Profitability Analysis
* Product Performance Analysis
* Region-wise Sales Analysis
* Customer Contribution Analysis
* Month-over-Month Growth Analysis
* Variance Analysis
* KPI Calculations

---

# 📊 Excel Analysis

Using Pivot Tables and KPI calculations:

* Monthly Sales Summary
* Profit Trend Analysis
* Variance Calculation
* Growth % Calculation
* Performance Comparison Tables
* Segment Revenue Contribution
* Category-wise Analysis

---

# 📈 Power BI Dashboard

An interactive executive-level dashboard was created using Power BI.

## Dashboard Features

* KPI Cards
* Interactive Filters
* Dynamic Charts
* Time-based Analysis
* Business Performance Tracking

## KPI Cards Included

* Total Sales
* Total Profit
* Profit Margin
* Growth %
* Total Customers

## Visualizations Used

* Monthly Sales Trend
* Region vs Sales
* Category Profit Analysis
* Segment Revenue Contribution
* Top Customers Table



# 📌 DAX Measures Used

## Total Sales

DAX
Total Sales = SUM(task2_ot[Sales])


## Previous Month Sales

DAX
Previous Month Sales =
CALCULATE(
    [Total Sales],
    PREVIOUSMONTH(task2_ot[Order_Date])
)


## Growth %

DAX
Growth % =
DIVIDE(
    [Total Sales] - [Previous Month Sales],
    [Previous Month Sales],
    0
)

## Profit Margin

DAX
Profit Margin =
DIVIDE(SUM(task2_ot[Profit]), SUM(task2_ot[Sales]))


---

# 💡 Key Business Insights

* Identified top-performing regions and categories
* Analyzed impact of discounts on profitability
* Detected monthly sales growth patterns
* Evaluated profit margins across categories
* Found high-revenue customer segments
* Compared business performance over time

---

# 🎯 Project Objective

The main goal of this project is to demonstrate practical knowledge of:

* Data Cleaning
* SQL Analysis
* KPI Modeling
* Business Intelligence
* Dashboard Design
* Data-driven Decision Making

---

# 📁 Repository Contents

* Cleaned Dataset Files
* SQL Query Files
* Excel Analysis Files
* Power BI Dashboard (.pbix)
* Dashboard Screenshots
* Business Insight Report

---

# 🚀 Learning Outcomes

Through this project, I gained hands-on experience in:

* SQL Query Writing
* Data Analysis
* KPI Development
* Power BI Dashboarding
* Business Insight Generation
* Analytical Thinking
* Data Visualization

---

# 📌 Conclusion

This project helped in understanding how raw business data can be transformed into meaningful insights using analytics tools and visualization techniques. It also strengthened practical knowledge in SQL, Excel, and Power BI for real-world business analysis.

---
