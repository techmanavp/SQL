-- CREATING DATABASE:
CREATE DATABASE ecommerce;

-- USE DATABASE:
USE ecommerce;

---------------------------------------------------------------------------------------------------------------------------------------------------

-- CREATING TABLE (Categories):
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    Category_Name VARCHAR(20) NOT NULL
);

-- INSERT RECORDS:
INSERT INTO Categories (Category_Name) VALUES
('Electronics'),
('Fashion'),
('Home & Kitchen'),
('Books'),
('Beauty'),
('Sports'),
('Groceries'),
('Toys'),
('Accessories'),
('Footwear');

---------------------------------------------------------------------------------------------------------------------------------------------------

-- CREATING TABLE (Products):
CREATE TABLE Products (
    ProductID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    CategoryID INT,
    Price DECIMAL(10,2),
    Stock_Quantity INT,
    Added_Date DATE,
    FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID)
);

-- INSERT RECORDS:
INSERT INTO Products (ProductID, Name, CategoryID, Price, Stock_Quantity, Added_Date) VALUES
("P101", 'iPhone 15', 1, 79999.00, 15, '2025-10-05'),
("P102", 'Samsung Smart TV 43 inch', 1, 32999.00, 8, '2025-08-15'),
("P103", 'Men Denim Jacket', 2, 2499.00, 25, '2026-01-12'),
("P104", 'Non-Stick Cookware Set', 3, 3499.00, 20, '2025-11-20'),
("P105", 'Atomic Habits', 4, 499.00, 40, '2025-12-10'),
("P106", 'Face Serum', 5, 899.00, 30, '2026-03-05'),
("P107", 'Yoga Mat', 6, 1299.00, 18, '2025-09-25'),
("P108", 'Basmati Rice 10kg', 7, 899.00, 0, '2026-02-01'),
("P109", 'Wireless Earbuds', 9, 2999.00, 22, '2026-04-18'),
("P110", 'Running Shoes', 10, 3999.00, 12, '2026-05-22');

---------------------------------------------------------------------------------------------------------------------------------------------------

-- CREATE TABLE (Customers):
CREATE TABLE Customers (
    CustomerID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(20) NOT NULL,
    Email VARCHAR(50),
    Phone_Number BIGINT NOT NULL,
    Address VARCHAR(50),
    Registration_Date DATE
);

-- INSERT RECORDS:
INSERT INTO Customers \ VALUES
("C101",'Rahul Sharma', 'rahul.sharma@email.com', 9876543210, 'Ahmedabad, Gujarat', '2024-06-15'),
("C102",'Priya Patel', 'priya.patel@email.com', 9876543211, 'Surat, Gujarat', '2026-02-10'),
("C103",'Amit Verma', 'amit.verma@email.com', 9876543212, 'Vadodara, Gujarat', '2025-11-05'),
("C104",'Neha Joshi', 'neha.joshi@email.com', 9876543213, 'Rajkot, Gujarat', '2024-01-18'),
("C105",'Karan Mehta', 'karan.mehta@email.com', 9876543214, 'Mumbai, Maharashtra', '2024-09-09'),
("C106",'Sneha Iyer', 'sneha.iyer@email.com', 9876543215, 'Pune, Maharashtra', '2025-07-21'),
("C107",'Vikram Singh', 'vikram.singh@email.com', 9876543216, 'Jaipur, Rajasthan', '2026-03-12'),
("C108",'Meera Nair', 'meera.nair@email.com', 9876543217, 'Kochi, Kerala', '2026-05-01'),
("C109",'Arjun Desai', 'arjun.desai@email.com', 9876543218, 'Ahmedabad, Gujarat', '2024-12-28'),
("C110",'Pooja Shah', 'pooja.shah@email.com', 9876543219, 'Indore, Madhya Pradesh', '2025-01-10');

---------------------------------------------------------------------------------------------------------------------------------------------------

-- CREATE TABLE(Orders):
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR (10),
    Order_Date DATE,
    Total_Amount DECIMAL(10,2),
    Status VARCHAR(15),
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);

-- INSERT RECORDS:
INSERT INTO Orders (OrderID, CustomerID, Order_Date, Total_Amount, Status) VALUES
(101, "C101", '2026-01-15', 82998.00, 'Delivered'),
(102, "C102", '2026-02-20', 2499.00, 'Delivered'),
(103, "C103", '2026-03-05', 3999.00, 'Shipped'),
(104, "C101", '2025-04-10', 499.00, 'Cancelled'),
(105, "C110", '2025-06-12', 34298.00, 'Pending'),
(106, "C105", '2025-07-01', 4598.00, 'Delivered'),
(107, "C106", '2025-08-18', 32999.00, 'Shipped'),
(108, "C107", '2026-01-05', 3798.00, 'Delivered'),
(109, "C102", '2026-03-22', 81298.00, 'PeJnding'),
(110, "C109", '2026-06-14', 1299.00, 'Delivered');

