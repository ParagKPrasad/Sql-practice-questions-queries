create database Workroom;
use Workroom;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Dept VARCHAR(20) NOT NULL,
    Role VARCHAR(20) NOT NULL,
    Salary INT NOT NULL,
    Gender CHAR(1) NOT NULL,
    JoinDate DATE NOT NULL,
    Address VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State CHAR(2) NOT NULL,
    Region VARCHAR(10) NOT NULL
);

INSERT INTO Employees
(EmpID, Name, Dept, Role, Salary, Gender, JoinDate, Address, City, State, Region)
VALUES
(1, 'Alice', 'HR', 'Manager', 55000, 'F', '2019-03-15', '101 Maple St', 'New York', 'NY', 'East'),
(2, 'Bob', 'IT', 'Developer', 72000, 'M', '2020-07-22', '22 Oak Ave', 'Chicago', 'IL', 'Midwest'),
(3, 'Carol', 'Finance', 'Analyst', 68000, 'F', '2018-11-01', '303 Pine Rd', 'New York', 'NY', 'East'),
(4, 'David', 'HR', 'Executive', 52000, 'M', '2021-01-10', '44 Birch Ln', 'Chicago', 'IL', 'Midwest'),
(5, 'Eve', 'IT', 'Senior Dev', 85000, 'F', '2017-06-30', '55 Cedar Blvd', 'Houston', 'TX', 'South'),
(6, 'Frank', 'Finance', 'Manager', 74000, 'M', '2019-09-14', '606 Elm St', 'New York', 'NY', 'East'),
(7, 'Grace', 'Marketing', 'Executive', 60000, 'F', '2022-02-28', '77 Spruce Dr', 'Chicago', 'IL', 'Midwest'),
(8, 'Hank', 'IT', 'Lead', 90000, 'M', '2016-04-05', '88 Walnut Way', 'Houston', 'TX', 'South'),
(9, 'Ivy', 'HR', 'Executive', 58000, 'F', '2020-12-19', '99 Ash Ct', 'New York', 'NY', 'East'),
(10, 'Jack', 'Finance', 'Analyst', 65000, 'M', '2021-03-07', '10 Willow Pl', 'Chicago', 'IL', 'Midwest'),
(11, 'Karen', 'Marketing', 'Manager', 62000, 'F', '2018-08-23', '11 Poplar St', 'Houston', 'TX', 'South'),
(12, 'Leo', 'IT', 'Developer', 78000, 'M', '2019-11-11', '12 Sycamore Ave', 'New York', 'NY', 'East'),
(13, 'Mia', 'HR', 'Executive', 53000, 'F', '2022-05-16', '13 Hickory Rd', 'Chicago', 'IL', 'Midwest'),
(14, 'Nate', 'Finance', 'Manager', 71000, 'M', '2017-12-02', '14 Chestnut Ln', 'Houston', 'TX', 'South'),
(15, 'Olivia', 'Marketing', 'Analyst', 66000, 'F', '2020-06-18', '15 Magnolia Dr', 'New York', 'NY', 'East'),
(16, 'Paul', 'IT', 'Senior Dev', 82000, 'M', '2018-03-27', '16 Dogwood Blvd', 'Chicago', 'IL', 'Midwest'),
(17, 'Quinn', 'HR', 'Executive', 57000, 'F', '2021-09-09', '17 Hawthorn St', 'Houston', 'TX', 'South'),
(18, 'Rita', 'Finance', 'Lead', 76000, 'F', '2019-01-25', '18 Redwood Ave', 'New York', 'NY', 'East'),
(19, 'Sam', 'Marketing', 'Executive', 63000, 'M', '2022-07-14', '19 Cypress Ct', 'Chicago', 'IL', 'Midwest'),
(20, 'Tina', 'IT', 'Lead', 88000, 'F', '2016-10-31', '20 Juniper Way', 'Houston', 'TX', 'South'),
(21, 'Uma', 'HR', 'Manager', 60000, 'F', '2020-04-03', '21 Aspen Pl', 'Dallas', 'TX', 'South'),
(22, 'Victor', 'Finance', 'Analyst', 69000, 'M', '2018-07-19', '22 Cottonwood St', 'Dallas', 'TX', 'South'),
(23, 'Wendy', 'Marketing', 'Manager', 64000, 'F', '2021-11-27', '23 Palmetto Ave', 'Phoenix', 'AZ', 'West'),
(24, 'Xander', 'IT', 'Architect', 95000, 'M', '2015-02-14', '24 Mesquite Rd', 'Phoenix', 'AZ', 'West'),
(25, 'Yara', 'HR', 'Executive', 54000, 'F', '2022-09-08', '25 Saguaro Ln', 'Phoenix', 'AZ', 'West'),
(26, 'Zoe', 'Finance', 'Manager', 73000, 'F', '2019-05-21', '26 Palo Verde Dr', 'Dallas', 'TX', 'South'),
(27, 'Aaron', 'Marketing', 'Analyst', 67000, 'M', '2020-10-15', '27 Ocotillo Blvd', 'Phoenix', 'AZ', 'West'),
(28, 'Bella', 'IT', 'Senior Dev', 80000, 'F', '2017-08-06', '28 Ironwood St', 'Chicago', 'IL', 'Midwest'),
(29, 'Carlos', 'HR', 'Executive', 56000, 'M', '2021-06-24', '29 Pecan Ave', 'Houston', 'TX', 'South'),
(30, 'Diana', 'Finance', 'Lead', 77000, 'F', '2018-02-09', '30 Peachtree Ct', 'New York', 'NY', 'East'),
(31, 'Ethan', 'IT', 'Developer', 74000, 'M', '2019-04-18', '31 Magnolia St', 'Dallas', 'TX', 'South'),
(32, 'Fiona', 'Marketing', 'Executive', 61000, 'F', '2022-01-05', '32 Bluebonnet Ave', 'Dallas', 'TX', 'South'),
(33, 'George', 'Finance', 'Analyst', 66000, 'M', '2020-08-11', '33 Sunflower Rd', 'Phoenix', 'AZ', 'West'),
(34, 'Helen', 'HR', 'Manager', 59000, 'F', '2017-03-22', '34 Cactus Ln', 'Phoenix', 'AZ', 'West'),
(35, 'Ivan', 'IT', 'Lead', 92000, 'M', '2015-09-30', '35 Desert Dr', 'Phoenix', 'AZ', 'West'),
(36, 'Julia', 'Marketing', 'Manager', 65000, 'F', '2019-12-03', '36 Mesa Blvd', 'Dallas', 'TX', 'South'),
(37, 'Kevin', 'Finance', 'Manager', 70000, 'M', '2021-07-20', '37 Prairie St', 'Chicago', 'IL', 'Midwest'),
(38, 'Laura', 'HR', 'Executive', 55000, 'F', '2022-10-14', '38 Lakeview Ave', 'Chicago', 'IL', 'Midwest'),
(39, 'Mark', 'IT', 'Developer', 76000, 'M', '2018-05-07', '39 Riverview Rd', 'New York', 'NY', 'East'),
(40, 'Nina', 'Marketing', 'Analyst', 63000, 'F', '2020-03-25', '40 Bayview Ln', 'New York', 'NY', 'East'),
(41, 'Oscar', 'Finance', 'Analyst', 67000, 'M', '2019-08-19', '41 Hillside Dr', 'Dallas', 'TX', 'South'),
(42, 'Priya', 'HR', 'Senior Dev', 79000, 'F', '2016-11-28', '42 Creekside Blvd', 'Houston', 'TX', 'South'),
(43, 'Raj', 'IT', 'Manager', 85000, 'M', '2018-06-14', '43 Brookside St', 'Phoenix', 'AZ', 'West'),
(44, 'Sarah', 'Marketing', 'Lead', 71000, 'F', '2017-02-01', '44 Springdale Ave', 'New York', 'NY', 'East'),
(45, 'Tom', 'Finance', 'Senior Dev', 81000, 'M', '2020-09-09', '45 Fairview Rd', 'Chicago', 'IL', 'Midwest'),
(46, 'Uma', 'IT', 'Architect', 97000, 'F', '2014-12-22', '46 Northgate Ln', 'New York', 'NY', 'East'),
(47, 'Vera', 'Marketing', 'Manager', 68000, 'F', '2021-04-30', '47 Eastwood Dr', 'Dallas', 'TX', 'South'),
(48, 'Will', 'HR', 'Analyst', 51000, 'M', '2022-11-15', '48 Westfield Blvd', 'Phoenix', 'AZ', 'West'),
(49, 'Xena', 'Finance', 'Lead', 78000, 'F', '2019-10-06', '49 Southpark St', 'Chicago', 'IL', 'Midwest'),
(50, 'Yusuf', 'IT', 'Senior Dev', 87000, 'M', '2016-07-17', '50 Central Ave', 'Houston', 'TX', 'South');

