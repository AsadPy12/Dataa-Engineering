-- Joining Tables
-- Practice on Temporary Dataset 
-- Join: give you a brief overview of joins types in SQL Server including inner join, left join, right join, and full outer join.
Create Schema hr;
Go

Create Table hr.candidates(
	id INT primary key identity,
	fullname Varchar(100) Not Null
)

Create Table hr.employees(
	id INT primary key identity,
	fullname varchar(100) Not Null
)

Insert Into		
	hr.candidates(fullname)
Values
	('John Doe'),
	('Lily Bush'),
    ('Peter Drucker'),
    ('Jane Doe');

Insert Into
	hr.employees(fullname)
Values
	('John Doe'),
    ('Jane Doe'),
    ('Michael Scott'),
    ('Jack Sparrow');

-- DROP table hr.employees

Select *
From  hr.candidates

Select *
From  hr.employees


-- INNER JOIN: Inner join produces a data set that includes rows from the left table, and matching rows from the right table.

Select
	c.id candidate_id,
	c.fullname candidate_name,
	e.id employee_id,
	e.fullname employee_name
From hr.candidates c
	Inner Join hr.employees e
		On e.fullname = c.fullname

-- Inner join give the same values of left table
Select 
	c.id id,
	c.fullname candidate_name,
	e.fullname employees_name
From hr.candidates c
Inner Join hr.employees e On e.fullname = c.fullname

-- LEFT JOIN: Left join selects data starting from the left table and matching rows in the right table. The left join returns all rows from the left table and the matching rows from the right table. If a row in the left table does not have a matching row in the right table, the columns of the right table will have nulls.

SELECT  
	c.id candidate_id,
	c.fullname candidate_name,
	e.id employee_id,
	e.fullname employee_name
FROM 
	hr.candidates c
	left Join hr.employees e 
	On e.fullname = c.fullname

-- To get the rows that are available only in the left table but not in the right table, add a WHERE clause to the above query:


SELECT  
	c.id candidate_id,
	c.fullname candidate_name,
	e.id employee_id,
	e.fullname employee_name
FROM 
	hr.candidates c
	left Join hr.employees e 
	On e.fullname = c.fullname
Where e.id Is Null

-- To get the rows that are available matches between both tables, add a WHERE clause to the above query:


SELECT  
	c.id candidate_id,
	c.fullname candidate_name,
	e.id employee_id,
	e.fullname employee_name
FROM 
	hr.candidates c
	left Join hr.employees e 
	On e.fullname = c.fullname
Where e.id Is not Null

-- RIGHT JOIN: It is a reversed version of left join. The right join returns a result set that contains all rows from the right table and the matching rows in the left table. If a row in the right table does not have a matching row in the left table, all columns in the left table will contain nulls.

SELECT  
	c.id candidate_id,
	c.fullname candidate_name,
	e.id employee_id,
	e.fullname employee_name
FROM 
	hr.candidates c
	Right join hr.employees e ON e.fullname = c.fullname

-- Similarly, you can get rows that are available only in the right table by adding a WHERE clause to the above query as follows:

SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    hr.candidates c
    RIGHT JOIN hr.employees e 
        ON e.fullname = c.fullname
WHERE
    c.id IS NULL;

-- FULL JOIN: The full outer join or full join returns a result set that contains all rows from both left and right tables, with the matching rows from both sides where available. In case there is no match, the missing side will have NULL values.

Select
	c.id candidate_id,
	c.fullname candidate_name,
	e.id employee_id,
	e.fullname employee_name
From hr.candidates c
Full Join hr.employees e
On e.fullname = c.fullname

-- To select rows that exist in either the left or right table, you exclude rows that are common to both tables by adding a WHERE clause as shown in the following query:

Select
	c.id candidate_id,
	c.fullname candidate_name,
	e.id employee_id,
	e.fullname employee_name
From hr.candidates c
Full Join hr.employees e
On e.fullname = c.fullname
Where c.id Is Null Or e.id IS Null


























