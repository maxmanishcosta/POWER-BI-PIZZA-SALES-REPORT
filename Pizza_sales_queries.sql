create database Pizza_db;
describe pizza_sales;

select * from pizza_sales;

# KPI-1. Total Revenue - the sum of the total price of all pizza orders.
select sum(total_price) as Revenue from pizza_sales;

# KPI-2. The avg amount spent per order, calculated dividing total revenue by the total number of orders.
select (sum(total_price)/count(distinct order_id)) as Avg_order_value from pizza_sales;

# KPI-3. total pizza sold - the sum of the quantities of all pizzas sold. 
select sum(quantity) as total_pizza_sold from pizza_sales;

# KPI-4. total orders - the total number of order placed
select count(distinct order_id) as total_orders from pizza_sales;

# KPI-5. Avg pizas per order - calculated by dividing the total number of pizza sold by the total number of order
select round((sum(quantity)/count(distinct order_id)),2) as avg_pizza_per_order from pizza_sales;

# Charts Reqirement
# 1. daily trend for total order
SELECT
    dayname(order_date) AS order_day,
    count(distinct order_id) AS total_orders
FROM pizza_sales
GROUP BY order_day
ORDER BY order_day;

# 2. Monthly Trend for total orders
select monthname(order_date) as order_month,
count(distinct order_id) as total_orders
from pizza_sales
Group by order_month 
order by total_orders desc;

#3. Percentage of Sales by pizza category
select pizza_category,
round((sum(total_price)* 100 / (select sum(total_price) from pizza_sales)),2) as Pctg_of_total_sales
from pizza_sales
group by pizza_category;

#4. Percentage of sales by pizza size 
select pizza_size,
round(sum(total_price),2) as total_sales,
round((sum(total_price)* 100 / (select sum(total_price) from pizza_sales)),2) as pctg_of_total_sales_size
from pizza_sales
group by pizza_size
order by pctg_of_total_sales_size desc;

#5. Total pizza sold by category.
select pizza_category,
round(sum(quantity),2) as total_sales
from pizza_sales
group by pizza_category
order by total_sales desc;

#6. Top 5 best seller by revenue
select pizza_name,
	   sum(total_price) as revenue
from pizza_sales
group by pizza_name
order by revenue desc
limit 5;

#7. Top 5 best seller by Quantity
select pizza_name,
	   sum(quantity) as Total_quantity
from pizza_sales
group by pizza_name
order by Total_quantity desc
limit 5;

#8. Top 5 best seller by total_orders
select pizza_name,
	   count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders desc
limit 5;

#9. Top 5 worst seller by revenue
select pizza_name,
	   sum(total_price) as revenue
from pizza_sales
group by pizza_name
order by revenue ASC
limit 5;

#10. Top 5 worst seller by Quantity
select pizza_name,
	   sum(quantity) as Total_quantity
from pizza_sales
group by pizza_name
order by Total_quantity Asc
limit 5;

#11. Top 5 worst seller by total_orders
select pizza_name,
	   count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders desc
limit 5;