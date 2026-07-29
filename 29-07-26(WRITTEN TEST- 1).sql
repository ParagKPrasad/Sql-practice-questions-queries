create database UBSNETWORK;
use ubsnetwork;

CREATE TABLE stations (
    station_id INT PRIMARY KEY,
    station_name VARCHAR(50),
    zone VARCHAR(20),
    capacity INT,
    opened_year INT
);

CREATE TABLE rides (
    ride_id INT PRIMARY KEY,
    station_id INT,
    rider_type VARCHAR(20),
    ride_date DATE,
    duration_min INT,
    distance_km DECIMAL(4,1),
    fare DECIMAL(6,2),
    FOREIGN KEY (station_id) REFERENCES stations(station_id)
);

INSERT INTO stations VALUES
(1,'Riverside Dock','North',20,2019),
(2,'Amber Plaza','Central',35,2018),
(3,'Kite Hill','North',15,2021),
(4,'Old Mill Yard','East',25,2017),
(5,'Glass Bridge','Central',40,2020),
(6,'Fern Gully','West',12,2022),
(7,'Copper Lane','East',18,2016),
(8,'Willow Bend','West',22,2023),
(9,'Stone Arch','South',30,2023);

INSERT INTO rides VALUES
(1,1,'Member','2024-03-02',22,4.2,3.50),
(2,1,'Casual','2024-03-05',45,7.8,9.75),
(3,2,'Member','2024-03-05',18,3.1,2.80),
(4,2,'Student','2024-03-11',33,6.0,4.20),
(5,3,'Casual','2024-03-14',12,1.9,2.10),
(6,1,'Member','2024-04-01',27,5.4,4.10),
(7,4,'Student','2024-04-03',55,9.5,6.30),
(8,5,'Member','2024-04-07',15,2.6,2.40),
(9,5,'Casual','2024-04-09',62,11.2,13.50),
(10,2,'Member','2024-04-12',24,4.8,3.90),
(11,6,'Student','2024-04-18',40,7.1,5.00),
(12,3,'Member','2024-05-02',19,3.3,2.95),
(13,7,'Casual','2024-05-04',50,8.9,11.00),
(14,5,'Student','2024-05-08',29,5.2,3.75),
(15,1,'Casual','2024-05-13',36,6.4,8.20),
(16,4,'Member','2024-05-15',21,4.0,3.30),
(17,2,'Casual','2024-05-19',48,8.1,10.40),
(18,6,'Member','2024-05-22',17,2.9,2.55),
(19,5,'Member','2024-06-01',31,6.7,4.60),
(20,7,'Student','2024-06-04',44,7.6,5.40),
(21,1,'Student','2024-06-09',26,4.9,3.60),
(22,3,'Casual','2024-06-11',58,10.3,12.25),
(23,4,'Casual','2024-06-15',39,6.8,8.60),
(24,2,'Member','2024-06-20',23,4.4,3.70),
(25,5,'Casual','2024-06-25',53,9.7,12.80);

-- Q1 -- 
-- From the rides table, show each rider_type along with the total number of rides taken and the total fare collected. 
-- Include only those rider types that have taken more than 7 rides. Name the output columns rider_type, total_rides 
-- and total_fare, and sort the result by total_fare in descending order. 
SELECT
    rider_type,
    COUNT(*) AS total_rides,
    SUM(fare) AS total_fare
FROM rides
GROUP BY rider_type
HAVING COUNT(*) > 7
ORDER BY total_fare DESC;

-- Q2 --
-- For every station_id in the rides table, display the number of rides and the average ride duration rounded to 2 
-- decimal places. Show only those stations whose average duration is greater than 30 minutes. Name the output 
-- columns station_id, ride_count and avg_duration, and sort the result by avg_duration in descending order. 
SELECT
    station_id,
    COUNT(*) AS ride_count,
    ROUND(AVG(duration_min),2) AS avg_duration
FROM rides
GROUP BY station_id
HAVING AVG(duration_min) > 30
ORDER BY avg_duration DESC;

