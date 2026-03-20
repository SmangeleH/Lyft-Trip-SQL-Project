CREATE DATABASE IF NOT EXISTS lyft_trip_project;
USE lyft_trip_project;

-- Create trips table
CREATE TABLE trips (
    id INTEGER PRIMARY KEY,
    date TEXT,
    pickup TEXT,
    dropoff TEXT,
    rider_id INTEGER,
    car_id INTEGER,
    type TEXT,
    cost DECIMAL(10,2)
);

-- Insert data into trips
INSERT INTO trips (id, date, pickup, dropoff, rider_id, car_id, type, cost)
VALUES
(1001, '2017-12-05', '06:45', '07:10', 102, 1, 'X', 28.66),
(1002, '2017-12-05', '08:00', '08:15', 101, 3, 'POOL', 9.11),
(1003, '2017-12-05', '09:30', '09:50', 104, 4, 'X', 24.98),
(1004, '2017-12-05', '13:40', '14:05', 105, 1, 'X', 31.27),
(1005, '2017-12-05', '15:15', '16:00', 103, 2, 'POOL', 18.95),
(1006, '2017-12-05', '18:20', '18:55', 101, 3, 'XL', 78.52);

-- Create riders table
CREATE TABLE riders (
    id INTEGER PRIMARY KEY,
    first TEXT,
    last TEXT,
    username TEXT,
    rating DECIMAL(3,2),
    total_trips INTEGER,
    referred INTEGER
);

-- Insert data into riders
INSERT INTO riders (id, first, last, username, rating, total_trips, referred)
VALUES
(101, 'Sonny', 'Li', '@sonnynomnom', 4.66, 352, NULL),
(102, 'Laura', 'Breiman', '@lauracle', 4.99, 687, 101),
(103, 'Kassa', 'Korley', '@kassablanca', 4.63, 42, NULL),
(104, 'Yakov', 'Kagan', '@yakovkagan', 4.52, 1910, 103);

-- Create riders2 table
CREATE TABLE riders2 (
    id INTEGER PRIMARY KEY,
    first TEXT,
    last TEXT,
    username TEXT,
    rating DECIMAL(3,2),
    total_trips INTEGER,
    referred INTEGER
);

-- Create cars table
CREATE TABLE cars (
    id INTEGER PRIMARY KEY,
    model TEXT,
    OS TEXT,
    status TEXT,
    trips_completed INTEGER
);

-- Insert data into cars
INSERT INTO cars (id, model, OS, status, trips_completed)
VALUES
(1, 'Ada', 'Ryzac', 'active', 82),
(2, 'Ada', 'Ryzac', 'active', 30),
(3, 'Turing XL', 'Ryzac', 'active', 164),
(4, 'Akira', 'Finux', 'maintenance', 22);

-- id IS THE PRIMARY KEY for all tables

-- Question:
-- Try out a simple cross join between riders and cars.
-- Is the result useful?

SELECT riders.first, riders.last, cars.model
FROM riders, cars;


-- QUESTION:  Try out a simple cross join between riders and cars. Is the result useful?
-- Answer: 

SELECT riders.first, riders.last, cars.model
FROM riders, cars;

-- This query creates a cross join between riders and cars. It is not useful because: 
-- A cross join returns every possible combination of riders and cars.
-- It does not show which rider actually used which car.
-- For example, if there are 4 riders and 4 cars, the result will return 16 rows.
-- This is not useful for Lyft trip analysis because riders and cars are related through the trips table,
-- not directly to each other.

-- Question:
-- Suppose we want to create a Trip Log with the trips and its users.
-- Find the columns to join between trips and riders and combine the two tables using a LEFT JOIN.
-- Let trips be the left table.

SELECT *
FROM trips
LEFT JOIN riders
  ON trips.rider_id = riders.id;

-- Answer:
-- The join is done using trips.rider_id and riders.id.

-- Why this works:
-- trips.rider_id links each trip to the rider who took it.
-- riders.id is the primary key in the riders table.

-- Why use LEFT JOIN:
-- LEFT JOIN keeps all rows from the trips table,
-- even if there is no matching rider in the riders table.

-- Question:
-- Suppose we want to create a link between the trips and the cars used during those trips.
-- Find the columns to join on and combine the trips and cars table using an INNER JOIN.

SELECT *
FROM trips
INNER JOIN cars
  ON trips.car_id = cars.id;

-- Answer:
-- The join is done using trips.car_id and cars.id.

-- Why this works:
-- trips.car_id stores the car used for each trip.
-- cars.id is the primary key in the cars table.

-- Why use INNER JOIN:
-- INNER JOIN returns only the rows where there is a match in both tables.
-- This helps show only trips that have a valid matching car record.

-- Question:
-- The new riders data are in! There are three new users this month.
-- Stack the riders table on top of the new table named riders2.

SELECT *
FROM riders
UNION
SELECT *
FROM riders2;

-- Answer:
-- UNION combines the results of both tables into one result set.

-- Why this works:
-- riders and riders2 have the same columns in the same order,
-- so they can be combined using UNION.

-- Note:
-- UNION removes duplicate rows.
-- If you want to keep all rows including duplicates, use UNION ALL instead.

-- Question:
-- What is the average cost for a trip?

SELECT AVG(cost)
FROM trips;

-- Answer:
-- This calculates the average cost of all trips in the trips table.

-- Question:
-- Lyft is looking to do an email campaign for all the irregular users.
-- Find all the riders who have used Lyft less than 500 times.

SELECT *
FROM riders
WHERE total_trips < 500;

-- Answer:
-- This returns all riders whose total_trips value is less than 500.

-- Why this works:
-- total_trips shows how many times each rider has used Lyft.
-- The WHERE clause filters for riders with fewer than 500 trips.


-- Question:
-- Calculate the number of cars that are active.

SELECT COUNT(*)
FROM cars
WHERE status = 'active';

-- Answer:
-- This counts all cars where the status is active.

-- Why this works:
-- COUNT(*) counts the number of rows that match the condition.
-- The WHERE clause filters the cars table to only active cars.

-- Question:
-- It’s safety recall time for cars that have been on the road for a while.
-- Write a query that finds the two cars that have the highest trips_completed.

SELECT id, model, OS, status, trips_completed
FROM cars
ORDER BY trips_completed DESC
LIMIT 2;

-- Answer:
-- This returns the 2 cars with the highest number of completed trips.

-- Why this works:
-- ORDER BY trips_completed DESC sorts the cars from highest to lowest.
-- LIMIT 2 returns only the top 2 cars.



