-- CREATING DATABASE:
CREATE DATABASE DataTransformer_2;

-- USE DATABASE:
USE DataTransformer_2;

-- CREATE TABLE (Customers):
CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    RegistrationDate DATE
);

-- INSERTING RECORDS:
INSERT INTO Customers (FirstName, LastName, Email, RegistrationDate) VALUES
('John', 'Doe', 'john.doe@email.com', '2022-03-15'),
('Jane', 'Smith', 'jane.smith@email.com', '2021-11-02'),
('Michael', 'Johnson', 'michael.johnson@email.com', '2023-01-10'),
('Emily', 'Brown', 'emily.brown@email.com', '2022-07-21'),
('David', 'Williams', 'david.williams@email.com', '2021-09-18'),
('Sarah', 'Jones', 'sarah.jones@email.com', '2023-04-05'),
('Daniel', 'Garcia', 'daniel.garcia@email.com', '2022-12-11'),
('Olivia', 'Miller', 'olivia.miller@email.com', '2021-06-25'),
('James', 'Davis', 'james.davis@email.com', '2023-02-14'),
('Sophia', 'Rodriguez', 'sophia.rodriguez@email.com', '2022-08-30'),
('William', 'Martinez', 'william.martinez@email.com', '2021-10-09'),
('Isabella', 'Hernandez', 'isabella.hernandez@email.com', '2023-05-19'),
('Benjamin', 'Lopez', 'benjamin.lopez@email.com', '2022-01-27'),
('Mia', 'Gonzalez', 'mia.gonzalez@email.com', '2021-12-14'),
('Lucas', 'Wilson', 'lucas.wilson@email.com', '2023-06-08'),
('Charlotte', 'Anderson', 'charlotte.anderson@email.com', '2022-09-03'),
('Henry', 'Thomas', 'henry.thomas@email.com', '2021-08-22'),
('Amelia', 'Taylor', 'amelia.taylor@email.com', '2023-03-17'),
('Alexander', 'Moore', 'alexander.moore@email.com', '2022-11-29'),
('Evelyn', 'Jackson', 'evelyn.jackson@email.com', '2021-05-12');

------------------------------------------------------------------------------------------------------------------------------------

-- CREATE TABLE(Orders):
CREATE TABLE Orders(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- INSERTING RECORDS:
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75),
(103, 1, '2023-07-05', 320.00),
(104, 4, '2023-07-06', 450.25),
(105, 5, '2023-07-08', 99.99),
(106, 2, '2023-07-10', 275.50),
(107, 7, '2023-07-12', 180.00),
(108, 8, '2023-07-14', 220.40),
(109, 5, '2023-07-15', 145.75),
(110, 10, '2023-07-17', 399.99),
(111, 1, '2023-07-18', 250.00),
(112, 12, '2023-07-20', 310.60),
(113, 13, '2023-07-21', 175.80),
(114, 8, '2023-07-23', 500.00),
(115, 15, '2023-07-24', 130.45),
(116, 2, '2023-07-25', 275.90),
(117, 17, '2023-07-26', 90.00),
(118, 18, '2023-07-27', 410.35),
(119, 10, '2023-07-29', 225.25),
(120, 5, '2023-07-30', 350.75);

------------------------------------------------------------------------------------------------------------------------------------

-- CREATE TABLE (Employees):
CREATE TABLE Employees(
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Department VARCHAR(20) NOT NULL,
    HireDate DATE,
    Salary DECIMAL(10,2)
);

