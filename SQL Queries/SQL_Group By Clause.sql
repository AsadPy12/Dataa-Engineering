USE BikeStores
-- GROUP BY CLAUSE: The GROUP BY clause allows you to arrange the rows of a query in groups. The groups are determined by the columns that you specify in the GROUP BY clause.



Select customer_id,
	   MONTH (order_date) order_month
From sales.orders
where customer_id IN (1,2)
Order by customer_id

Select customer_id,
	   Year (order_date) order_year
From sales.orders
Where customer_id In (1, 3, 7)
Group by  customer_id, 
		  Year (order_date)
Order By customer_id

Select distinct customer_id,
				Year (order_date) order_year
From sales.orders
Where customer_id IN (1, 3, 7)
Order By customer_id


--Using GROUP BY clause with the COUNT() function
Select city,
	   COUNT (customer_id) customer_count 
From sales.customers
GROUP BY city 
Order By city

Select *
From sales.customers

Select city, count(customer_id), first_name + ' ' + last_name, customer_id
From sales.customers
where customer_id >= '1444'
Group By city,  first_name + ' ' + last_name, customer_id
Order By city

Select city, state, count (customer_id) customer_count
From sales.customers
Group By state, city
Order By city, state

-- Using GROUP BY clause with the MIN and MAX
-- pass

-- Using GROUP BY clause with SUM function example
Select order_id,
	   Sum (quantity * list_price * (1-discount)) net_value
From sales.order_items
Group by order_id

Select order_id,
	   Sum (quantity * list_price * (1-discount)) net_value
From sales.order_items
Where list_price > 5000
Group by order_id

Select order_id, item_id, Format(Sum (list_price / quantity),'N2') As unit_value
From sales.order_items
Group By order_id, item_id
Order by order_id

Select *
From sales.order_items
Order by order_id




