select * from employees;

-- 1
SELECT Dept, COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY Dept;

-- 2
SELECT Dept, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Dept;

-- 3
SELECT Gender, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Gender;

-- 4
SELECT Dept, MAX(Salary) AS MaxSalary
FROM Employees
GROUP BY Dept;

-- 5
SELECT Role, MIN(Salary) AS MinSalary
FROM Employees
GROUP BY Role;

-- 6
SELECT City, COUNT(*) AS EmpCount
FROM Employees
GROUP BY City;

-- 7
SELECT Region, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Region;

-- 8
SELECT Dept, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Dept
ORDER BY AvgSalary DESC;

-- 9
SELECT City, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY City
ORDER BY TotalSalary ASC;

-- 10
SELECT Role, COUNT(*) AS EmpCount
FROM Employees
GROUP BY Role
ORDER BY EmpCount DESC, Role ASC;

-- 11
SELECT State, COUNT(*) AS EmpCount
FROM Employees
GROUP BY State
ORDER BY EmpCount DESC, State ASC;

-- 12
SELECT Region, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Region
ORDER BY TotalSalary DESC;

-- 13
SELECT Dept, MIN(Salary) AS MinSalary
FROM Employees
GROUP BY Dept
ORDER BY MinSalary DESC;

-- 14
SELECT Dept, COUNT(*) AS EmpCount
FROM Employees
GROUP BY Dept
HAVING COUNT(*) > 10;

