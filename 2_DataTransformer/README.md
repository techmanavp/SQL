# 📊 Data Transformer — SQL Practical Project

> A comprehensive SQL project demonstrating Joins, Subqueries, Date & String Manipulation, Window Functions, and CASE Expressions on a simulated **Corporate Data Analysis System**.

![SQL](https://img.shields.io/badge/SQL-Advanced-blue?style=for-the-badge&logo=postgresql)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)

---

## 📌 Project Overview

**Data Transformer** is a hands-on SQL practical built to strengthen real-world database querying skills. It simulates a **Corporate Data Analysis System** with three interconnected modules — Customer Information Management, Sales Transaction Processing, and Employee Performance Data.

The project moves beyond basic `SELECT` statements and dives into how data is actually **transformed, joined, filtered, and reported on** in professional environments — the same techniques used in analytics dashboards, business intelligence reports, and backend reporting systems.

---

## 🎯 Objective

The objective of this practical is to build practical, job-ready SQL skills by working through:

- 🔗 **Joins** — combining data across multiple related tables
- 🔍 **Subqueries** — nested queries for comparative analysis
- 📅 **Date Functions** — extracting and formatting temporal data
- ✂️ **String Functions** — cleaning and transforming text data
- 🪟 **Window Functions** — running totals and ranking
- 🎛️ **CASE Expressions** — conditional logic inside SQL

By the end of this project, one should be able to confidently write SQL that transforms raw relational data into meaningful, decision-ready information.

---

## 🗂️ Database Schema

The database `DataTransformer_2` consists of three core tables:

### 1️⃣ Customers Table

| Column | Type | Description |
|---|---|---|
| CustomerID | INT (PK) | Unique customer identifier |
| FirstName | VARCHAR | Customer's first name |
| LastName | VARCHAR | Customer's last name |
| Email | VARCHAR | Customer's email address |
| RegistrationDate | DATE | Date the customer registered |

### 2️⃣ Orders Table

| Column | Type | Description |
|---|---|---|
| OrderID | INT (PK) | Unique order identifier |
| CustomerID | INT (FK) | References Customers table |
| OrderDate | DATE | Date the order was placed |
| TotalAmount | DECIMAL | Total value of the order |

### 3️⃣ Employees Table

| Column | Type | Description |
|---|---|---|
| EmployeeID | INT (PK) | Unique employee identifier |
| FirstName | VARCHAR | Employee's first name |
| LastName | VARCHAR | Employee's last name |
| Department | VARCHAR | Department the employee belongs to |
| HireDate | DATE | Date of joining |
| Salary | DECIMAL | Employee's salary |

## 🛠️ SQL Concepts Used

| Category | Concepts Covered |
|---|---|
| 🔗 Joins | `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL OUTER JOIN` |
| 🔍 Subqueries | Correlated & non-correlated subqueries with `AVG()` |
| 📅 Date Functions | `EXTRACT()`, `DATEDIFF()`, `TO_CHAR()` / `FORMAT()` |
| ✂️ String Functions | `CONCAT()`, `REPLACE()`, `UPPER()`, `LOWER()`, `TRIM()` |
| 🪟 Window Functions | `SUM() OVER()` (running total), `RANK() OVER()` |
| 🎛️ Conditional Logic | `CASE WHEN` expressions |

---

## 📋 Queries & Outputs

| # | Task | Output |
|---|---|---|
| 1 | Retrieve all orders and customer details where orders exist | [`INNER JOIN`](outputs/01_inner_join.png) |
| 2 | Retrieve all customers and their corresponding orders (if any) | [`LEFT JOIN`](outputs/02_left_join.png) |
| 3 | Retrieve all orders and their corresponding customers (if any) | [`RIGHT JOIN`](outputs/03_right_join.png) |
| 4 | Retrieve all customers and all orders, regardless of matching | [`FULL OUTER JOIN`](outputs/04_full_outer_join.png) |
| 5 | Find customers who placed orders worth more than the average order amount | [`Subquery1`](outputs/05_subquery_customers.png) |
| 6 | Find employees with salaries above the average salary | [`Subquery2`](outputs/06_subquery_employees.png) |
| 7 | Extract the year and month from the OrderDate | [`Date Function1`](outputs/07_date_extract.png) |
| 8 | Calculate the difference in days between order date and current date | [`Date Function2`](outputs/08_date_diff.png) |
| 9 | Format the OrderDate to a more readable format (e.g., `DD-MMM-YYYY`) | [`Date Function3`](outputs/09_date_format.png) |
| 10 | Concatenate FirstName and LastName to form a full name | [`String Function1`](outputs/10_string_concat.png) |
| 11 | Replace part of a string (e.g., replace 'John' with 'Jonathan') | [`String Function2`](outputs/11_string_replace.png) |
| 12 | Convert FirstName to uppercase and LastName to lowercase | [`String Function3`](outputs/12_string_case.png) |
| 13 | Trim extra spaces from the Email field | [`String Function4`](outputs/13_string_trim.png) |
| 14 | Calculate the running total of TotalAmount for each order | [`Window Function1`](outputs/14_running_total.png) |
| 15 | Rank orders based on TotalAmount using the `RANK()` function | [`Window Function2`](outputs/15_rank_orders.png) |
| 16 | Assign a discount based on TotalAmount (e.g., >1000: 10% off, >500: 5% off) | [`CASE` Expression1](outputs/16_discount_case.png) |
| 17 | Categorize employees' salaries as high, medium, or low | [`CASE` Expression2](outputs/17_salary_case.png) |

---

## 👨‍💻 Author

**Manav Patel**
📧 manavpatel.tech@gmail.com
🔗 [GitHub](https://github.com/techmanavp) 

---

