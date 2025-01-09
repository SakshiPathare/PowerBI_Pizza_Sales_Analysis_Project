select * from pizza_sales;

-- 01
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

-- 02
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS Avg_order FROM pizza_sales;

-- 03
SELECT SUM(quantity) as Pizza_sold  FROM pizza_sales;

-- 04
SELECT COUNT(DISTINCT order_id) AS Total_order FROM pizza_sales; 

-- 05
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_pizza_sold 
FROM pizza_sales; 

-- Date column is string so we are converting it to DATE
SELECT order_date, STR_TO_DATE(order_date, '%Y-%m-%d') AS converted_date
FROM pizza_sales;

SET SQL_SAFE_UPDATES = 0;

UPDATE pizza_sales 
SET order_date = STR_TO_DATE(order_date, '%d-%m-%Y');

ALTER TABLE pizza_sales 
MODIFY order_date DATE;
-- Converted and now order date is of DATE type

-- 06
SELECT DAYNAME(order_date) AS Days, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date);

-- 07
SELECT MONTHNAME(order_date) AS Month_name, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY  MONTHNAME(order_date)
ORDER BY Total_orders DESC;

-- 08
SELECT pizza_category,SUM(total_price) AS Total_sales, SUM(total_price) * 100/
(SELECT SUM(total_price) FROM pizza_sales) AS Percentage_T
FROM pizza_sales
GROUP BY pizza_category;

-- 09
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_sales, CAST(SUM(total_price) * 100/
(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS Percentage_T
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Percentage_T DESC;

-- 10
SELECT pizza_category, SUM(quantity) AS Total_Quantity_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY SUM(quantity) DESC;

-- 11
SELECT pizza_name, SUM(total_price) AS Total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_revenue DESC -- (desc/asc)
LIMIT 5;

SELECT pizza_name,  SUM(quantity) AS Total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity DESC -- (desc/asc)
LIMIT 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_orders 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders DESC -- (desc/asc)
LIMIT 5;

-- THANKYOU!!!