-- 15
SELECT Dept, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Dept
HAVING AVG(Salary) > 65000;

-- 16
SELECT City, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY City
HAVING SUM(Salary) > 600000;

-- 17
SELECT Role, COUNT(*) AS EmpCount
FROM Employees
GROUP BY Role
HAVING COUNT(*) > 7;

-- 18
SELECT Region, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Region
HAVING AVG(Salary) < 70000;

-- 19
SELECT Dept, MAX(Salary) AS MaxSalary
FROM Employees
GROUP BY Dept
HAVING MAX(Salary) >= 90000;

-- 20
SELECT State, COUNT(*) AS EmpCount
FROM Employees
GROUP BY State
HAVING COUNT(*) > 12;

-- 21
SELECT City, MIN(Salary) AS MinSalary
FROM Employees
GROUP BY City
HAVING MIN(Salary) > 60000;

-- 22
SELECT Dept, City, COUNT(*) AS EmpCount
FROM Employees
GROUP BY Dept, City;

-- 23
SELECT Dept, Gender, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Dept, Gender;

-- 24
SELECT Region, Role, COUNT(*) AS EmpCount
FROM Employees
GROUP BY Region, Role;

-- 25
SELECT State, Dept, MAX(Salary) AS MaxSalary
FROM Employees
GROUP BY State, Dept;

-- 26
SELECT City, Gender, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY City, Gender;

-- 27
SELECT Dept, City, COUNT(*) AS EmpCount
FROM Employees
GROUP BY Dept, City
HAVING COUNT(*) > 2;

