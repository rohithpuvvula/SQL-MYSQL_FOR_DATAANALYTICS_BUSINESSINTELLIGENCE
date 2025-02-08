-- COUNT() - Exercise #1
-- How many job titles are there in the employees_10 database? Use the titles table to answer the question.
select COUNT(distinct title) from titles;

-- SUM() - Exercise #1
-- What is the total amount of all contract salary values for contracts starting before January 1, 1995?
select sum(salary) from salaries where from_date < '1995-01-01';

-- MIN() and MAX() - Exercise #1
-- What is the lowest department number (dept_no) in the departments table? 
select min(dept_no) from departments;

-- MIN() and MAX() - Exercise #2
-- What is the highest department number (dept_no) in the departments table? 
select max(dept_no) from departments;

-- AVG() - Exercise #1
-- What is the average contract salary value for contracts starting on or before December 31, 1994 or earlier?
select avg(salary) from salaries where from_date<='1994-12-31';

-- ROUND() - Exercise #1
-- What is the average contract salary value for contracts starting on or before November 29, 1994 or earlier? 
-- Round your answer to the nearest dollar, with no cents, and name the resulting column average_salary.
select round(avg(salary)) as average_salary from salaries where from_date<='1994-11-29';

-- COALESCE() - Exercise #1
-- Retrieve the employee number, date of birth, and first name for all individuals from the employees table. 
-- Use a function to ensure that their last name is displayed in place of the first name if a null value is encountered in the 
-- first name for a given record.
select emp_no,birth_date,coalesce(first_name,last_name,first_name) as name from employees;

-- COALESCE() - Exercise #2
-- Retrieve the employee number, date of birth, and first and last names for all individuals from the employees table. 
-- Use a function to ensure that "Not provided" is displayed in place of the first name if a null value is encountered for a given record.
select emp_no,birth_date, coalesce(first_name,"Not provided") as first_name,last_name from employees;
