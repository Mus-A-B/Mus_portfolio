-- 1. combine the menu items and order details tables into one table
select *
from menu_items mi
right join order_details od
on mi.menu_item_id = od.item_id;

-- 2. what are the least and most ordered items? what categories are they in?
with ranked_orders as(
	select 
		mi.item_name,
		mi.category,
		count(od.item_id) as no_of_orders,
		rank() over (order by count(od.item_id)desc) as rnk
	from menu_items mi
	right join order_details od
	on mi.menu_item_id = od.item_id
	group by menu_item_id
    )
    
select *
from ranked_orders
where rnk = 1;

with ranked_orders as(
	select 
		item_name,
		category,
		count(item_id) as no_of_orders,
		rank() over (order by count(item_id)desc) as rnk
	from menu_items mi
	right join order_details od
	on mi.menu_item_id = od.item_id
	group by menu_item_id
    )
    
select *
from ranked_orders
where rnk = (select max(rnk) from ranked_orders);


-- 3. what were the top 5 orders that spent the most money?
with ranked_order_values as (
	select 
		order_id,
		format(sum(mi.price),2) as order_value,
		rank() over (order by sum(mi.price) desc) as rnk
	from menu_items mi
	right join order_details od
	on mi.menu_item_id = od.item_id
	group by od.order_id)

select 
	order_id,
    order_value
from ranked_order_values
where rnk <= 5;

-- 4. view the details of the highest spend order. what insights can you gather from the results?
select * 
from menu_items mi
right join order_details od
on mi.menu_item_id = od.item_id
where order_id = ( with ranked_order_values as (
	select 
		order_id,
		format(sum(mi2.price),2) as order_value,
		rank() over (order by sum(mi2.price) desc) as rnk
	from menu_items mi2
	right join order_details od2
	on mi2.menu_item_id = od2.item_id
	group by od2.order_id)
select 
	order_id
from ranked_order_values
where rnk = 1
)
order by category;

  
-- 5. view the details of the top 5 highest spend orders. what insights can you gather from the results?
select 
	mi.*,
    category,
	count(category) over (partition by category) as category_count
from menu_items mi
right join order_details od
on mi.menu_item_id = od.item_id
where order_id IN 
( with ranked_order_values as (
	select 
		order_id,
		format(sum(mi2.price),2) as order_value,
		rank() over (order by sum(mi2.price) desc) as rnk
	from menu_items mi2
	right join order_details od2
	on mi2.menu_item_id = od2.item_id
	group by od2.order_id)
select 
	order_id
from ranked_order_values
where rnk < 6
)
order by category_count desc;