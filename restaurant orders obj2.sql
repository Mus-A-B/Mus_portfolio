-- Objective 2 Explore the orders table

-- 1. View the order_details table. 
select *
from order_details;

-- 2. What is the date range of the table?
select 
	min(concat(order_date, ' ', order_time)) as first_order_date,
	max(concat(order_date, ' ', order_time)) as last_order_date,
    concat(datediff(max(order_date), min(order_date)), ' days') as days_diff
from order_details;

select 
	min(order_time) as earliest_order_time,
	max(order_time) as last_order_time   
from order_details;

-- 3. How many orders were made within this date range? 
select 
	format(count(distinct order_id),0) as no_of_orders
from order_details;

-- 4. How many items were ordered within this date range?
select 
	format(count(order_details_id),0) as no_of_ordered_items
from order_details;

-- 5. Which orders had the most number of items?
with ranked_orders as (
	select 
		order_id,
		count(order_details_id) as no_of_order_items,
		rank() over (order by count(order_details_id) desc) as rnk
	from order_details
	group by order_id
	)
select 
	order_id,
    no_of_order_items
from ranked_orders
where rnk = 1;

-- 6. How many orders had more than 12 items?
with orders as (
select 
		order_id,
		count(order_details_id) as no_of_order_items
	from order_details
	group by order_id
    having no_of_order_items > 12
    )
select
	count(*) as orders_with_more_than_12_items
from orders;
    
select 
		order_id,
		count(order_details_id) as no_of_order_items,
        row_number() over () as rownum
	from order_details
	group by order_id
    having no_of_order_items > 12