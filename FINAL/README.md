# 📊 Final Project

> A comprehensive SQL project that synthesizes CRUD operations, Joins, Subqueries, Aggregations, Date & String Manipulation, Window Functions, and the CASE expression to build a functional.

![SQL](https://img.shields.io/badge/SQL-Advanced-blue?style=for-the-badge&logo=mysql)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)

---

## 📌 Project Overview

The **Final Project** is a complete relational database system. It brings together five interconnected modules — Students, Courses, Instructors, Enrollments, and Departments — to simulate how a real university would track student registrations, course offerings, faculty assignments, and enrollment history.

Rather than treating each SQL topic in isolation, this project ties them together into one functional system, reflecting how SQL is actually used in production: managing records (CRUD), linking related entities (Joins), filtering and aggregating for insights, and generating computed/reported values (window functions, CASE expressions).

---

## 🎯 Objective

The objective of this project is to synthesize and apply a broad range of SQL concepts through a full database design and query-execution workflow. It focuses on:

- 🔄 **CRUD Operations** — Create, Read, Update, and Delete records
- 🔗 **Joins** — combining data across five related tables
- 🔍 **Subqueries** — nested queries for filtering based on aggregated conditions
- 📊 **Aggregations** — `COUNT()`, `AVG()`, `MAX()`, `GROUP BY`, `HAVING`
- 📅 **Date Functions** — extracting and comparing enrollment/birth dates
- ✂️ **String Functions** — formatting names for readable output
- 🪟 **Window Functions** — running totals over enrollment data
- 🎛️ **CASE Expressions** — categorizing students by enrollment seniority

By the end of this project, one should be able to confidently design a multi-table relational schema and write production-style SQL queries that answer real business questions.

---

## 🗂️ Database Schema

The database `Final` consists of five core tables:

### 1️⃣ Students Table

| Column | Type | Description |
|---|---|---|
| StudentID | INT (PK, AUTO_INCREMENT) | Unique student identifier |
| FirstName | VARCHAR(20) | Student's first name |
| LastName | VARCHAR(20) | Student's last name |
| Email | VARCHAR(30) | Student's email address |
| BirthDate | DATE | Student's date of birth |
| EnrollmentDate | DATE | Date the student enrolled |

### 2️⃣ Courses Table

| Column | Type | Description |
|---|---|---|
| CourseID | INT (PK) | Unique course identifier |
| CourseName | VARCHAR(30) | Name of the course |
| DepartmentID | INT (FK) | References Departments table |
| Credits | INT | Number of credits for the course |

### 3️⃣ Instructors Table

| Column | Type | Description |
|---|---|---|
| InstructorID | INT (PK, AUTO_INCREMENT) | Unique instructor identifier |
| FirstName | VARCHAR(20) | Instructor's first name |
| LastName | VARCHAR(20) | Instructor's last name |
| Email | VARCHAR(30) | Instructor's email address |
| DepartmentID | INT (FK) | References Departments table |
| Salary | DECIMAL(10,2)| Instructor's Salary

### 4️⃣ Enrollments Table

| Column | Type | Description |
|---|---|---|
| EnrollmentID | INT (PK, AUTO_INCREMENT) | Unique enrollment identifier |
| StudentID | INT (FK) | References Students table |
| CourseID | INT (FK) | References Courses table |
| EnrollmentDate | DATE | Date of enrollment in the course |

### 5️⃣ Departments Table

| Column | Type | Description |
|---|---|---|
| DepartmentID | INT (PK) | Unique department identifier |
| DepartmentName | VARCHAR(30) | Name of the department |

---

## 🛠️ SQL Concepts Used

| Category | Concepts Covered |
|---|---|
| 🔄 CRUD Operations | `INSERT`, `SELECT`, `UPDATE`, `DELETE` |
| 🔗 Joins | `INNER JOIN`, `LEFT JOIN` |
| 🔍 Subqueries | Nested queries with `IN`, `GROUP BY`, `HAVING` |
| 📊 Aggregations | `COUNT()`, `AVG()`, `MAX()`, `GROUP BY`, `HAVING` |
| 📅 Date Functions | `YEAR()`, date comparisons |
| ✂️ String Functions | `CONCAT()` |
| 🪟 Window Functions | `SUM() OVER()` (running total) |
| 🎛️ Conditional Logic | `CASE WHEN` expressions |

---

## 📋 Queries & Output

| # | Task | Output |
|---|---|---|
| 1 | Perform CRUD operations (Create, Read, Update, Delete) on the Students table | [`CRUD Operations`](outputs/01_crud_operations.png) |
| 2 | Retrieve students who enrolled after 2022 | [`WHERE Clause`](outputs/02_students_after_2022.png) |
| 3 | Retrieve courses offered by the Computer Science department (limit 5) | [`INNER JOIN + LIMIT`](outputs/03_cs_courses_limit5.png) |
| 4 | Get the number of students enrolled in each course, filtering for courses with more than 5 students | [`GROUP BY + HAVING1`](outputs/04_students_per_course.png) |
| 5 | Find students who are enrolled in both Introduction to SQL and Data Structures | [`Subquery1`](outputs/05_students_both_courses.png) |
| 6 | Find students who are enrolled in either Introduction to SQL or Data Structures | [`Subquery2`](outputs/06_students_either_course.png) |
| 7 | Calculate the average number of credits for all courses | [`Aggregate Function1`](outputs/07_average_credits.png) |
| 8 | Find the maximum salary of instructors in the Computer Science department | [`Aggregate Function2`](outputs/08_max_salary_cs.png) |
| 9 | Count the number of students enrolled in each department | [`GROUP BY + HAVING2`](outputs/09_students_per_department.png) |
| 10 | INNER JOIN: Retrieve students and their corresponding courses | [`INNER JOIN`](outputs/10_inner_join.png) |
| 11 | LEFT JOIN: Retrieve all students and their corresponding courses, if any | [`LEFT JOIN`](outputs/11_left_join.png) |
| 12 | Subquery: Find students enrolled in courses that have more than 10 students | [Subquery3](outputs/12_subquery_popular_courses.png) |
| 13 | Extract the year from the EnrollmentDate of students | [`Date Function1`](outputs/13_year_extract.png) |
| 14 | Concatenate the instructor's first name and last name | [`String Function1`](outputs/14_concat_names.png) |
| 15 | Calculate the running total of students enrolled in courses | [`Window Function1`](outputs/15_running_total.png) |
| 16 | Label students as "Senior" or "Junior" based on their enrollment year | [`CASE Expression1`](outputs/16_senior_junior_case.png) |

---

## 🎓 Learning Outcomes

By completing this project, the following practical skills were developed:

- ✅ Designing a normalized, multi-table relational schema with proper foreign key relationships
- ✅ Performing full CRUD operations to manage data lifecycle
- ✅ Combining data from up to three related tables using `INNER JOIN` and `LEFT JOIN`
- ✅ Writing subqueries and using `GROUP BY` / `HAVING` to filter on aggregated conditions
- ✅ Applying aggregate functions (`COUNT`, `AVG`, `MAX`) to summarize data for reporting
- ✅ Extracting and comparing date values for enrollment analysis
- ✅ Formatting text data using string functions like `CONCAT()`
- ✅ Using window functions to compute running totals without collapsing rows
- ✅ Applying `CASE` logic to categorize records based on business rules

---

## 👨‍💻 Author

 **Manav Patel**

📧 manavpatel.tech@gmail.com

🔗 [GitHub](https://github.com/techmanavp)

---


