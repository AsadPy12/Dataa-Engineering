Use BikeStores

-- GROUPING SETS

Select *
From sales.order_items

Select 	
	b.brand_name As brand,
	c.category_name As category,
	p.model_year,
	round(Sum(quantity * i.list_price * (1- discount)),0) 
	sales INTO sales.sales_summary
From sales.order_items i
Inner Join production.products p On p.product_id = i.product_id 
Inner Join production.brands b On b.brand_id = p.brand_id
Inner Join production.categories c On c.category_id = p.category_id
Group by 
	b.brand_name,
	c.category_name,
	p.model_year
Order by 
	b.brand_name, c.category_name, p.model_year

Select *
From sales.sales_summary

Select p.model_year As year,
	   b.brand_name As brand,
	   s.quantity 
	   sales INTO sales.information
From sales.order_items o
Inner Join production.products p On p.list_price = o.list_price
Inner Join production.stocks s On s.product_id = p.product_id
Inner Join production.brands b On b.brand_id = p.brand_id
Group by
	p.model_year,
	b.brand_name,
	s.quantity
Order by
	p.model_year,
	b.brand_name,
	s.quantity

	
Select * 
From sales.information
Where sales > 20
Order by year

Select 
	c.category_name,
	p.product_name,
	p.list_price,
	s.store_id,
	o.customer_id,
	i.discount
	sales Into sales.brief
From sales.orders o 
Inner Join sales.order_items i On i.order_id = o.order_id
Inner Join production.products p On p.product_id = i.product_id
Inner Join production.stocks s On s.quantity = i.quantity
Inner Join production.categories c On c.category_id = p.category_id
Group by
	c.category_name,
	p.product_name,
	p.list_price,
	s.store_id,
	o.customer_id,
	i.discount
Order by
	c.category_name,
	p.product_name,
	p.list_price,
	s.store_id,
	o.customer_id,
	i.discount

Select *
From sales.brief

Select *
From sales.sales_summary
Order by brand, category, model_year

-- Getting started with SQL Server GROUPING SETS
Select 
	brand,
	category, 
	Sum(sales) sales
From sales.sales_summary
Group by 
	brand, 
	category
Order by 
	brand,
	category

-------------------------------
-- This can create an error because of no Group by clause
-------------------------------
Select 
	brand,
	category, 
	Sum(sales) sales
From sales.sales_summary
Order by 
	brand,
	category
-------------------------------

Select *
From sales.sales_summary

Select 
	brand,
	Sum (sales) sales
From sales.sales_summary
Group by brand
Order by brand

Select 
	category,
	Sum (sales) sales,
	Max (sales) maximum_sales,
	Min (sales) minimum_sales
From sales.sales_summary
Group by category
Order by sales DESC

Select 
	brand,
	Sum (sales) sales,
	Max (sales) maximum_sales,
	Min (sales) minimum_sales
From sales.sales_summary
Group by brand
Order by brand

SELECT
    SUM (sales) sales
FROM
    sales.sales_summary;


SELECT
	category,
    SUM (sales) sales
FROM
    sales.sales_summary
GROUP BY category
ORDER BY category;

/*To get a unified result set with the aggregated data for all grouping sets, you can use the UNION ALL operator.

Because UNION ALL operator requires all result sets to have the same number of columns, you need to add NULL to the select list of the queries like this:
*/
SELECT 
	brand, 
	category,
	SUM (sales) sales
FROM sales.sales_summary
GROUP BY brand, category
UNION ALL 
SELECT 
	brand,
	NULL,
	SUM (sales) sales
From sales.sales_summary
GROUP BY brand



SELECT 
	brand, 
	category,
	SUM (sales) sales
FROM sales.sales_summary
GROUP BY brand, category
UNION ALL 
SELECT 
	brand,
	NULL,
	SUM (sales) sales
From sales.sales_summary
GROUP BY brand
UNION ALL
SELECT 
	NULL,
	category,
	SUM (sales) sales
FROM sales.sales_summary
GROUP BY category


SELECT 
	brand, 
	category,
	SUM (sales) sales
FROM sales.sales_summary
GROUP BY brand, category
UNION ALL 
SELECT 
	brand,
	NULL,
	SUM (sales) sales
From sales.sales_summary
GROUP BY brand
UNION ALL
SELECT 
	NULL,
	category,
	SUM (sales) sales
FROM sales.sales_summary
GROUP BY category
UNION ALL 
SELECT 
	NULL,
	NULL,
	SUM (sales) sales
FROM sales.sales_summary
ORDER BY brand 


SELECT * FROM sales.sales_summary;

/*The query generated a single result with the aggregates for all grouping sets as we expected.

However, it has two major problems:

The query is quite lengthy.
The query is slow because the SQL Server needs to execute four subqueries and combine the result sets into a single one.
To fix these problems, SQL Server provides a subclause of the GROUP BY clause called GROUPING SETS.

The GROUPING SETS defines multiple grouping sets in the same query. The following shows the general syntax of the GROUPING SETS:

This query creates four grouping sets: 
(column1,column2)
(column1)
(column2)
()

*/


SELECT 
	brand, 
	category,
	SUM (sales) sales
FROM sales.sales_summary
GROUP BY 
	GROUPING SETS (
			(brand, category),
			(brand),
			(category),
			()
	)
ORDER BY brand, category

-- GROUPING function
-- The GROUPING function indicates whether a specified column in a GROUP BY clause is aggregated or not. It returns 1 for aggregated or 0 for not aggregated in the result set.

SELECT *
FROM sales.sales_summary

SELECT
	GROUPING(brand) grouping_brand,
	GROUPING(category) grouping_category,
	brand,
	category,
	SUM(sales) sales
FROM sales.sales_summary
GROUP BY 
	GROUPING SETS (
	        (brand, category),
			(brand),
			(category),
			()
	)
ORDER BY brand





