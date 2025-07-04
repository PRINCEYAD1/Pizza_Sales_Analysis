create database new_project_analysis;

use new_project_analysis;

select* from pizza_sales;

select count(pizza_id) from pizza_sales;

-- 🅰️ KPI-Based Questions


-- 1. What is the Total Revenue generated?
select round(sum(total_price),2) as total_revenue from pizza_sales;



-- 2. What is the Average Order Value?
SELECT 
    CAST(SUM(total_price) / COUNT(DISTINCT order_id)
        AS DECIMAL (10 , 2 )) AS Average_order_value
FROM
    pizza_sales;

-- 3. How many total pizzas have been sold?
select* from pizza_sales;


SELECT 
    COUNT(quantity) AS total_pizza_sold
FROM
    pizza_sales;

-- 4. How many total orders ?
SELECT 
    COUNT(DISTINCT order_id) AS total_orders
FROM
    pizza_sales;


-- 5. What is the average number of pizzas per order?
SELECT 
    ROUND(SUM(quantity) / COUNT(DISTINCT order_id),
            2) AS average_number_order
FROM
    pizza_sales; 	


-- 🅱️ Trend Analysis
-- 6. What is the daily trend of total orders over time?
select* from pizza_sales;

-- based subquery
SELECT 
    AVG(pizza_count) AS AveragePizzaPerOrder
FROM
    (SELECT 
        order_id, SUM(quantity) AS pizza_count
    FROM
        pizza_sales
    GROUP BY order_id) AS PizzaPerOrder;
	

SELECT 
    order_date,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY order_date
ORDER BY order_date;



-- 7. How do orders vary month by month?



SELECT 
  MONTHNAME(order_date) AS Month_Name,
  COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY MONTH(order_date);

SELECT 
  MONTHNAME(order_date) AS Month_Name,
  COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY MONTH(order_date);






-- 🅲 Sales Breakdown
-- 8. What percentage of total sales comes from each pizza category?

select* from pizza_sales;


select pizza_category,cast(sum(total_price) as decimal(10,2)) as total_revinue, 
cast(sum(total_price) * 100/(select sum(total_price) from pizza_sales) as decimal (10,2)) as Percentage  
from pizza_sales
group by pizza_category;





-- 9. What percentage of total sales comes from each pizza size?
select pizza_size,cast(sum(total_price) as decimal(10,2)) as total_revinue, 
cast(sum(total_price) * 100/(select sum(total_price) from pizza_sales) as decimal (10,2)) as Percentage  
from pizza_sales
group by pizza_size
order by pizza_size;

-- 🅳 Category-Level Analysis
-- 10. How many total pizzas were sold in each pizza category?
select * from pizza_sales;

SELECT 
    SUM(quantity) AS total_pizza_sold, pizza_category
FROM
    pizza_sales
GROUP BY pizza_category
order by total_pizza_sold desc;



-- 🅴 Performance Insights
-- 11. Which are the top 5 pizzas by total revenue?
select * from pizza_sales;

SELECT 
    SUM(total_price) AS total_revenue, pizza_name
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5;



-- 12. Which are the bottom 5 pizzas by total revenue?

SELECT 
    pizza_name, SUM(total_price) AS total_revenue
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC
LIMIT 5;


-- 13. Which are the top 5 pizzas by quantity sold?

SELECT 
    pizza_name, SUM(quantity) AS total_quantity_sold
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity_sold DESC
LIMIT 5;



-- 14. Which are the bottom 5 pizzas by quantity sold?

SELECT 
    pizza_name, SUM(quantity) AS quantity_sold
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY quantity_sold ASC
LIMIT 5;

 
-- 15. Which are the top 5 pizzas by number of orders?
select * from pizza_sales;

SELECT 
    pizza_name, COUNT(DISTINCT order_id) AS Number_Orders
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY Number_Orders DESC
LIMIT 5;




-- 16. Which are the bottom 5 pizzas by number of orders?
SELECT 
    pizza_name, COUNT(DISTINCT order_id) AS Number_Orders
FROM
    pizza_sales
GROUP BY pizza_name
ORDER BY Number_Orders ASC
LIMIT 5;


