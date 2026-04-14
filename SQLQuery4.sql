select * from pizza_sales;
select sum(total_price) as total_revenue from pizza_sales;

select sum(total_price) / count(DISTINCT order_id) as Avg_order_value from pizza_sales;

select * from pizza_sales
select sum(quantity) AS Total_pizza_sold from pizza_sales;

select * from pizza_sales
select CAST(CAST(sum(quantity) AS DECIMAL (10,2)) /
CAST(count(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_pizzas_per_order from pizza_sales;

select DATENAME(DW, order_date) as order_day, count(DISTINCT order_id) as total_orders
from pizza_sales
group by DATENAME(DW, order_date);

select DATENAME(month, order_date) as Month_name, COUNT(DISTINCT order_id) AS total_orders
from pizza_sales 
group by DATENAME(month, order_date)
order by total_orders DESC;

select * from pizza_sales
select pizza_category, sum(total_price) as total_sales, sum(total_price) * 100 /
(select sum(total_price) from pizza_sales where MONTH(order_date) =1) as PCT
from pizza_sales 
where MONTH(order_date) =1
group by pizza_category;
 
 select pizza_size,CAST(sum(total_price) AS DECIMAL(10,2)) as total_sales,CAST(sum(total_price) * 100 /
(select sum(total_price) from pizza_sales) AS DECIMAL(10,2)) as PCT
from pizza_sales 
where DATEPART(quarter, order_date) =1
group by pizza_size
order by PCT DESC;

use [pizza db];
select top 5 pizza_name, sum(total_price) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue ASC;


use [pizza db]
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC;


select top 5 pizza_name, count(DISTINCT order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders DESC;

