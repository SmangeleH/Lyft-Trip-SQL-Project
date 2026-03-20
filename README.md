# Lyft-Trip-SQL-Project
SQL project focused on creating relational tables, inserting structured data, and using joins, unions, filters, and aggregates to analyze Lyft trip activity. This project demonstrates practical SQL skills including LEFT JOIN, INNER JOIN, UNION, AVG(), COUNT(), sorting, and filtering.


# Lyft Trip SQL Project

## Overview
This project is a SQL portfolio project based on a fictional Lyft trip dataset. It demonstrates how to create relational tables, insert data, and analyze trip, rider, and car information using core SQL concepts.

The project is designed to practice working with multiple related tables and answering business-style questions using SQL queries.

## Skills Demonstrated
- Creating databases and tables
- Inserting structured data
- Defining primary keys
- Cross joins
- Left joins
- Inner joins
- Union
- Aggregate functions
- Filtering with `WHERE`
- Sorting with `ORDER BY`
- Limiting results with `LIMIT`

## Database Structure
The project includes the following tables:

### 1. `trips`
Stores trip-level information such as:
- trip ID
- trip date
- pickup time
- dropoff time
- rider ID
- car ID
- trip type
- cost

### 2. `riders`
Stores rider information such as:
- rider ID
- first name
- last name
- username
- rating
- total trips
- referral ID

### 3. `riders2`
Stores new rider records for union practice.

### 4. `cars`
Stores car information such as:
- car ID
- model
- operating system
- status
- completed trips

## Project Objectives
This project answers a series of SQL questions related to:
- identifying primary keys
- understanding cross joins
- linking trips to riders
- linking trips to cars
- combining rider datasets
- calculating averages
- filtering user activity
- counting active cars
- finding the most-used cars

## Example Queries Included
Some of the SQL queries in this project include:

- Cross join between `riders` and `cars`
- `LEFT JOIN` between `trips` and `riders`
- `INNER JOIN` between `trips` and `cars`
- `UNION` between `riders` and `riders2`
- Average trip cost using `AVG()`
- Filtering riders with fewer than 500 trips
- Counting active cars
- Finding the top 2 cars by `trips_completed`

## Key Learnings
Through this project, I practiced how relational databases work and how different tables connect using keys. I also learned how to answer simple business questions with SQL by combining tables and applying aggregate functions.

A key takeaway from this project is understanding that:
- not every join is meaningful for analysis
- joins should reflect real relationships in the data
- aggregate functions help summarize operational data quickly

## Sample Business Questions Answered
- Which rider is linked to each trip?
- Which car was used for each trip?
- What is the average trip cost?
- Which riders are irregular users?
- How many cars are currently active?
- Which cars have completed the most trips?

## Tools Used
- SQL
- MySQL-style syntax

## How to Run
1. Create the database:
   ```sql
   CREATE DATABASE IF NOT EXISTS lyft_trip_project;
   USE lyft_trip_project;
