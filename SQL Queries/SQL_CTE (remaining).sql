-- Common Table Expression -> CTE

/* CTE stands for common table expression. A CTE allows you to define a temporary named result set that available temporarily in the 
execution scope of a statement such as SELECT, INSERT, UPDATE, DELETE, or MERGE. 

WITH expression_name[(column_name [,...])]
AS
    (CTE_definition)
SQL_statement;


*/

-- return the average number of sales orders in 2018 for all sales staffs.
With cte_sales AS (
	Select staff_id,
		   COUNT(*) order_count
	From sales.orders 
	Where year(order_date) = 2018
	Group by staff_id
)
Select AVG(order_count) average_order
From cte_sales;
--remaining
