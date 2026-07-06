-- CREATING DATABASE:
CREATE DATABASE Final;

-- USE DATABASE:
USE Final;

-- CREATE TABLE (Students):
CREATE TABLE Students(
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    BirthDate DATE,
    EnrollmentDate DATE
);

-- INSERT RECORDS:
INSERT INTO Students (FirstName, LastName, Email, BirthDate, EnrollmentDate) VALUES
('John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
('Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01'),
('Michael', 'Johnson', 'michael.johnson@email.com', '2001-03-12', '2023-07-15'),
('Emily', 'Brown', 'emily.brown@email.com', '2000-11-08', '2022-08-10'),
('David', 'Williams', 'david.williams@email.com', '1998-09-30', '2021-07-20'),
('Sarah', 'Jones', 'sarah.jones@email.com', '2002-02-14', '2024-01-05'),
('Daniel', 'Garcia', 'daniel.garcia@email.com', '2001-06-18', '2023-06-25'),
('Olivia', 'Miller', 'olivia.miller@email.com', '1999-12-01', '2021-08-18'),
('James', 'Davis', 'james.davis@email.com', '2000-07-22', '2022-09-01'),
('Sophia', 'Rodriguez', 'sophia.rodriguez@email.com', '2001-10-05', '2023-08-12'),
('William', 'Martinez', 'william.martinez@email.com', '1998-04-27', '2020-08-03'),
('Isabella', 'Hernandez', 'isabella.hernandez@email.com', '2002-01-19', '2024-02-01'),
('Benjamin', 'Lopez', 'benjamin.lopez@email.com', '2000-05-11', '2022-07-28'),
('Mia', 'Gonzalez', 'mia.gonzalez@email.com', '1999-08-09', '2021-09-15'),
('Lucas', 'Wilson', 'lucas.wilson@email.com', '2001-09-17', '2023-07-05'),
('Charlotte', 'Anderson', 'charlotte.anderson@email.com', '2000-12-03', '2022-08-22'),
('Henry', 'Thomas', 'henry.thomas@email.com', '1998-06-29', '2020-07-30'),
('Amelia', 'Taylor', 'amelia.taylor@email.com', '2002-03-21', '2024-01-20'),
('Alexander', 'Moore', 'alexander.moore@email.com', '2001-11-14', '2023-08-05'),
('Evelyn', 'Jackson', 'evelyn.jackson@email.com', '1999-02-07', '2021-08-25');

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- CREATE TABLE (Courses):
CREATE TABLE Courses(
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(30) NOT NULL,
    DepartmentID INT,
    Credits INT
);

--INSERT RECORDS:
INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits) VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4),
(103, 'Database Management Systems', 1, 4),
(104, 'Operating Systems', 2, 4),
(105, 'Computer Networks', 2, 3),
(106, 'Web Development', 3, 3),
(107, 'Software Engineering', 3, 4),
(108, 'Python Programming', 3, 3),
(109, 'Java Programming', 3, 4),
(110, 'Cloud Computing', 2, 3),
(111, 'Data Analytics', 1, 3),
(112, 'Machine Learning Basics', 1, 4),
(113, 'Python Programming Lab', 3, 2),
(114, 'Java Programming Lab', 3, 2),
(115, 'Data Structures Lab', 2, 2),
(116, 'DBMS Lab', 1, 2),
(117, 'Advanced Web Development', 3, 4),
(118, 'Business Communication', 4, 2),
(119, 'Financial Accounting', 5, 3),
(120, 'Introduction to SQL Lab', 1, 2);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- CREATE TABLE (Instructors):
CREATE TABLE Instructors(
    InstructorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments (DepartmentID)
);

-- INSERT RECORDS:
INSERT INTO Instructors (FirstName, LastName, Email, DepartmentID) VALUES
('Alice', 'Johnson', 'alice.johnson@univ.com', 1),
('Bob', 'Lee', 'bob.lee@univ.com', 2),
('Carol', 'Smith', 'carol.smith@univ.com', 1),
('David', 'Brown', 'david.brown@univ.com', 3),
('Emma', 'Wilson', 'emma.wilson@univ.com', 2),
('Frank', 'Taylor', 'frank.taylor@univ.com', 4),
('Grace', 'Anderson', 'grace.anderson@univ.com', 1),
('Henry', 'Thomas', 'henry.thomas@univ.com', 5),
('Isabella', 'Martin', 'isabella.martin@univ.com', 3),
('Jack', 'White', 'jack.white@univ.com', 2),
('Katherine', 'Harris', 'katherine.harris@univ.com', 4),
('Liam', 'Clark', 'liam.clark@univ.com', 1),
('Mia', 'Lewis', 'mia.lewis@univ.com', 5),
('Noah', 'Walker', 'noah.walker@univ.com', 3),
('Olivia', 'Hall', 'olivia.hall@univ.com', 2),
('Peter', 'Allen', 'peter.allen@univ.com', 4),
('Queenie', 'Young', 'queenie.young@univ.com', 1),
('Ryan', 'King', 'ryan.king@univ.com', 3),
('Sophia', 'Scott', 'sophia.scott@univ.com', 5),
('Thomas', 'Green', 'thomas.green@univ.com', 2);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- CREATE TABLE(Enrollments):
CREATE TABLE Enrollments(
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
);

