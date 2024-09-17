-- HAVING Clause: The HAVING clause is often used with the GROUP BY clause to filter groups based on a specified list of conditions. 

-- without aggregate function
Select 
	first_name,
	last_name,
	sum (customer_id) customer_id
From sales.customers
Group By first_name, last_name, customer_id
Having customer_id > 50 And customer_id < 56

-- with aggregate function

Select 
	first_name,
	last_name,
	sum (customer_id) customer_id
From sales.customers
Group By first_name, last_name, customer_id
Having Max(customer_id) = 4

Select *  from sales.customers

-- SQL Server HAVING with the COUNT function example

Select *
From sales.orders

Select customer_id, Year (order_date) year, Count (order_id) order_count
From sales.orders
Group By customer_id, YEAR (order_date)
Having COUNT (order_id) > 2 ANd YEAR (order_date) = 2018 
ORder By customer_id


Select * 
From production.products

Select product_id, model_year, Count(brand_id) brand
From production.products
Group by product_id, model_year 
Having model_year = 2018 And product_id >300 And product_id < 310

-- SQL Server HAVING clause with the SUM() function example

Select order_id,
	   Sum ( quantity * list_price * (1- discount)) net_value
From sales.order_items
Group by order_id
Having  Sum ( quantity * list_price * (1- discount)) > 20000
Order By order_id


Select * from sales.staffs

Select Distinct manager_id, staff_id,first_name + ' ' + last_name As full_name, store_id
From sales.staffs
Group by manager_id, store_id, staff_id, first_name + ' ' + last_name
Having manager_id >= 5
Order by staff_id

-- SQL Server HAVING clause with MAX and MIN functions example

Select category_id,
	   Max (list_price) Max_list_price,
	   Min (list_price) MIn_list_price
From production.products
Group By category_id
Having Max (list_price) > 4999.99 OR Min (list_price) < 400
Order by category_id

-- SQL Server HAVING clause with AVG() function example

Select category_id,
	   Avg (list_price) avg_price
From production.products
Group By category_id

Select category_id,
	   Avg (list_price) avg_price
From production.products
Group By category_id
Having  Avg (list_price) > 3000

Select category_id,
	   Avg (list_price) avg_price
From production.products
Group By category_id
Having  Avg (list_price) Between 500 And 1500

Select category_id,
	   Avg (list_price) avg_price
From production.products
Group By category_id
Having  category_id between 4 And 6





