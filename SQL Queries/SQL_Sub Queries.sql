/* Write a query which returns order_id,order_date & customer where city = 'New York' and Ddata should be sorted 
 on order date*/

Use BikeStores

Select c.customer_id,
	   o.order_id,
	   o.order_date
From sales.orders o
Inner Join sales.customers c  ON o.customer_id = c.customer_id 
Where c.city = 'New York'
Order by order_date;


SELECT 
	s.order_id,
	s.order_date,
	c.customer_id

FROM sales.orders s
INNER JOIN sales.customers c on c.customer_id = s.customer_id
where c.city = 'New York'
ORDER BY 
	order_date;


/* 
Subquery:
	A subquery is a query nested inside another statement such as SELECT, INSERT, UPDATE, or DELETE. 
*/

Select	
	order_id,
	order_date,
	customer_id

From sales.orders
Where customer_id IN (
		Select customer_id 
		From sales.customers
		Where city = 'New York'
		)
Order by order_date;

-- Note that you must always enclose the SELECT query of a subquery in parentheses ().

-- Correlated subquery

/* A correlated subquery is a subquery that uses the values of the outer query. In other words, 
  the correlated subquery depends on the outer query for its values. */

Select
	product_name,
	list_price,
	category_id
From production.products p1
Where list_price IN (
		Select MAX (p2.list_price)
		From production.products p2
		Where p2.category_id = p1.category_id
		Group by p2.category_id)

Order by category_id,
		 product_name;

-- EXISTS
/* The EXISTS operator is a logical operator that allows you to check whether a subquery returns any row. 
The EXISTS operator returns TRUE if the subquery returns one or more rows.*/

--(remaining)
/* Write a  subquery that returns customers who place more than two orders*/
SELECT
    customer_id,
    first_name,
    last_name
FROM
    sales.customers c
WHERE
    customer_id IN (
        SELECT
            customer_id
        FROM
            sales.orders o
        GROUP BY
            customer_id
        HAVING
            COUNT(customer_id) > 2
    )
ORDER BY
    first_name,
    last_name;


-- By using exists
Select  c.customer_id,
		first_name,
		last_name
From sales.customers c 
Where Exists (
Select count(*)
From sales.orders o
Where customer_id = c.customer_id
Group by customer_id
)
Order by  first_name, last_name
	























































































