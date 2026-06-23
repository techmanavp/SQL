-- Creating Database
CREATE DATABASE DataDigger_1;

--Use Database
USE DataDigger_1;

--Create Table (Customer)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50),
    Address VARCHAR(50)
);

-- Inserting Records
INSERT INTO Customers (Name, Email, Address)
VALUES 
("Anmol", "anmol@sample.com", "Orchid Park, Vadodara"),
("Kanan", "kanan@sample.com", "Aashray Residency, Ahmedabad"),
("Neha", "neha@sample.com", "Swaminarayan Park, Surat"),
("Jagjit", "jagjit@sample.com", "Godrej Garden City, Ahmedabad"),
("Deval", "deval@sample.com", "Raghuvir Symphony, Surat"),
("Tanaya", "tanaya@sample.com", "Shangri La Apartments, Vadodara"),
("Rahul", "rahul@sample.com", "Takshashila Air, Ahmedabad"),
("Bhavya", "bhavya@sample.com", "Swastik Enclave, Ahmedabad"),
("Hetvi", "hetvi@sample.com", "Altezza by The Palm, Gandhinagar"),
("Jay", "jay@sample.com", "Monalisa Residency, Vadodara");

-- Retrive all Customer Details
SELECT * FROM Customers;

-- Update a customer details
UPDATE Customers SET Address="Eklavya Residency, Mehsana" WHERE Name="Tanaya";

-- Delete a customer using their customerID
DELETE FROM Customers WHERE CustomerID=5;

-- Display all customers whose name is "Alice"
SELECT * FROM Customers WHERE Name="Alice";

-----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------

-- Creating Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);

-- Insert 10 Sample orders into the table
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES
(1, "2026-06-22", 1500),
(1, "2026-02-07", 990),
(2, "2026-06-18", 1325),
(4, "2026-01-17", 4999),
(4, "2026-01-26", 2100),
(4, "2026-05-01", 1895),
(6, "2026-04-30", 500),
(7, "2026-02-25", 2578),
(9, "2026-04-10", 3700),
(10, "2026-05-20", 2999);

-- Retrive all orders made by specific customers
SELECT * FROM Orders WHERE CustomerID = 4;

-- Update an order's total amount
UPDATE Orders SET TotalAmount=3200 WHERE OrderID=10;

-- Delete an order using its orderid;
DELETE FROM Orders WHERE OrderID=3;

--Retrive orders placed in the last 30 days;
SELECT * FROM Orders WHERE OrderDate >= "2026-05-22";

--Retrive the higest, lowest, and the avrage order amount using aggregate functions;
SELECT max(TotalAmount) AS Higest, min(TotalAmount) AS Lowest, avg(TotalAmount) AS Avrage FROM Orders;

-----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------

-- Creating Table
CREATE TABLE Products(
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(30) NOT NULL,
    Price DECIMAL(10,2),
    Stock INT 
);

-- Insert sample products into the table;
INSERT INTO Products (ProductName, Price, Stock)
VALUES
("Sardar Super Gold 500", 40, 50),
("Tea Special 1L", 75, 30),
("Punjabi Butter Milk", 20, 100),
("Sardar Shakti 500", 35, 60),
("Masala Butter Milk",20, 80),
("Dollar 5L", 350, 15),
("Tiger 2L", 140, 25),
("Tak Butter Milk",18, 90),
("Curd", 15, 100),
("Paneer", 90, 40);

-- Retrive all products sorted by price in decending order;
SELECT * FROM Products ORDER BY Price DESC;

--Update the price of a specific product;
UPDATE Products SET Price = 25 WHERE ProductName = "Punjabi Butter Milk";

--Delete a product if it is out of the stock;
DELETE FROM Products WHERE Stock = 0;

-- Retrive products whose price is between 50 - 500
SELECT * FROM Products WHERE Price BETWEEN 50 AND 500;

-- Retrive the most expensive and cheapest product using max() and min();
SELECT max(Price) AS Expensive, min(Price) AS Cheapest FROM Products;

-----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------


-- Creating OrderDetail Table;
CREATE TABLE OrderDetail(
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert smaple records into table;
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, SubTotal)
VALUES
(2, 3, 4, 100),
(4, 1, 50, 2000),
(5, 9, 10, 150),
(6, 2, 15, 1125),
(7, 6, 15, 5250),
(8, 5, 20, 400),
(9, 4, 10, 350),
(10, 7, 13, 1820),
(2, 8, 10, 180),
(6, 1, 3, 120);

-- Retrive all order details for a specific order;
SELECT *FROM OrderDetail WHERE OrderID = 2;

--Calculate the total revenue generated from all oriders using sum();
SELECT sum(SubTotal) AS Total_Revenue FROM OrderDetail;

-- Retrive the top 3 most order products;
SELECT ProductID, SUM(Quantity) AS TotalOrdered FROM OrderDetail GROUP BY ProductID ORDER BY TotalOrdered DESC LIMIT 3;

-- count how many times a specific product has been sold using count()
SELECT COUNT(*) AS Sold FROM OrderDetail WHERE ProductID = 1;