-- INSERT RECORDS:
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate) VALUES
(1, 101, '2022-08-02'),
(1, 103, '2022-08-03'),
(2, 102, '2021-08-02'),
(2, 115, '2021-08-04'),
(3, 108, '2023-07-16'),
(3, 113, '2023-07-17'),
(4, 103, '2022-08-12'),
(5, 104, '2021-07-22'),
(5, 105, '2021-07-23'),
(6, 120, '2024-01-06'),
(7, 109, '2023-06-26'),
(8, 111, '2021-08-19'),
(9, 101, '2022-09-02'),
(10, 112, '2023-08-13'),
(11, 110, '2020-08-04'),
(12, 114, '2024-02-02'),
(13, 118, '2022-07-29'),
(14, 119, '2021-09-16'),
(15, 106, '2023-07-06'),
(16, 117, '2022-08-23');

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- CREATE TABLLE (Departments):
CREATE TABLE Departments(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(30) NOT NULL
);

-- INSERT RECORDS:
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Software Engineering'),
(4, 'Management'),
(5, 'Commerce');

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--              QUERIES             --

-- Q-1 Peform CRUD operations:
INSERT INTO Students (FirstName, LastName, Email, BirthDate, EnrollmentDate)
VALUES ('Rahul', 'Patel', 'rahul.patel@email.com', '2002-04-15', '2024-06-10'); -- CREATE

SELECT * FROM Students; -- READ

UPDATE Students
SET FirstName = 'Chris'
WHERE StudentID = 21; -- UPDATE

DELETE FROM Students
WHERE StudentID = 21; -- DELETE

-- Q-2 Retrive Students Who enrolled after 2022.
SELECT * FROM Students
WHERE EnrollmentDate > "2021-12-31";

-- Q-3 Retrive courses offered by the Computer Science departments with a limit of 5 courses:
SELECT c.CourseID, c.CourseName, c.DepartmentID, c.Credits FROM Courses AS c
INNER JOIN Departments AS d
ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = "Computer Science"
LIMIT 5;

-- Q-4 Get the number of students enrolled in each course, filtering for courses with more than 5 students:
SELECT c.CourseID, c.CourseName, COUNT(e.StudentID) AS TotalStudents
FROM Courses c
INNER JOIN Enrollments e
ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
HAVING COUNT(e.StudentID) > 1;

-- Q-5 Find the students who enrolled both introduction to SQL and datastructure:
SELECT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures')
GROUP BY s.StudentID, s.FirstName, s.LastName;

-- Q-6 Find the students who are either enrolled both introduction to SQL and datastructure:
SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures');

-- Q-7 Calculate the average numbers of credits for all courses;
SELECT AVG(Credits) AS AverageCredits
FROM Courses;

-- Q-8 Find the maximum salary of instructors in the computer science department:
SELECT i.InstructorID, i.DepartmentID, i.FirstName, i.LastName, d.DepartmentName, i.Salary FROM Instructors AS i
INNER JOIN Departments AS D
ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = "Computer Science" 
AND
Salary = (SELECT MAX(Salary) FROM Instructors);

-- Q-9 Count the number of students enrolled in each department:
SELECT d.DepartmentID, d.DepartmentName, COUNT(e.StudentID) AS TotalStudents FROM Departments AS d
JOIN  Courses AS c ON d.DepartmentID = c. DepartmentID
JOIN Enrollments AS e ON e.CourseID = c.CourseID
GROUP BY d.DepartmentID, d.DepartmentName;

-- Q-10 INNER JOIN: Retrive students and their corresponding courses:
SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName, s.BirthDate FROM Students AS s
INNER JOIN Enrollments AS e ON e.StudentID = s.StudentID
INNER JOIN Courses AS c ON c.CourseID = e.CourseID;

-- Q-11 LEFT JOIN: Retrive students and their corresponding courses:
SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName, s.BirthDate FROM Students AS s
LEFT JOIN Enrollments AS e ON e.StudentID = s.StudentID
LEFT JOIN Courses AS c ON c.CourseID = e.CourseID;

-- Q-12 Subquery: Find students enrolled in courses that have more than 10 students
SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE e.CourseID IN (
    SELECT CourseID
    FROM Enrollments
    GROUP BY CourseID
    HAVING COUNT(StudentID) > 1
);

-- Q-13 Extract the year from the EnrollmentDate of students:
SELECT StudentID, FirstName, LastName, YEAR(EnrollmentDate) FROM Students;

-- Q-14 Concatenate the instructors's first name and last name:
SELECT InstructorID, CONCAT(FirstName, " ", LastName) AS FullName, Email FROM Instructors;

-- Q-15 Calculate the running total of students enrolled in courses
SELECT 
    CourseID,
    TotalStudents,
    SUM(TotalStudents) OVER (ORDER BY CourseID) AS RunningTotal
FROM (
    SELECT CourseID, COUNT(StudentID) AS TotalStudents
    FROM Enrollments
    GROUP BY CourseID
) AS CourseCounts;

-- Q-16 Label Students as "Senior" or "Junior" based on their year of enrollment
--(if the enrollment date is more than 4 years from the currentdate, put the label "Senior" otherwise "Junior")
SELECT StudentID, FirstName, LastName, EnrollmentDate,
CASE
    WHEN EnrollmentDate < "2022-12-31" THEN "Senior"
    ELSE "Junior"
    END AS Position
FROM Students;