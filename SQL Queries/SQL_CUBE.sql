-- Introduction to SQL Server CUBE
-- Grouping sets specify groupings of data in a single query. For example, the following query defines a single grouping set represented as (brand):
SELECT 
	brand, 
	SUM(sales)
FROM 
sales.sales_summary
GROUP BY brand

SELECT 
	brand, 
	category,
	SUM(sales) sales
FROM sales.sales_summary
GROUP BY CUBE(brand, category)

SELECT 
	brand, category, SUM(sales) sales
FROM sales.sales_summary
GROUP BY 
	brand,
	CUBE(category);







































