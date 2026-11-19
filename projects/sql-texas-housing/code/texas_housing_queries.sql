-- SQL Lab: Texas Housing Market
-- OPAN 6608 Programming III: Massive Data, Georgetown MSBA (Fall 2026)
-- Pedro Sanchez
--
-- Table: housing(entry, city, year, month, sales, volume, median, listings, inventory)
-- Run against housing.db (SQLite).

-- Q1. First 7 records
SELECT *
FROM housing
LIMIT 7;

-- Q2. Records with more than 100 sales AND a median sale price above $100,000
SELECT COUNT(*) AS num_records
FROM housing
WHERE sales > 100 AND median > 100000;

-- Q3. Records with more than 100 sales OR a median below $100,000, by month
SELECT month, COUNT(*) AS num_records
FROM housing
WHERE sales > 100 OR median < 100000
GROUP BY month;

-- Q4. Mean monthly sales by city and year, excluding cities that start with H (top 20)
SELECT city, year, AVG(sales) AS mean_annual_sales
FROM housing
WHERE city NOT LIKE 'H%'
GROUP BY city, year
ORDER BY mean_annual_sales DESC
LIMIT 20;

-- Q5. Sales in Austin in December 2010
SELECT city, year, sales
FROM housing
WHERE city = 'Austin' AND year = 2010 AND month = 12;

-- Q6. Austin's months in 2010, ranked by sales
SELECT month, sales
FROM housing
WHERE city = 'Austin' AND year = 2010
ORDER BY sales DESC;

-- Q7. Top five city-month combinations by sales in 2010, excluding Austin
SELECT city, month, sales
FROM housing
WHERE year = 2010 AND city != 'Austin'
ORDER BY sales DESC
LIMIT 5;

-- Q8. City, year and month with the fewest sales
-- (SQLite returns the row that holds the MIN when other columns are selected alongside it)
SELECT MIN(sales) AS fewest_sales, city, year, month
FROM housing;

-- Q9. Mean sales by year for the whole dataset
SELECT year, AVG(sales) AS mean_sales
FROM housing
GROUP BY year;

-- Q10. Years with mean sales above 600
SELECT year, AVG(sales) AS mean_sales
FROM housing
GROUP BY year
HAVING mean_sales > 600;