-- INSERTING RECORDS:
INSERT INTO Employees (FirstName, LastName, Department, HireDate, Salary) VALUES
('Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
('Susan', 'Lee', 'HR', '2021-03-20', 55000.00),
('David', 'Smith', 'IT', '2019-07-10', 68000.00),
('Emily', 'Brown', 'Finance', '2022-02-18', 60000.00),
('Michael', 'Davis', 'Sales', '2020-11-05', 52000.00),
('Jessica', 'Wilson', 'Marketing', '2021-06-12', 48000.00),
('Daniel', 'Taylor', 'IT', '2018-09-25', 75000.00),
('Ashley', 'Anderson', 'HR', '2023-01-08', 47000.00),
('James', 'Thomas', 'Finance', '2020-04-30', 62000.00),
('Olivia', 'Martin', 'Marketing', '2022-08-19', 51000.00),
('Robert', 'Jackson', 'Operations', '2019-12-11', 58000.00),
('Sophia', 'White', 'Sales', '2021-09-14', 49000.00),
('William', 'Harris', 'IT', '2017-05-22', 82000.00),
('Isabella', 'Clark', 'Finance', '2023-03-27', 54000.00),
('Benjamin', 'Lewis', 'Operations', '2020-07-16', 57000.00),
('Mia', 'Walker', 'HR', '2022-10-09', 50000.00),
('Ethan', 'Hall', 'Marketing', '2021-12-01', 53000.00),
('Charlotte', 'Allen', 'Sales', '2018-06-21', 61000.00),
('Alexander', 'Young', 'IT', '2022-05-13', 67000.00),
('Amelia', 'King', 'Finance', '2019-11-29', 65000.00);

------------------------------------------------------------------------------------------------------------------------------------


--              QUERIES             --

-- Q-1 INNER JOIN: Retrive all orders and customer details where orders exist.
SELECT c.CustomerID, c.FirstName, c.LastName, c.Email, c.RegistrationDate, o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers AS c 
INNER JOIN Orders AS o 
ON c.CustomerID = o.CustomerID;

-- Q-2 LEFT JOIN: Retrive all customers and their corresponding orders(if any)
SELECT c.CustomerID, c.FirstName, c.LastName, c.Email, c.RegistrationDate, o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.CustomerID = o.CustomerID;

-- Q-3 RIGHT JOIN: Retrive all orders and their corresponding customers (if any)
SELECT c.CustomerID, c.FirstName, c.LastName, c.Email, c.RegistrationDate, o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers AS c
RIGHT JOIN Orders AS o
ON c.CustomerID = o.CustomerID;

-- Q-4 FULL OUTER JOIN: Retrive all customers and all orders, regardless of matching.
SELECT c.CustomerID, c.FirstName, c.LastName, c.Email, c.RegistrationDate, o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.CustomerID = o.CustomerID

UNION

SELECT c.CustomerID, c.FirstName, c.LastName, c.Email, c.RegistrationDate, o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers AS c
RIGHT JOIN Orders AS o
ON c.CustomerID = o.CustomerID;

-- Q-5 Subquery to find customers who have placed orders worth more than than the average amount.
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING SUM(o.TotalAmount) > (SELECT AVG(TotalAmount) FROM Orders);

-- Q-6 Subquery to find employees with salaries above the average salary.
SELECT * FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- Q-7 Extract the year and month from the OrderDate.
SELECT OrderID, YEAR(OrderDate) AS YEAR, MONTHNAME(OrderDate) AS MONTH FROM Orders;

-- Q-8 Calculate the difference between two dates (orderdate and current date):
SELECT OrderID, OrderDate,
TIMESTAMPDIFF(DAY, OrderDate, CURDATE()) AS DaysDifference,
TIMESTAMPDIFF(MONTH, OrderDate, CURDATE()) AS MonthsDifference,
TIMESTAMPDIFF(YEAR, OrderDate, CURDATE()) AS YearsDifference
FROM Orders;

-- Q-9 Format the OrderDate to a more redable fromat("DD-MM-YYYY"):
SELECT OrderID, DATE_FORMAT(OrderDate, '%d-%m-%Y') AS OrderDate FROM Orders;

-- Q-10 Concatnate FirstName and LastName to Form of full name:
SELECT CustomerID,
CONCAT(FirstName, " ", LastName) AS FullName,
Email,
RegistrationDate FROM Customers;

-- Q-11 Replace part of a string (ex, replace john with jonathan):
SELECT customerID, REPLACE (FirstName, "John", "Jonathan") AS UpdatedName,
LastName, Email, RegistrationDate FROM Customers;

-- Q-12 Conver FirstName to Uppercase and LastName to lowercase:
SELECT CustomerID, 
    UPPER(FirstName) AS uppercase,
    LOWER(LastName) AS lowercase
FROM Customers;

-- Q-13 Trim extra spaces from the email field:
SELECT TRIM(Email) FROM Customers;

-- Q-14 Calculate the running total of totalamount of each order:
SELECT OrderID, OrderDate, TotalAmount,
SUM(TotalAmount) OVER (ORDER BY OrderDate) AS RunningTotal
FROM Orders;

-- Q-15 Rank orders based on totalamount for each order:
SELECT OrderID, OrderDate, TotalAmount,
RANK() OVER(ORDER BY TotalAmount DESC) AS Rank_Position
FROM Orders;

-- Q-16 Assign a discount based on totalamount in orders(ex, >1000= 10%, >500=5%)
SELECT OrderID, OrderDate, TotalAmount,
CASE
    WHEN TotalAmount > 350 THEN '10%'
    WHEN TotalAmount > 100 THEN '5%'
    ELSE '0%'
    END AS Discount
FROM Orders;

-- Q-17 Categories Employees's salaries as high, medium or low
SELECT *,
CASE
    WHEN Salary > 65000 THEN "HIGH"
    WHEN Salary BETWEEN 55000 AND 65000 THEN "MEDIUM"
    ELSE "LOW"
    END AS Salary_Pos
FROM Employees;
