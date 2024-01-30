-- USE SHOP
SELECT *FROM SALES1

SELECT *
FROM SALES1 as s
WHERE s.store = 'London'
   AND s.Month <> 'Dec'
   AND s.SalesAmount > 50.0
   AND s.SalesPerson IN ('Bill', 'Frank');
   
SELECT 
   s.Week,
   COUNT(*)
FROM SALES1 s
GROUP BY s.WEEK;

-- Ascending order
SELECT 
	s.week,
    COUNT(*) as num_sales 
FROM SALES1 s
GROUP BY s.week
ORDER BY s.week ASC;

-- Find out how many sales were recorded each week on different days of the week
SELECT
	s.week,
    s.day,
    COUNT(*) AS num_sales
FROM SALES1 s
GROUP BY week, day
ORDER BY week, day;

-- Change salesperson's name Inga to Annette
UPDATE SALES1
SET salesperson = 'Annette'
WHERE salesperson = 'Inga';

-- Find out how many sales did Annette do
SELECT 
   COUNT(*) AS num_sales_annette
   FROM SALES1 s
   WHERE salesperson = 'Annette';
   
-- Find the total sales amount by each person by day
SELECT
    salesperson,
    day,
    SUM(salesamount) as total_sales_amount
FROM SALES1
GROUP BY salesperson, day
ORDER BY salesperson, day;

-- How much each person sold for the given period
SELECT 
    salesperson,
    SUM(salesamount) as total_sales_amount
FROM SALES1
GROUP BY salesperson
ORDER BY salesperson;

-- How much(sum) each person sold for the given period 
SELECT
    salesperson,
    COUNT(*) as num_sales,
    SUM(salesamount) as total_sales_amount,
    AVG(salesamount) as avg_sale_amount,
    MIN(salesamount) as lowest_sale_amount,
    MAX(salesamount) as highest_sale_amount
FROM SALES1 s
GROUP BY salesperson
ORDER BY salesperson;

-- Find the total monetary sales amount achieved by each store
SELECT 
	store,
    SUM(salesamount) as total_sales_amount
FROM SALES1 s
GROUP BY store
ORDER BY store;

-- Find the number of sales by each person if they did less than 3 sales for the past period
SELECT 
	salesperson,
    COUNT(salesamount) AS num_of_sales
FROM SALES1 s
GROUP BY salesperson
HAVING COUNT(salesamount) < 3
ORDER BY salesperson;

-- 12.	Find the total amount of sales by month where combined total is less than £100
SELECT 
	month,
    SUM(salesamount) as total_sales_amount
FROM SALES1 s
GROUP BY month
HAVING SUM(salesamount) < 100
ORDER BY month;
