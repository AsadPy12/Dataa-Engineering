-- USE BikeStores
SELECT *
FROM sales.customers

-- Data Sorting ORDER BY clause

SELECT *
From sales.customers
Order By first_name Asc

SELECT *
From sales.customers
Order By first_name Desc


SELECT city
From sales.customers
Order by city


Select customer_id,  first_name, zip_code
from sales.customers
Order By customer_id Asc

Select first_name, last_name, phone
From sales.customers
Order By first_name Asc, last_name Asc

Select city, first_name, last_name
From sales.customers
Order By state

Select first_name, last_name
From sales.customers
Order By len(first_name) Asc

Select first_name, last_name
From sales.customers
Order By len(first_name) Desc

Select first_name, last_name 
From sales.customers
Order By 2, 1 --this example, 1 means the first_name column, and 2 means the last_name column.