-- 28
SELECT Region, Gender, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Region, Gender
ORDER BY Region ASC, AvgSalary DESC;

-- 29
SELECT State, Role, COUNT(*) AS EmpCount
FROM Employees
GROUP BY State, Role
HAVING COUNT(*) > 1;

-- 30
SELECT YEAR(JoinDate) AS JoinYear, COUNT(*) AS Joiners
FROM Employees
GROUP BY YEAR(JoinDate)
ORDER BY JoinYear;

-- 31
SELECT YEAR(JoinDate) AS JoinYear, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY YEAR(JoinDate)
ORDER BY JoinYear;

-- 32
SELECT MONTH(JoinDate) AS JoinMonth, COUNT(*) AS Joiners
FROM Employees
GROUP BY MONTH(JoinDate)
ORDER BY JoinMonth;

-- 33
SELECT QUARTER(JoinDate) AS JoinQtr, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY QUARTER(JoinDate)
ORDER BY JoinQtr;

-- 34
SELECT QUARTER(JoinDate) AS Qtr, COUNT(*) AS Joiners
FROM Employees
WHERE QUARTER(JoinDate) IN (1,3)
GROUP BY QUARTER(JoinDate)
ORDER BY Qtr;

-- 35
SELECT YEAR(JoinDate) AS JoinYear, Dept, COUNT(*) AS EmpCount
FROM Employees
GROUP BY YEAR(JoinDate), Dept
ORDER BY JoinYear, Dept;

-- 36
SELECT YEAR(JoinDate) AS JoinYear, COUNT(*) AS Joiners
FROM Employees
GROUP BY YEAR(JoinDate)
HAVING COUNT(*) > 6
ORDER BY JoinYear;

-- 37
SELECT QUARTER(JoinDate) AS Qtr, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY QUARTER(JoinDate)
HAVING AVG(Salary) > 70000
ORDER BY Qtr;

-- 38
SELECT State,
       COUNT(*) AS EmpCount,
       AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY State;

-- 39
SELECT State, Dept, COUNT(*) AS EmpCount
FROM Employees
GROUP BY State, Dept
ORDER BY State, EmpCount DESC;

-- 40
SELECT City, COUNT(DISTINCT Dept) AS DeptCount
FROM Employees
GROUP BY City
HAVING COUNT(DISTINCT Dept) > 2;

-- 41
SELECT Region, State, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Region, State;

-- 42
SELECT Region,
       COUNT(*) AS EmpCount,
       AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Region
HAVING COUNT(*) > 10
   AND AVG(Salary) > 67000;

-- 43
SELECT City, COUNT(DISTINCT Role) AS UniqueRoles
FROM Employees
GROUP BY City;

-- 44
SELECT Dept, COUNT(*) AS FemaleCount
FROM Employees
WHERE Gender = 'F'
GROUP BY Dept;

-- 45
SELECT Dept, AVG(Salary) AS AvgSalary
FROM Employees
WHERE JoinDate > '2019-01-01'
GROUP BY Dept
ORDER BY AvgSalary DESC;

-- 46
SELECT City, SUM(Salary) AS TotalSalary
FROM Employees
WHERE Dept = 'IT'
GROUP BY City;

-- 47
SELECT Role, COUNT(*) AS EmpCount
FROM Employees
WHERE Salary > 70000
GROUP BY Role;

-- 48
SELECT Dept, MAX(Salary) AS MaxSalary
FROM Employees
WHERE Region IN ('South', 'West')
GROUP BY Dept;

-- 49
SELECT YEAR(JoinDate) AS JoinYear, COUNT(*) AS EmpCount
FROM Employees
WHERE State = 'TX'
GROUP BY YEAR(JoinDate)
ORDER BY JoinYear;

-- 50
SELECT Dept, COUNT(*) AS EligibleFemales
FROM Employees
WHERE Gender = 'F'
  AND Salary > 60000
GROUP BY Dept
HAVING COUNT(*) > 3;

