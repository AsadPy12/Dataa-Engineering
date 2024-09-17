USE BikeStores
--INNER JOIN: select rows from a table that have matching rows in another table.


Select product_name, list_price, category_id
From production.products

Select *
From production.categories

Select
	product_name,
	list_price,
	category_name
From production.products p 
Inner Join production.categories c ON c.category_id = p.category_id
Order by product_name Desc

Select
	product_id,
	category_name,
	brand_name,
	product_name,
	list_price
From production.products p
Inner Join production.brands b On b.brand_id = p.brand_id
Inner Join production.categories c On c.category_id = p.category_id
Where list_price >= 4000
Order By product_name Desc

Select
	product_id,
	category_name,
	brand_name,
	product_name,
	list_price
From production.products p
Inner Join production.brands b On b.brand_id = p.brand_id
Inner Join production.categories c On c.category_id = p.category_id
Where list_price < = 4000
Order By product_name Desc












