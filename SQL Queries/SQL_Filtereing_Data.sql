-- Filtering Data 
-- * Distinct * 
-- Sometimes, you may want to get only distinct values in a specified column of a table. To do this, you use the SELECT DISTINCT clause as follows:
Use BikeStores

Select * From sales.customers

Select city
From sales.customers
Order by city
-- The output indicates that the cities are duplicates.

Select Distinct city
From sales.customers
Order By city
-- The output shows that the SELECT DISTINCT returns only distinct cities without duplicates.

-- Examples
Select Distinct phone 
From sales.customers
Order By phone Asc

Select Distinct street, state
From sales.customers
Order By state Desc

Select Distinct street, first_name
From sales.customers
Order By first_name Desc


-- * Where *
-- To retrieve the rows from the table that satisfy one or more conditions, you use the WHERE clause as follows:

-- Operators in Where = And, Or, Not, Between, In, Like

Select *
From sales.customers
Where first_name  = 'Debra'

Select Distinct * 
From sales.customers
Where state = 'CA'
Order By first_name

Select Distinct first_name
From sales.customers
Where len(first_name) < 4

Select Distinct *
From sales.customers
Where state != 'TX'

Select *
From production.products

Select Distinct
	product_id,
	product_name,
	category_id,
	list_price
From production.products
Where category_id = 5

Select product_name
From production.products
Where len(product_name) > 30
Order By brand_id 

Select 
	product_id,
	product_name,
	category_id,
	list_price
From production.products
Where category_id = 5 And list_price > 3500.99

Select 
	product_id,
	product_name,
	list_price
From production.products
Where list_price > 3000 OR product_id > 300
Order by list_price

Select 
	product_id,
	product_name,
	list_price
From production.products
Where list_price > 3000 And product_id > 300
Order by list_price

Select 
	product_id,
	product_name,
	list_price
From production.products
Where list_price Between 1800 And 2000
Order By list_price

Select 
	product_id,
	product_name,
	list_price
From production.products
Where list_price In (299.99, 369.99, 489.99)

Select 
	product_id,
	product_name,
	list_price
From production.products
Where product_name Like '%Cruiser%'
Order by list_price

-- When you use the SELECT statement to query data from a table,
-- SQL Server uses the column names as the column headings for the output. 
-- For example:


Select *
from sales.customers

Select first_name, last_name
from sales.customers
Order By first_name

Select first_name + ' ' + last_name
From sales.customers
Order By first_name

Select first_name, last_name, street + ' , ' + city As Address
From sales.customers
Order By city, first_name

Select first_name + ' ' + last_name As Full_name, zip_code, state
From sales.customers
Where state = 'Tx'
Order by first_name

Select *
From production.categories


Select category_name 'Product Category'
From production.categories

SELECT
    category_name 'Product Category'
FROM
    production.categories
ORDER BY
    category_name; 

SELECT
    category_name 'Product Category'
FROM
    production.categories
ORDER BY
    'Product Category';

-- last table alias portion remaining....











