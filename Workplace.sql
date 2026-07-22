create database Workplace;
use Workplace;

CREATE TABLE Employees (
EmpID INT PRIMARY KEY,
Name VARCHAR(50) NOT NULL,
Dept VARCHAR(50) NOT NULL,
City VARCHAR(50) NOT NULL,
Gender CHAR(1) NOT NULL,
Salary INT NOT NULL,
JoinDate DATE NOT NULL,
Role VARCHAR(50) NOT NULL
);

INSERT INTO Employees (EmpID, Name, Dept, City, Gender, Salary, JoinDate, Role) VALUES
(1,'Alice','HR','New York','F',55000,'2019-03-15','Manager'),
(2,'Bob','IT','Chicago','M',72000,'2020-07-22','Developer'),
(3,'Carol','Finance','New York','F',68000,'2018-11-01','Analyst'),
(4,'David','HR','Chicago','M',52000,'2021-01-10','Executive'),
(5,'Eve','IT','Houston','F',85000,'2017-06-30','Senior Dev'),
(6,'Frank','Finance','New York','M',74000,'2019-09-14','Manager'),
(7,'Grace','Marketing','Chicago','F',60000,'2022-02-28','Executive'),
(8,'Hank','IT','Houston','M',90000,'2016-04-05','Lead'),
(9,'Ivy','HR','New York','F',58000,'2020-12-19','Executive'),
(10,'Jack','Finance','Chicago','M',65000,'2021-03-07','Analyst'),
(11,'Karen','Marketing','Houston','F',62000,'2018-08-23','Manager'),
(12,'Leo','IT','New York','M',78000,'2019-11-11','Developer'),
(13,'Mia','HR','Chicago','F',53000,'2022-05-16','Executive'),
(14,'Nate','Finance','Houston','M',71000,'2017-12-02','Manager'),
(15,'Olivia','Marketing','New York','F',66000,'2020-06-18','Analyst'),
(16,'Paul','IT','Chicago','M',82000,'2018-03-27','Senior Dev'),
(17,'Quinn','HR','Houston','F',57000,'2021-09-09','Executive'),
(18,'Rita','Finance','New York','F',76000,'2019-01-25','Lead'),
(19,'Sam','Marketing','Chicago','M',63000,'2022-07-14','Executive'),
(20,'Tina','IT','Houston','F',88000,'2016-10-31','Lead'),
(21,'Uma','HR','New York','F',60000,'2020-04-03','Manager'),
(22,'Victor','Finance','Chicago','M',69000,'2018-07-19','Analyst'),
(23,'Wendy','Marketing','Houston','F',64000,'2021-11-27','Manager'),
(24,'Xander','IT','New York','M',95000,'2015-02-14','Architect'),
(25,'Yara','HR','Chicago','F',54000,'2022-09-08','Executive'),
(26,'Zoe','Finance','Houston','F',73000,'2019-05-21','Manager'),
(27,'Aaron','Marketing','New York','M',67000,'2020-10-15','Analyst'),
(28,'Bella','IT','Chicago','F',80000,'2017-08-06','Senior Dev'),
(29,'Carlos','HR','Houston','M',56000,'2021-06-24','Executive'),
(30,'Diana','Finance','New York','F',77000,'2018-02-09','Lead');

select * from employees;

-- 1.
SELECT department,
       COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY department;

-- 2.
SELECT dept,
       SUM(salary) AS TotalSalary
FROM Employees
GROUP BY department;

-- 3.
SELECT City,
       AVG(salary) AS AverageSalary
FROM Employees
GROUP BY City;

-- 4.
SELECT dept,
       MAX(salary) AS MaximumSalary
FROM Employees
GROUP BY dept;

-- 5.
SELECT dept,
       MIN(salary) AS MinimumSalary
FROM Employees
GROUP BY dept;

--6.
SELECT dept,
       COUNT(*) AS EmpCount
