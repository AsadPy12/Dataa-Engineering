CREATE DATABASE EMPLOYEES
USE EMPLOYEES

CREATE TABLE Employee (
		id INT PRIMARY KEY,
		name VARCHAR (50),
		salary INT,
		managerid INT,
		FOREIGN KEY (managerid) REFERENCES EMPLOYEE(id)
);

INSERT INTO Employee (id, name, salary, managerid)
VALUES (1, 'Ahmed', 45000, NULL),
	   (2, 'Hassan', 46000, 2),
	   (4, 'Subhan', 61000, 2),
	   (3, 'Ashir', 43000, NULL),
	   (5, 'Sami', 65000, 3),
	   (6, 'Asad', 64000, 3);

SELECT * FROM Employee

SELECT e1.name, e1.salary, e2.name AS manager_name, e2.salary AS manager_salary
FROM Employee e1
JOIN Employee e2 ON e1.managerid = e2.id
WHERE e1.salary > e2.salary

SELECT * FROM Assignment.assign.employee

SELECT a1.full_name, a1.salary, a2.full_name AS manager_name, a2.salary AS manager_salary
FROM Assignment.assign.employee a1
JOIN Assignment.assign.employee a2 ON a1.managerid = a2.id
WHERE a1.salary > a2.salary
