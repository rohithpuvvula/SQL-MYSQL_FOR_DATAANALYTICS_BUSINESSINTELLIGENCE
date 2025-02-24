-- SELECT - FROM - exercise
-- Select the information from the “dept_no” column of the “departments” table.

-- Select all data from the “departments” table.

-- SELECT - FROM - solution
SELECT
    dept_no
FROM
    departments;
    -- OR
SELECT
    *
FROM
    departments;
-- WHERE - exercise
-- Select all people from the “employees” table whose first name is “Elvis”.

-- WHERE - solution
SELECT * FROM employees WHERE first_name = 'Elvis';

-- AND - exercise
-- Retrieve a list with all female employees whose first name is Kellie.
-- AND - solution

SELECT * FROM employees WHERE first_name = 'Kellie' AND gender = 'F';  

-- OR - exercise
-- Retrieve a list with all employees whose first name is either Kellie or Aruna.
-- OR - solution
SELECT * FROM employees WHERE first_name = 'Kellie' OR first_name = 'Aruna'; 

-- Operator precedence - exercise
-- Retrieve a list with all female employees whose first name is either Kellie or Aruna.
-- Operator precedence - solution
SELECT * FROM employees WHERE gender = 'F' AND (first_name = 'Kellie' OR first_name = 'Aruna');

-- IN - NOT IN - exercise 1
-- Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.
-- IN - NOT IN - solution 1
SELECT * FROM employees WHERE first_name IN ('Denis' , 'Elvis');

-- IN - NOT IN - exercise 2
-- Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.
-- IN - NOT IN - solution 2
SELECT * FROM employees WHERE first_name NOT IN ('John' , 'Mark', 'Jacob');

-- LIKE - NOT LIKE - exercise
-- Working with the “employees” table, use the LIKE operator to select the data about all individuals, 
-- whose first name starts with “Mark”; specify that the name can be succeeded by any sequence of characters.
-- Retrieve a list with all employees who have been hired in the year 2000.
-- Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”. 
LIKE - NOT LIKE - solution
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');

SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');

SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');
    
-- Wildcard characters - exercise
-- Extract all individuals from the ‘employees’ table whose first name contains “Jack”.
-- Once you have done that, extract another list containing the names of employees that do not contain “Jack”.
-- Wildcard characters - solution
SELECT * FROM employees WHERE first_name LIKE ('%JACK%');

SELECT * FROM employees WHERE first_name NOT LIKE ('%Jack%'); 


-- BETWEEN - AND - exercise
-- Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
SELECT * FROM salaries WHERE salary BETWEEN 66000 AND 70000;
-- Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.
SELECT * FROM employees WHERE emp_no NOT BETWEEN '10004' AND '10012';
-- Select the names of all departments with numbers between ‘d003’ and ‘d006’.
SELECT dept_name FROM departments WHERE dept_no BETWEEN 'd003' AND 'd006';

-- IS NOT NULL - IS NULL - exercise
-- Select the names of all departments whose department number value is not null.
-- IS NOT NULL - IS NULL - solution
SELECT dept_name FROM departments WHERE dept_no IS NOT NULL;

-- Other comparison operators - exercise
-- Retrieve a list with data about all female employees who were hired in the year 2000 or after.
SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01'
        AND gender = 'F';
-- Hint: If you solve the task correctly, SQL should return 7 rows.
-- Extract a list with all employees’ salaries higher than $150,000 per annum.
SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;
    
-- SELECT DISTINCT - exercise
-- Obtain a list with all different “hire dates” from the “employees” table.
-- Expand this list and click on “Limit to 1000 rows”. This way you will set the limit of output rows displayed back to the default of 1000.
SELECT DISTINCT hire_date FROM employees;

-- Introduction to aggregate functions - exercise
-- How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?
-- How many managers do we have in the “employees” database? Use the star symbol (*) in your code to solve this exercise.
select count(*) from salaries where salary>=100000;
select count(*) from dept_manager;

-- ORDER BY - exercise
-- Select all data from the “employees” table, ordering it by “hire date” in descending order.
select * from employees order by hire_date desc;

-- Using Aliases (AS) - exercise
-- This will be a slightly more sophisticated task.

-- Write a query that obtains two columns. The first column must contain annual salaries higher than 80,000 dollars. 
-- The second column, renamed to “emps_with_same_salary”, must show the number of employees contracted to that salary. 
-- Lastly, sort the output by the first column.
SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary;

-- HAVING - exercise
-- Select all employees whose average salary is higher than $120,000 per annum.
-- Hint: You should obtain 101 records.
-- Compare the output you obtained with the output of the following two queries:
SELECT 
    *, AVG(salary)
FROM
    salaries
WHERE
    salary > 120000
GROUP BY emp_no
ORDER BY emp_no;
--
SELECT 
    *, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000;

-- HAVING - solution
SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

-- WHERE vs HAVING - Part II - exercise
-- Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.

-- Hint: To solve this exercise, use the “dept_emp” table.
-- WHERE vs HAVING - Part II - solution
SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

-- LIMIT - exercise
-- Select the first 100 rows from the ‘dept_emp’ table.
SELECT 
    *
FROM
    dept_emp
LIMIT 100; 





