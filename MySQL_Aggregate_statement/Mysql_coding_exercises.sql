-- COUNT() - exercise
-- How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.

-- COUNT() - solution
SELECT COUNT(DISTINCT dept_no) FROM dept_emp;

-- SUM() - exercise
-- What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?
SELECT SUM(salary) FROM salaries WHERE from_date > '1997-01-01';

-- MIN() and MAX() - exercise
-- 1. Which is the lowest employee number in the database?
SELECT MIN(emp_no) FROM employees;
-- 2. Which is the highest employee number in the database?
SELECT MAX(emp_no) FROM employees;

-- AVG() - exercise
-- What is the average annual salary paid to employees who started after the 1st of January 1997?
SELECT AVG(salary) FROM salaries WHERE from_date > '1997-01-01';

-- ROUND() - exercise
-- Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents.
SELECT ROUND(AVG(salary), 2) FROM salaries WHERE from_date > '1997-01-01';

-- Another example of using COALESCE() - exercise 1
-- Select the department number and name from the ‘departments_dup’ table and add a third column where you name 
-- the department number (‘dept_no’) as ‘dept_info’. 
-- If ‘dept_no’ does not have a value, use ‘dept_name’.
SELECT dept_no,dept_name,COALESCE(dept_no, dept_name) AS dept_info FROM departments_dup ORDER BY dept_no ASC;

-- Another example of using COALESCE() - exercise 2
-- Modify the code obtained from the previous exercise in the following way. 
-- Apply the IFNULL() function to the values from the first and second column, so that ‘N/A’ is displayed whenever a 
-- department number has no value, and ‘Department name not provided’ is shown if there is no value for ‘dept_name’.
SELECT IFNULL(dept_no, 'N/A') as dept_no,IFNULL(dept_name,'Department name not provided') AS dept_name,
COALESCE(dept_no, dept_name) AS dept_info FROM departments_dup ORDER BY dept_no ASC;
