create database corr_db;
use corr_db;

create table employee_c ( id int, name varchar(20), salary int);

insert into employee_c values(1, 'a', 100), (2, 'b', 250), (3, 'c', 400), (4, 'd', 380);

SELECT *FROM EMPLOYEE_C;

-- SUBQUERY -- 

-- (MAX. SALARY)
SELECT * FROM EMPLOYEE_C WHERE SALARY=
	   (SELECT MAX(SALARY) 
        FROM EMPLOYEE_C);
	
    
-- (MIN. SALARY)
SELECT * FROM EMPLOYEE_C WHERE SALARY=
	   (SELECT MIN(SALARY) 
        FROM EMPLOYEE_C);
        


USE WORLD;

-- Q1-- Get the name of city where the district of city is same for the city abu Dhabhi
SELECT Name
FROM city
WHERE District = (
    SELECT District
    FROM city
    WHERE Name = 'Abu Dhabi');
    
-- Q2-- GET THE COLUMN FROM THE CITY TABLE WHERE THE POPULATION IS MAX
SELECT *
FROM city
WHERE Population = (
    SELECT MAX(Population)
    FROM city);    
    
-- Q3-- GET THE DISTRICT AND THE NAME OF THE CITY WHERE THE COUNTRY CODE IS SAME FOR HERAT
SELECT District, Name
FROM city
WHERE CountryCode = (
    SELECT CountryCode
    FROM city
    WHERE Name = 'Herat');    
    
-- Q4-- GET THE CITY, DISTRICT AND POPULATON FOR ALL THE COUNTRIES WHERE AMSTERDAM IS PRESENT AND SORT THIS DATA BY POPULATION
SELECT Name, District, Population
FROM city
WHERE CountryCode = (
    SELECT CountryCode
    FROM city
    WHERE Name = 'Amsterdam')
ORDER BY Population;    