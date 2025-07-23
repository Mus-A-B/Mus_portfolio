-- 1. view menu items table
select *
from menu_items;

-- 2. find the number of items on the menu
select 
	count(menu_item_id) as num_menu_items
from menu_items;

-- 3. what are the least and most expensive items on the table
select 
	item_name,
    category,
    price,
    'Most expensive menu item' as Price_Category
from menu_items
where price = (select max(price) from menu_items)

union all
select 
	item_name,
    category,
    price,
    'Cheapest menu item' as Price_Category
from menu_items
where price = (select min(price) from menu_items);
    
-- 4. how many italian dishes are on the table
select count(menu_item_id) as num_of_italian_dishes
from menu_items
where category = 'Italian';

-- 5. what are the least and most expensive italian dishes on the menu
select
	'Most expensive Italian dish' as Price_Category,
	item_name,
    category,
    price
from menu_items
where category = 'Italian'
and price = (select max(price) from menu_items where category = 'Italian')

union all

select 
	'Cheapest Italian dish' as Price_Category,
	item_name,
    category,
    price
from menu_items
where category = 'Italian' and price = (select min(price) from menu_items where category = 'Italian');

-- 6. how many dishes are in each category
select 
	category, 
    count(menu_item_id) as num_of_dishes
from menu_items
group by category;

-- 7. what is the average price within each category
select 
	distinct category,
    round(avg(price) over (partition by category),2) as average_price
from menu_items;