---------------------------------------------------------------------------------------------------------------------------------------------------

-- CREATE TABLE (Order_Item):
CREATE TABLE Order_Item (
    Order_ItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID VARCHAR (10),
    Quantity INT,
    Subtotal DECIMAL (10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);

-- INSERT RECORDS:
INSERT INTO Order_Item (Order_ItemID, OrderID, ProductID, Quantity, Subtotal) VALUES
(1001, 101, "P101", 1, 79999.00),   
(1002, 101, "P109", 1, 2999.00),    
(1003, 102, "P103", 1, 2499.00),    
(1004, 109, "P110", 1, 3999.00),
(1005, 104, "P105", 1, 499.00),     
(1006, 105, "P102", 1, 32999.00),   
(1007, 105, "P107", 1, 1299.00),
(1008, 106, "P104", 1, 3499.00),    
(1009, 105, "P105", 2, 998.00),     
(1010, 108, "P102", 1, 32999.00);

---------------------------------------------------------------------------------------------------------------------------------------------------

--CREATE TABLE (Payments):
CREATE TABLE Payments(
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    Payment_Date DATE,
    Payment_Method VARCHAR(20),
    Payment_Status VARCHAR(20),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
);

-- INSERT RECORDS:
INSERT INTO Payments (OrderID, Payment_Date, Payment_Method, Payment_Status) VALUES
(101, '2026-01-15', 'Credit Card', 'Paid'),
(102, '2026-02-20', 'UPI', 'Paid'),
(103, '2026-03-05', 'PayPal', 'Paid'),
(104, '2026-04-10', 'UPI', 'Failed'),
(105, '2025-06-12', 'Credit Card', 'Pending'),
(106, '2025-07-01', 'UPI', 'Paid'),
(107, '2022-08-18', 'Credit Card', 'Paid'),
(108, '2025-11-05', 'PayPal', 'Paid'),
(109, '2026-03-22', 'UPI', 'Paid'),
(110, '2025-06-14', 'Credit Card', 'Paid');

---------------------------------------------------------------------------------------------------------------------------------------------------

-- CREATE TABLE (Shipping):
CREATE TABLE Shipping (
    ShipingID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    Shipping_Date DATE,
    Delivery_Date DATE,
    Shipping_Status VARCHAR (30),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
);

-- INSERT RECORDS:
INSERT INTO Shipping (OrderID, Shipping_Date, Delivery_Date, Shipping_Status) VALUES
(101, '2025-12-16', '2025-12-19', 'Delivered'),
(102, '2025-09-21', '2025-09-24', 'Delivered'),
(103, '2026-03-06', '2026-03-10', 'Delivered'),
(104, NULL, NULL, NULL),
(105, '2026-06-13', NULL, 'Dispatched'),
(106, '2025-07-02', '2025-07-06', 'Delivered'),
(107, '2026-08-19', "2026-07-01", 'In Transit'),
(108, '2025-01-06', '2025-01-10', 'Delivered'),
(109, '2026-03-23', NULL, 'Dispatched'),
(110, '2025-06-15', '2025-06-18', 'Delivered');

---------------------------------------------------------------------------------------------------------------------------------------------------

--              ♦ QUERIES ♦             --

-- ♦ 1. IMPLEMENT CRUD OPERATIONS:

--      • Insert new Products, Customers, and Orders into the database:
        INSERT INTO Products (ProductID, Name, CategoryID, Price, Stock_Quantity, Added_Date)
        VALUES ("P111", "Remote Control Car", 8, 750, 5, "2026-07-07"); --Products

        INSERT INTO Customers (CustomerID, Name, Email, Phone_Number, Address, Registration_Date)
        VALUES ("C111", "Ravin Patel", "ravin.patel@email.com", 9478503791, "Esterncreek, Sydney", "2026-07-07"); -- Customers

        INSERT INTO Orders (OrderID, CustomerID, Order_Date, Total_Amount, Status)
        VALUES (111, "C103", "2026-07-07", 999, "Pending"); -- Orders

--      • Update Stock when an order is placed:
        UPDATE Products SET Stock_Quantity = 3 WHERE ProductID = "P111";

--      • Delete orders that were cancelled more than 30 days ago:
        DELETE FROM Orders WHERE Status = "Canceled" AND Order_Date < CURDATE() - INTERVAL 30 DAY;


-- ♦ 2. Use SQL clauses (Where, Having, Limit)

--      • Find all orders placed in last 6 months:
        SELECT * FROM Orders WHERE Order_Date >= CURDATE() - INTERVAL 6 MONTH;

--      • Get the top 5 higest priced products:
        SELECT * FROM Products ORDER BY Price DESC LIMIT 5;

--      • Find Customers who have placed more than 2 orders:
        SELECT CustomerID, COUNT(OrderID) AS Total_Orders
        FROM Orders
        GROUP BY CustomerID
        HAVING COUNT(OrderID) > 2;

-- ♦ 3. Apply SQL Operators (AND, OR, NOT):

--      • Get all orders where status = "Pending"  and payment_status = "Paid"
        SELECT o.OrderID, o.Status, p.Payment_Status FROM Orders AS o
        INNER JOIN Payments AS p
        ON o.OrderID = p.OrderID
        WHERE o.Status = "Pending" AND p.Payment_Status = "Paid";

--      • Find all products that are not out of stock:
        SELECT * FROM Products WHERE NOT Stock_Quantity = 0;

--      • Retrive customers who registred after 2026  OR have made purchase above 10,000;
        SELECT c.CustomerID, c.Name, c.Registration_Date, o.Total_Amount 
        FROM Customers AS c
        LEFT JOIN Orders AS o
        ON c.CustomerID = o.CustomerID
        WHERE c.Registration_Date > "2025-12-31" OR o.Total_Amount > 10000;

-- ♦ 4. Sorting and Groping data(ORDER BY, GROUP BY):

--      • List all products sorted by price in decending order:
        SELECT * FROM Products ORDER BY Price DESC;

--      • Display the number of orders placed by each customer:
        SELECT c.CustomerID, c.Name, COUNT(o.OrderID) AS Total_Orders FROM Customers c
        LEFT JOIN Orders o
        ON c.CustomerID = o.CustomerID
        GROUP BY c.CustomerID, c.Name;

--      • Show total revenue generated per category:
        SELECT c.CategoryID, c.Category_Name, SUM(p.price) AS Revenue
        FROM Categories AS c
        LEFT JOIN Products AS p
        ON c.CategoryID = p.CategoryID
        GROUP BY c.CategoryID, c.Category_Name;

-- ♦ 5. Use Aggrate Function(SUM, AVG, MIN, MAX,COUNT)

--      • Find the total revenue generated by the store:
        SELECT SUM(Total_Amount) AS Revenue FROM Orders;

--      • Identify the most purchased product:
        SELECT p.ProductID, p.name, p.price, SUM(oi.Quantity) AS Total_Quantity FROM Products p
        LEFT JOIN order_item oi
        ON p.ProductID = oi.ProductID
        GROUP BY ProductID ORDER BY Total_quantity DESC LIMIT 1;

--      • Calculate the average value:
        SELECT AVG(Total_Amount) AS Average_Order_Value FROM Orders;

-- ♦ 6. Establish Primary and Foreign key Relationship

--      • Ensure Orders linked to customers and products:
        Orders table is linked to Customers using CustomerID (Foreign Key).

        Orders table is linked to Products through the Order_Items table:
        - Order_Items.OrderID → Orders.OrderID
        - Order_Items.ProductID → Products.ProductID

--      • Establish relationships between payment and orders:
        SHOW CREATE TABLE Payments;
        Payments.OrderID is a Foreign Key that references Orders.OrderID.

-- ♦ 7. Implement joins

--      • Retrive a list of products along with their category names using INNER JOIN
        SELECT p.ProductID, p.Name, c.Category_Name, p.CategoryID, p.Price, p.Stock_Quantity AS Stock, p.Added_Date
        FROM Products AS p
        INNER JOIN Categories AS c
        ON p.CategoryID = c.CategoryID;

--      • Get all orders with customer detail using LEFT JOIN
        SELECT o.OrderID, c.Name, o.Order_Date, o.Total_Amount, o.Status
        FROM Orders AS o
        LEFT JOIN Customers AS c
        ON o.CustomerID = c.CustomerID;

--     • find the orders that have not been shipped using right join:
        SELECT o.OrderID, o.CustomerID, s.ShipingID, s.Shipping_Status
        FROM Shipping s
        RIGHT JOIN Orders o
        ON s.OrderID = o.OrderID
        WHERE s.OrderID IS NULL;

--      • Show customer who have never placed an order using full outer join
        SELECT c.CustomerID, c.Name, o.OrderID
        FROM Customers c
        LEFT JOIN Orders o
        ON c.CustomerID = o.CustomerID

        UNION

        SELECT c.CustomerID, c.Name, o.OrderID
        FROM Customers c
        RIGHT JOIN Orders o
        ON c.CustomerID = o.CustomerID
        WHERE c.CustomerID IS NULL;

-- ♦ 8. Use Subqueries:

--      • Find orders placed by customers who registred after 2025:
        SELECT * FROM Orders WHERE CustomerID IN
        (
        SELECT CustomerID
        FROM Customers
        WHERE Registration_Date > '2025-12-31'
        );

--      • Indentify the customer who has spent the most
        SELECT c.CustomerID, c.Name, SUM(o.Total_Amount) AS Total_Spent
        FROM Customers c
        INNER JOIN Orders o
        ON c.CustomerID = o.CustomerID
        GROUP BY c.CustomerID, c.Name
        HAVING SUM(o.Total_Amount) = ( SELECT MAX(TotalSpent)
        FROM ( SELECT SUM(Total_Amount) AS TotalSpent
        FROM Orders
        GROUP BY CustomerID
                ) AS temp
        );

--      • Get Products that have never been ordered:
        SELECT ProductID, Name FROM Products
        WHERE ProductID NOT IN
        (SELECT ProductID FROM Order_Item);

-- ♦ 9. Implement the data and time function:

--      • Extract the month From order_date to count orders per month
        SELECT MONTHNAME(Order_Date) AS Month, COUNT(OrderID) AS Total_Orders
        FROM Orders
        GROUP BY MONTHNAME(Order_Date);

--      • Calculate the delivery time by finding the difference between shippind_date and deleviry date 
        SELECT ShipingID, OrderID, Shipping_Date, Delivery_Date,
        DATEDIFF(Delivery_Date, Shipping_Date) AS Delivery_Time
        FROM Shipping;

--      • Format Order Date as DD-MM-YYYY
        SELECT DATE_FORMAT(Order_Date, "%d-%m-%Y") AS Order_Date FROM Orders;

-- ♦ 10. Use String Manipulation Function:

--      • Convert all product name to uppercase:
        SELECT ProductID, UPPER(Name) AS Name FROM Products;

--      • Trim white spaces from customer name:
        SELECT TRIM(Name) FROM Customers;

--      • Replace missing emails values with "Not provided";
        UPDATE Customers
        SET Email = 'Not provided'
        WHERE Email IS NULL;

-- ♦ 11. Implement Window Function:

--      • Rank customers based on total speding:
        SELECT c.CustomerID, c.Name,
        SUM(o.Total_Amount) AS Total_Spending,
        RANK() OVER (ORDER BY SUM(o.Total_Amount) DESC) AS Customer_Rank
        FROM Customers c
        INNER JOIN Orders o
        ON c.CustomerID = o.CustomerID
        GROUP BY c.CustomerID, c.Name;

--      • Show the cumulative total revenue per month
        SELECT MONTH(Order_Date) AS Month_No, MONTHNAME(Order_Date) AS Month,
        SUM(Total_Amount) AS Monthly_Revenue,
        SUM(SUM(Total_Amount)) 
        OVER (ORDER BY MONTH(Order_Date)) AS Cumulative_Revenue
        FROM Orders
        GROUP BY MONTH(Order_Date), MONTHNAME(Order_Date)
        ORDER BY MONTH(Order_Date);

--      • Display the runnoing total of orders placed.
        SELECT OrderID, Order_Date,
        COUNT(OrderID) OVER (ORDER BY Order_Date) AS Running_Total_Orders
        FROM Orders;

-- ♦ 12. Apply Sql case expression:

--      • Assign a loyalty status to customers
--              ► "Gold" if they have spent above 50,000
--              ► "Silver" if they have spent between 20,000 - 50,000
--              ► "Bronze" Otherwise
                SELECT c.CustomerID, c.Name, SUM(o.Total_Amount) AS Total_Spending,
                CASE
                        WHEN SUM(o.Total_Amount) > 50000 THEN 'Gold'
                        WHEN SUM(o.Total_Amount) BETWEEN 20000 AND 50000 THEN 'Silver'
                        ELSE 'Bronze'
                        END AS Loyalty_Status   
                FROM Customers c
                LEFT JOIN Orders o
                ON c.CustomerID = o.CustomerID
                GROUP BY c.CustomerID, c.Name;

--      • Categorize Products:
--              ► "Best Seller" if sold more than 500 units.
--              ► "Popular" if sold between 200-500 units
--              ► "Regular" otherwise
                SELECT p.ProductID, p.Name,
                COALESCE(SUM(oi.Quantity), 0) AS Total_Units_Sold,
                CASE
                        WHEN COALESCE(SUM(oi.Quantity), 0) > 2 THEN 'Best Seller'
                        WHEN COALESCE(SUM(oi.Quantity), 0) BETWEEN 1 AND 2 THEN 'Popular'
                        ELSE 'Regular'
                        END AS Product_Category
                FROM Products p
                LEFT JOIN Order_Item oi
                ON p.ProductID = oi.ProductID
                GROUP BY p.ProductID, p.Name;
