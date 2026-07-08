# 🛒 E-Commerce Order Management System (SQL)

> A full-scale SQL project simulating a real **E-Commerce Order Management System**, covering product catalogs, customers, orders, payments, and shipping — built with CRUD operations, joins, subqueries, window functions, and SQL CASE logic.

![SQL](https://img.shields.io/badge/SQL-Advanced-blue?style=for-the-badge&logo=mysql)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)

---

## 📌 Project Overview

The **E-Commerce Order Management System** is a comprehensive SQL project that models how an online store manages its day-to-day operations — from product listings and customer registrations to order placement, payment tracking, and shipment status.

Built entirely in **MySQL**, this project goes beyond isolated exercises and instead simulates a real administrative backend: an admin should be able to manage products and categories, track customers and their order history, monitor payments and shipping, and analyze sales performance — all through SQL.

---

## 🎯 Objective

Develop an E-Commerce Order Management System where an administrator can:

1. 📦 **Manage Products & Categories** — add, update, delete, and search products
2. 👤 **Manage Customers** — store customer details and order history
3. 🧾 **Handle Orders** — place, track, and cancel orders
4. 💳 **Manage Payments & Shipping** — track payment status and shipment progress
5. 📊 **Analyze Sales Data** — identify best-selling products, total revenue, and customer spending patterns

The project covers CRUD operations, filtering, sorting, aggregation, key relationships, joins, subqueries, and advanced SQL functions.

---

## 🗂️ Database Schema

The database `ecommerce` consists of seven interconnected tables:

### 1️⃣ Categories

| Column | Type | Description |
|---|---|---|
| CategoryID | INT (PK, AUTO_INCREMENT) | Unique category identifier |
| Category_Name | VARCHAR(20) | Name of the category |

### 2️⃣ Products

| Column | Type | Description |
|---|---|---|
| ProductID | VARCHAR(10) (PK) | Unique product identifier |
| Name | VARCHAR(50) | Product name |
| CategoryID | INT (FK) | References Categories table |
| Price | DECIMAL(10,2) | Product price |
| Stock_Quantity | INT | Units available in stock |
| Added_Date | DATE | Date the product was added |

### 3️⃣ Customers

| Column | Type | Description |
|---|---|---|
| CustomerID | VARCHAR(10) (PK) | Unique customer identifier |
| Name | VARCHAR(20) | Customer's name |
| Email | VARCHAR(50) | Customer's email address |
| Phone_Number | BIGINT | Customer's phone number |
| Address | VARCHAR(50) | Customer's address |
| Registration_Date | DATE | Date the customer registered |

### 4️⃣ Orders

| Column | Type | Description |
|---|---|---|
| OrderID | INT (PK) | Unique order identifier |
| CustomerID | VARCHAR(10) (FK) | References Customers table |
| Order_Date | DATE | Date the order was placed |
| Total_Amount | DECIMAL(10,2) | Total value of the order |
| Status | VARCHAR(15) | `Pending`, `Shipped`, `Delivered`, `Cancelled` |

### 5️⃣ Order_Item

| Column | Type | Description |
|---|---|---|
| Order_ItemID | INT (PK) | Unique order-item identifier |
| OrderID | INT (FK) | References Orders table |
| ProductID | VARCHAR(10) (FK) | References Products table |
| Quantity | INT | Quantity of the product ordered |
| Subtotal | DECIMAL(10,2) | Line-item subtotal |

### 6️⃣ Payments

| Column | Type | Description |
|---|---|---|
| PaymentID | INT (PK, AUTO_INCREMENT) | Unique payment identifier |
| OrderID | INT (FK) | References Orders table |
| Payment_Date | DATE | Date payment was made |
| Payment_Method | VARCHAR(20) | `Credit Card`, `PayPal`, `UPI` |
| Payment_Status | VARCHAR(20) | `Paid`, `Pending`, `Failed` |

### 7️⃣ Shipping

| Column | Type | Description |
|---|---|---|
| ShipingID | INT (PK, AUTO_INCREMENT) | Unique shipping record identifier |
| OrderID | INT (FK) | References Orders table |
| Shipping_Date | DATE | Date the order was dispatched |
| Delivery_Date | DATE | Date the order was delivered |
| Shipping_Status | VARCHAR(30) | `Dispatched`, `In Transit`, `Delivered` |

**Entity Relationship:**

```
Categories (1) ──< (Many) Products
Customers  (1) ──< (Many) Orders
Orders     (1) ──< (Many) Order_Item >── (Many) Products
Orders     (1) ──< (1) Payments
Orders     (1) ──< (1) Shipping
```

---

## 🛠️ SQL Concepts Used

| Category | Concepts Covered |
|---|---|
| 🔄 CRUD Operations | `INSERT`, `UPDATE`, `DELETE`, `SELECT` |
| 🔍 Clauses | `WHERE`, `HAVING`, `LIMIT` |
| ⚙️ Operators | `AND`, `OR`, `NOT` |
| ↕️ Sorting & Grouping | `ORDER BY`, `GROUP BY` |
| 📊 Aggregate Functions | `SUM()`, `AVG()`, `COUNT()` |
| 🔗 Key Relationships | Primary Key & Foreign Key constraints |
| 🔗 Joins | `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `UNION` (simulating `FULL OUTER JOIN`) |
| 🔍 Subqueries | Nested `SELECT` with `IN`, `NOT IN`, and aggregated `HAVING` |
| 📅 Date & Time Functions | `MONTHNAME()`, `DATEDIFF()`, `DATE_FORMAT()`, `CURDATE()`, `INTERVAL` |
| ✂️ String Functions | `UPPER()`, `TRIM()` |
| 🪟 Window Functions | `RANK() OVER()`, `SUM() OVER()`, `COUNT() OVER()` (running & cumulative totals) |
| 🎛️ Conditional Logic | `CASE WHEN` expressions, `COALESCE()` |

---

## 📋 Queries Performed & Output

| # | Task | Concept | Output |
|---|---|---|---|
| 1 | Insert new Products, Customers, and Orders into the database [ `CRUD` ] (outputs/01_insert_records.png) |
| 2 | Update stock when an order is placed [ `CRUD` ] (outputs/02_update_stock.png) |
| 3 | Delete orders that were cancelled more than 30 days ago [ `CRUD` ] (outputs/03_delete_old_cancelled.png) |
| 4 | Find all orders placed in the last 6 months [ `WHERE` ] (outputs/04_orders_last_6_months.png) |
| 5 | Get the top 5 highest-priced products [ `LIMIT` ] (outputs/05_top5_highest_priced.png) |
| 6 | Find customers who have placed more than 2 orders [ `HAVING` ] (outputs/06_customers_more_than_2_orders.png) |
| 7 | Get orders where Status = 'Pending' AND Payment_Status = 'Paid' [ `AND` ] (outputs/07_pending_paid_orders.png) |
| 8 | Find all products that are NOT out of stock [ `NOT` ] (outputs/08_products_not_out_of_stock.png) |
| 9 | Retrieve customers who registered after 2026 OR made purchases above ₹10,000 [ `OR` ] (outputs/09_customers_2026_or_10000.png) |
| 10 | List all products sorted by price in descending order [ `ORDER BY` ] (outputs/10_products_sorted_by_price.png) |
| 11 | Display the number of orders placed by each customer [ `GROUP BY` ] (outputs/11_orders_per_customer.png) |
| 12 | Show total revenue generated per category [ `GROUP BY` ] (outputs/12_revenue_per_category.png) |
| 13 | Find the total revenue generated by the store [ `SUM()` ] (outputs/13_total_revenue.png) |
| 14 | Identify the most purchased product [ `ORDER BY` + `LIMIT` ] (outputs/14_most_purchased_product.png) |
| 15 | Calculate the average order value [ `AVG()` ] (outputs/15_average_order_value.png) |
| 16 | Ensure orders are linked to customers and products (via Order_Item) [ `PK/FK` ] (outputs/16_orders_linked_pk_fk.png) |
| 17 | Establish relationship between payments and orders (`SHOW CREATE TABLE`) [ `PK/FK` ] (outputs/17_payments_orders_pk_fk.png) |
| 18 | Retrieve a list of products along with their category names [ `INNER JOIN` ] (outputs/18_inner_join_products_categories.png) |
| 19 | Get all orders with customer details [ `LEFT JOIN` ] (outputs/19_left_join_orders_customers.png) |
| 20 | Find orders that haven't been shipped [ `RIGHT JOIN` ] (outputs/20_right_join_unshipped_orders.png) |
| 21 | Show customers who have never placed an order [ `UNION` (Full Outer Join) ] (outputs/21_full_outer_join_no_orders.png) |
| 22 | Find orders placed by customers who registered after 2025 [ Subquery1 ] (outputs/22_subquery_orders_after_2025.png) |
| 23 | Identify the customer who has spent the most [ Subquery2 ] (outputs/23_subquery_top_spender.png) |
| 24 | Get products that have never been ordered [ Subquery3 ] (outputs/24_subquery_never_ordered.png) |
| 25 | Extract the month from Order_Date to count orders per month [ Date Function1 ] (outputs/25_month_extract_orders.png) |
| 26 | Calculate delivery time (difference between Shipping_Date and Delivery_Date) [ Date Function2 ] (outputs/26_delivery_time_diff.png) |
| 27 | Format Order_Date as DD-MM-YYYY [ Date Function3 ] (outputs/27_order_date_format.png) |
| 28 | Convert all product names to uppercase [ String Function1 ] (outputs/28_product_names_uppercase.png) |
| 29 | Trim whitespace from customer names [ String Function2 ] (outputs/29_trim_customer_names.png) |
| 30 | Replace missing email values with "Not Provided" [ String Function3 ] (outputs/30_replace_missing_email.png) |
| 31 | Rank customers based on total spending [ Window Function1 ] (outputs/31_rank_customers_spending.png) |
| 32 | Show the cumulative total revenue per month [ Window Function2 ] (outputs/32_cumulative_revenue_month.png) |
| 33 | Display the running total of orders placed [ Window Function3 ] (outputs/33_running_total_orders.png) |
| 34 | Assign a Loyalty_Status to customers (Gold / Silver / Bronze) [ CASE Expression1 ] (outputs/34_case_loyalty_status.png) |
| 35 | Categorize products based on units sold [ CASE Expression2 ] (outputs/35_case_product_category.png) |

---

## 🎓 Learning Outcomes

By completing this project, the following practical skills were developed:

- ✅ Designing a normalized, multi-table e-commerce schema with proper primary/foreign key relationships across seven tables
- ✅ Performing complete CRUD operations to manage the full product-to-order lifecycle
- ✅ Filtering and combining conditions using `WHERE`, `HAVING`, `LIMIT`, and logical operators (`AND`/`OR`/`NOT`)
- ✅ Sorting and grouping data to generate summarized business reports
- ✅ Applying aggregate functions to calculate revenue and order values
- ✅ Combining data across multiple related tables using `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and simulating a `FULL OUTER JOIN` with `UNION`
- ✅ Writing subqueries to answer layered business questions
- ✅ Manipulating date and time values for delivery and order-frequency analysis
- ✅ Cleaning and standardizing text data using string functions
- ✅ Using window functions to rank customers and compute running/cumulative totals
- ✅ Applying `CASE` logic to segment customers and products into meaningful business categories

---

## 👨‍💻 Author

**Manav Patel**

📧 manavpatel.tech@gmail.com

🔗 [GitHub](https://github.com/techmanavp)
