# Data Analytics Portfolio

# 🍽️ Restaurant Orders Analysis Using MySQL

## Background and Overview

This project analyzes a quarter's worth of order data from a **restaurant serving international cuisine**. The dataset includes:
- Order dates and times
- Individual menu items purchased in each order
- Details on item type, category, and price

The goal is to uncover actionable insights on customer preferences, item popularity, order behavior, and category performance — to guide menu development and sales strategies.

---

## Data Structure Overview

### 1. `menu_items` table
Contains details about each menu item.

| Column        | Description                    |
|---------------|--------------------------------|
| `menu_item_id`| Unique ID for each menu item   |
| `item_name`   | Name of the dish               |
| `category`    | Cuisine type (e.g., Italian)   |
| `price`       | Price of the item              |

### 2. `order_details` table
Logs each item ordered, including date and time.

| Column           | Description                    |
|------------------|--------------------------------|
| `order_details_id` | Unique ID for each item ordered |
| `order_id`         | ID of the overall order         |
| `item_id`          | Foreign key from `menu_items`   |
| `order_date`       | Date the order was placed       |
| `order_time`       | Time the order was placed       |

---

## Executive Summary

Using MySQL, I conducted a deep dive into:
- Menu item pricing and distribution
- Ordering patterns by time and volume
- Top-spending customers and their food preferences
- Cuisine performance by order count and revenue

**Key findings:**
- 🍝 Italian dishes dominate high-spend orders and are most frequently ordered.
- 🕛 Peak order activity occurs around **lunch hours (12–1 PM)**.
- 📦 Large orders (10+ items) are common, suggesting group dining or catering.
- 🔝 Dishes like *Chicken Parmesan*, *Eggplant Parmesan*, and *Spaghetti & Meatballs* consistently appear in top orders.

The mysql queries used to explore the menu items table can be found [here](restaurantordersobj1)
The mysql queries used to explore the orders table can be found here
The mysql queries used to comnbine and explore the combine tables can be found here
---

## Insights Deep Dive

### 🔹 1. Most and Least Ordered Items
- **Most ordered**: `Eggplant Parmesan` (Italian)
- **Least ordered**: Items from underrepresented categories like `Hot Dog` (American)

### 🔹 2. Highest Spend Orders
- The **highest value order** included 12+ items, spanning Italian, Asian, Mexican, and American cuisines.
- **Top items** in expensive orders:
  - *Chicken Parmesan*, *Spaghetti*, *Fettuccine Alfredo*, *Korean Beef Bowl*

### 🔹 3. Order Timing Patterns
- Orders peak between **12:00 PM and 1:00 PM** — likely lunch rush.
- There is noticeable activity spread evenly across weekdays.

### 🔹 4. Cuisine Popularity
- **Italian cuisine** consistently leads in:
  - Item count on the menu
  - Frequency of orders
  - Presence in high-spend group orders

---

##  Recommendations

Based on the analysis, here are data-driven suggestions:

1. **Expand Italian offerings**  
   - The data clearly shows customer preference for Italian food.
   - Consider introducing variants or premium versions of top dishes.

2. **Promote combo deals for lunch hours**  
   - Since peak orders happen around noon, lunch bundles could boost average order value.

3. **Revisit underperforming items/categories**  
   - Items with low order volume (e.g., some American or Asian dishes) may need refinement or replacement.

4. **Introduce group-friendly options**  
   - Several orders contain 10+ items — ideal for family-sized or corporate offerings.
