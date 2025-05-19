CREATE database titanic_data;
use titanic_data;

-- CREATE TABLE titanic;

-- BASIC SELECTION AND FILTERING QUERIES:
-- 1. Retrieve all passengers from the dataset:
SELECT * FROM titanic;

-- 2. Retrieve passengers who survived:
SELECT * FROM titanic 
WHERE survived = 1;

-- 3. Retrieve passengers who did not survive:
SELECT * FROM titanic
WHERE survived = 0;

-- 4. Find passengers who were in first class:
SELECT * FROM titanic
WHERE p_class = 1;

-- 5. Find passengers whose age is unknown (NULL values):
SELECT * FROM titanic
WHERE age IS NULL;


-- AGGREGATION AND GROUPING:
-- 1. Count the total number of passengers.
SELECT COUNT(*) as total_passengers
FROM titanic; 

-- 2. Count how many passengers survived vs. didn't survive:
SELECT COUNT(*) as count 
FROM titanic
GROUP BY survived;

-- 3. Find the average age of passengers per class:
SELECT AVG(age) AS avg_age
FROM titanic
GROUP BY p_class;

-- 4. Find the most expensive fare paid:
SELECT round(MAX(fare),2) AS highest_fare
FROM titanic;

-- 5. Find the least expensive fare paid:
SELECT round(MIN(fare),2) AS lowest_fare
FROM titanic;


-- SORTING AND ADVANCED QUERIES:
-- 1. Retrieve the top 10 oldest passengers:
SELECT * FROM titanic
ORDER BY age DESC LIMIT 10;

-- 2. Find passengers who paid more than $50 for their fare:
SELECT * FROM titanic
WHERE fare > 50;

-- 3. List passengers grouped by embarkation port:
SELECT embarked, COUNT(*) as passenger_count
FROM titanic 
GROUP BY embarked;

-- 4. Find passengers with family members onboard (siblings or parents/children):
SELECT * FROM titanic WHERE sib_sp > 0 AND par_ch > 0;

-- 5. Find passengers who had cabins assigned:
SELECT * FROM titanic WHERE cabin IS NOT NULL;

-- 6. Retrieve passengers with last names starting with "B":
SELECT * FROM titanic WHERE name LIKE 'B%';

-- 7. Find the youngest survivor:
SELECT * FROM titanic
WHERE survived = 1
ORDER BY age LIMIT 1;

-- 8. Calculate the survival rate per class:
SELECT p_class, COUNT(*) as total_passengers,
SUM(survived) as survived_count,
((SUM(survived)/ COUNT(*))*100) as survival_rate
FROM titanic
GROUP BY p_class;

-- 9. Calculate the survival rate per gender:
SELECT sex, COUNT(*) as total_passengers,
SUM(survived) as survived_count,
((SUM(survived) / COUNT(*))*100) as survival_rate
FROM titanic 
GROUP BY sex;

-- 10. Find passengers who were traveling alone (no family onboard):
SELECT * FROM titanic WHERE sib_sp = 0 AND par_ch = 0;