FROM Employees
GROUP BY dept
ORDER BY EmpCount DESC;

-- 7.
SELECT City,
       SUM(salary) AS TotalSalary
FROM Employees
GROUP BY City
ORDER BY TotalSalary ASC;

-- 8.
SELECT name,
       dept,
       salary
FROM Employees
ORDER BY dept ASC,
         salary DESC;
         
-- 9.
SELECT name,
       City,
       JoinDate
FROM Employees
ORDER BY City ASC,
         JoinDate ASC;
         
-- 10.
SELECT name,
       Role,
       Salary
FROM Employee
ORDER BY Role ASC,
         Salary ASC;
         
-- 11.
SELECT Dept,
       COUNT(*) AS EmpCount
FROM Employee
GROUP BY Dept
HAVING COUNT(*) > 7;

-- 12.
SELECT Dept,
       AVG(salary) AS AvgSalary
FROM Employees
GROUP BY Dept
HAVING AVG(salary) > 65000;

-- 13.
SELECT City,
       SUM(salary) AS TotalSalary
FROM Employees
GROUP BY City
HAVING SUM(salary) > 60000;

-- 14.
SELECT Dept,
       MAX(salary) AS MaxSalary
FROM Employees
GROUP BY Dept
HAVING MAX(salary) > 78000;

-- 15.
SELECT Role,
       COUNT(*) AS RoleCount
FROM Employees
GROUP BY Role
HAVING RoleCount > 5;

-- 16.
SELECT AVG(salary) AS CompanyAvgSalary
FROM Employees;

-- 17.
SELECT dept,
       COUNT(*) AS FemaleCount
FROM Employees
WHERE Gender = 'F'
GROUP BY Dept;

-- 18.
SELECT MAX(salary) AS HighestSalary,
       MIN(salary) AS MinimumSalary
FROM Employees;

-- 19.
SELECT SUM(salary) AS TotalSalary
FROM Employees
WHERE JoinDate > '2019-01-01';

-- 20.
SELECT Gender,
       AVG(salary) AS AvgSalary
FROM Employees
GROUP BY Gender;

-- 21.
SELECT Dept,
       City,
       COUNT(*) AS EmpCount
FROM Employees
GROUP BY Dept, City;

-- 22.
SELECT Dept,
       Gender,
       AVG(salary) AS AvgSalary
FROM Employees
GROUP BY Dept, Gender;

-- 23.
SELECT City,
       Role,
       SUM(salary) AS TotalSalary
FROM Employees
GROUP BY City, Role
ORDER BY City,
         SUM(salary) DESC;
         
-- 24.
SELECT Dept,
       Role,
       COUNT(*) AS EmpCount
FROM Employee
GROUP BY Dept, Role
HAVING COUNT(*) > 1;

-- 25.
SELECT City,
       Gender,
       MAX(salary) AS MaxSalary
FROM Employees
GROUP BY City, Gender;

-- 26.
SELECT Dept,
       AVG(salary) AS AvgSalary
FROM Employees
GROUP BY Dept
HAVING AVG(salary) > 60000
ORDER BY AVG(salary) DESC;

-- 27.
SELECT City,
       Dept,
       COUNT(*) AS EmpCount
FROM Employees
GROUP BY City, Dept
HAVING COUNT(*) > 1
ORDER BY EmpCount DESC,
         City ASC;
         
-- 28.
SELECT Role,
       SUM(salary) AS TotalSalary
FROM Employees
GROUP BY Role
HAVING SUM(salary) > 300000
ORDER BY SUM(salary) ASC;

-- 29.
SELECT UPPER(Name) AS EmpName,
       YEAR(JoinDate) AS JoinYear
FROM Employees
ORDER BY JoinYear;

-- 30.
SELECT YEAR(JoinDate) AS JoinYear,
       COUNT(*) AS Joinees
FROM Employees
GROUP BY YEAR(JoinDate)
ORDER BY JoinYear;