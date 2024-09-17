Use BikeStores

Select city, count(city) AS city_count
From sales.customers
Group by city
Order by city;

Select category_id,
	   MIN (list_price) as min_value,
	   MAX (list_price) as max_value,
	   AVG (list_price) as avg_value
From production.products
Group by category_id
Having  MIN (list_price) > 500 AND MAX (list_price) > 3000;

Select brand,
	   category,
	   SUM(sales) AS total_sales
From sales.sales_summary
Group by 
		cube (brand, category)
Order by 
		brand


Select brand,
	   category,
	   SUM(sales) AS total_sales
From sales.sales_summary
Group by 
		ROLLUP (brand, category)
Order by 
		brand

Select first_name, last_name
From sales.customers
UNION
Select first_name, last_name 
From sales.staffs
Order by first_name;

SELECT first_name, last_name
FROM sales.customers
UNION ALL
SELECT first_name, last_name
FROM sales.staffs
ORDER BY first_name, last_name;


Select last_name
From sales.customers
INTERSECT
Select last_name
From sales.staffs


Select city
From sales.customers
INTERSECT
Select city
From sales.stores
Order by city;


Select city 
From sales.customers
Except 
Select city
From sales.stores
Order by city;