-- Q3 --
-- Group the rides by the month of ride_date and display the month number, the number of rides in that month, and 
-- the total distance covered rounded to 1 decimal place. Show only the months where the total distance is greater than 
-- 30 km. Name the output columns ride_month, total_rides and total_distance, and sort by ride_month in ascending order. 
SELECT
    MONTH(ride_date) AS ride_month,
    COUNT(*) AS total_rides,
    ROUND(SUM(distance_km),1) AS total_distance
FROM rides
GROUP BY MONTH(ride_date)
HAVING SUM(distance_km) > 30
ORDER BY ride_month;

-- Q4 --
-- For each rider_type, display the longest ride duration, the shortest ride duration and the average ride duration 
-- rounded to 2 decimal places. Include only those rider types whose longest ride is 50 minutes or more. Name the 
-- output columns rider_type, longest_ride, shortest_ride and avg_ride, and sort by longest_ride in descending order. 
SELECT
    rider_type,
    MAX(duration_min) AS longest_ride,
    MIN(duration_min) AS shortest_ride,
    ROUND(AVG(duration_min),2) AS avg_ride
FROM rides
GROUP BY rider_type
HAVING MAX(duration_min) >= 50
ORDER BY longest_ride DESC;

-- Q5 --
-- Group the rides by station_id and rider_type together. For each combination, display the number of rides and the 
-- total distance rounded to 1 decimal place. Show only the combinations where the total distance is greater than 10 
-- km. Name the output columns station_id, rider_type, ride_count and total_distance, and sort by station_id in 
-- ascending order. 
SELECT
    station_id,
    rider_type,
    COUNT(*) AS ride_count,
    ROUND(SUM(distance_km),1) AS total_distance
FROM rides
GROUP BY station_id, rider_type
HAVING SUM(distance_km) > 10
ORDER BY station_id;

-- Q6 --
-- Find the stations that have been used by all three rider types (Member, Casual and Student). For each such station 
-- display the number of distinct rider types, the total number of rides and the average fare rounded to 2 decimal 
-- places. Name the output columns station_id, rider_type_count, total_rides and avg_fare, and sort by station_id in ascending order.
SELECT
    station_id,
    COUNT(DISTINCT rider_type) AS rider_type_count,
    COUNT(*) AS total_rides,
    ROUND(AVG(fare),2) AS avg_fare
FROM rides
GROUP BY station_id
HAVING COUNT(DISTINCT rider_type) = 3
ORDER BY station_id; 

-- Q7 --
-- List every station in the stations table along with the details of its June 2024 rides — ride_id, rider_type and fare. 
-- Stations that had no ride in June 2024 must still appear in the result with NULL values in the ride columns. Name the 
-- output columns station_id, station_name, zone, ride_id, rider_type and fare, and sort by station_id and then ride_id. 
SELECT
    s.station_id,
    s.station_name,
    s.zone,
    r.ride_id,
    r.rider_type,
    r.fare
FROM stations s
LEFT JOIN rides r
ON s.station_id = r.station_id
AND MONTH(r.ride_date) = 6
AND YEAR(r.ride_date) = 2024
ORDER BY s.station_id, r.ride_id;

-- Q8 --
-- Produce a station-wise summary showing station_id, station_name, zone, the total number of rides started at that 
-- station and the total revenue collected. Every station must appear in the result — stations with no rides should show 
-- 0 rides and 0.00 revenue instead of NULL. Name the output columns station_id, station_name, zone, total_rides and 
-- total_revenue, and sort by total_rides in descending order, then by station_id in ascending order.
SELECT
    s.station_id,
    s.station_name,
    s.zone,
    COUNT(r.ride_id) AS total_rides,
    COALESCE(SUM(r.fare),0.00) AS total_revenue
FROM stations s
LEFT JOIN rides r
ON s.station_id = r.station_id
GROUP BY
    s.station_id,
    s.station_name,
    s.zone
ORDER BY total_rides DESC, s.station_id;
