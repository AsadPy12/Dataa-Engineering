/* Query 1: Retrieving Data Create a table called employees with the following columns: id, name, age, department. */

create table #employees (
	id INTEGER PRIMARY KEY,
	name VARCHAR (160),
	age INTEGER,
	department VARCHAR (160),
);
INSERT INTO #employees (id, name, age, department)
Values
(1, 'John', 25, 'Sales'),
(2, 'Alice', 30, 'Marketing'),
(3, 'Bob', 35, 'IT'),
(4, 'Emma', 20, 'Sales'),
(5, 'Michael', 40, 'Marketing')

select * from #employees

-- Write a SQL query to retrieve all the employees' names and ages
select 
	name,
	age
From #employees

--Query 2: Filtering Data Using the same employees table, write a SQL query to retrieve the names and ages of employees who are older than 30. 
Select 
	name,
	age
From #employees
Where age > 30

-- Query 3: Sorting Data Using the same employees table, write a SQL query to retrieve all the employees' names and ages, sorted in ascending order by age.
select 
	name,
	age
From #employees
Order by age ASC

-- Query 4: Grouping Data Create a table called orders with the following columns: id, customer_id, order_date, total. Insert the following data.
Create table #orders (
	id Integer,
	customer_id Integer,
	order_date date,
	total INTEGER,
	order_item Varchar (160)
);
Insert INTO #orders (id, customer_id, order_date, total, order_item)
Values
(1, 1, '2022-01-01', 100, 'Bread'),
(2, 1, '2022-01-15', 200, 'Floor'),
(3, 2, '2022-02-01', 50, 'Rice'),
(4, 3, '2022-03-01', 150, 'Sugar'),
(5, 1, '2022-04-01', 250, 'Bread')

select * from #orders

-- Write a SQL query to retrieve the total amount spent by each customer.
select
	   SUM(total) AS Total_amount,
	   customer_id
From #orders 
Group by customer_id


-- Query 5: Joining Tables Using the employees and orders tables, write a SQL query to retrieve the names of employees who have placed an order.
select name
From #employees e
INNER JOIN #orders o ON o.id = e.id 
Group by name

/* Query 6: Filtering with Multiple Conditions

Write a SQL query to retrieve the names of employees who are older than 30 and have placed an order with a total value greater than $100.

Hint: You'll need to join the employees table with the orders table and use the WHERE clause to filter the results. */
select e.name,
	   SUM(total) AS total_amount,
	   o.customer_id
From #orders o
INNER JOIN #employees e ON e.id = o.customer_id
Where o.total > 100 And e.age > 30
GROUP by e.name, o.customer_id

/*Query 7: Grouping and Aggregation

Write a SQL query to retrieve the total value of orders placed by each employee, grouped by employee name.

Hint: You'll need to join the employees table with the orders table, use the SUM aggregation function to calculate the total value of orders, and group the results by employee name.*/
select e.name,
	   SUM(total) AS Total_amount
From #orders o
INNER JOIN #employees e ON e.id = o.customer_id
GROUP by e.name

/*Query 8: Subqueries

Write a SQL query to retrieve the names of employees who have placed an order with a total value greater than the average total value of all orders.

Hint: You'll need to use a subquery to calculate the average total value of all orders, and then use the WHERE clause to filter the results.*/
Select e.name,
	   SUM(o.total) AS total_amount
From #employees e
JOIN #orders o ON o.customer_id = e.id
Group by e.name
Having SUM(o.total) > (Select AVG(total) From #orders);


WITH avg_order_value AS (
  SELECT AVG(total) AS avg_value
  FROM #orders
)
SELECT e.name, o.total
FROM #employees e
JOIN #orders o ON e.id = o.customer_id
WHERE o.total > (SELECT avg_value FROM avg_order_value);

/*Query 9: Joining Multiple Tables

Write a SQL query to retrieve the names of employees, the products they have ordered, and the total value of each order.

Hint: You'll need to join the employees table with the orders table, and then join the orders table with the order_items table (assuming you have such a table).*/
select * from #employees
select * from #orders

Select e.name,
	   o.order_item,
	   SUM(o.total) AS Total_amount
From #employees e
Join #orders o ON o.customer_id = e.id
Group by e.name, o.order_item

































