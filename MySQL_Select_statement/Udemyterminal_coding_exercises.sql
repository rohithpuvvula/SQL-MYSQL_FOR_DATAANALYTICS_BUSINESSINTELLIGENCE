-- SELECT - FROM - Exercise #1
-- Execute a query that sets employees_10 as the default database.

use employees_10;

-- SELECT - FROM - Exercise #2
-- Retrieve all records from the employees table.

-- You might consider exploring two ways of writing the query.
--  In one version, specify the database where the employees table is stored. 
-- In the other, assume it is understood that we are referring to the employees_10 database.
-- Also, please note that unlike when working locally with MySQL Workbench, 
-- you might find that the output here is automatically ordered in a different way.
SELECT * FROM employees;

-- SELECT - FROM - Exercise #3
-- Retrieve all data from the departments table.
SELECT * FROM DEPARTMENTS;

-- SELECT - FROM - Exercise #4
-- Retrieve all data from the department number column (dept_no) in the departments table.
SELECT dept_no FROM DEPARTMENTS;

-- SELECT - WHERE - Exercise #1
-- Retrieve all records of employees from the employees table whose first name is 'Saniya' .
SELECT * FROM EMPLOYEES WHERE FIRST_NAME ='Saniya';

-- SELECT - AND - Exercise #1
-- Retrieve all data for all female employees with the last name 'Bamford'.
SELECT * FROM EMPLOYEES WHERE LAST_NAME='Bamford' AND GENDER='F';

-- SELECT - OR - Exercise #1
-- Retrieve all records from the employees table for employees whose first name is either 'Bezalel' or 'Anneke'.
SELECT * FROM EMPLOYEES WHERE FIRST_NAME='Bezalel' OR FIRST_NAME='Anneke';

-- SELECT - Operator Precedence - Exercise #1
-- Retrieve all data for female employees from the employees table whose last name is 'Bamford' or 'Peac'.
SELECT * FROM EMPLOYEES WHERE (LAST_NAME='Bamford'OR LAST_NAME='Peac') AND GENDER='F';

-- SELECT - IN - NOT IN - Exercise #1
-- Use the IN operator to retrieve all records from the employees table for 
-- employees whose first name is in the following list: ('Parto', 'Georgi').
SELECT * FROM EMPLOYEES WHERE FIRST_NAME IN ('Parto','Georgi');

-- SELECT - IN - NOT IN - Exercise #2
-- Use the IN operator to retrieve all records from the employees table for employees whose
-- first name is not in the following list: ('Georgi', 'Parto', 'Anneke').
SELECT * FROM EMPLOYEES WHERE FIRST_NAME NOT IN ('Georgi','Parto','Anneke');

-- SELECT - LIKE - NOT LIKE - Exercise #1
-- Use the LIKE operator to retrieve all records from the employees table for employees whose first name starts with the letter 'S'.
SELECT * FROM EMPLOYEES WHERE FIRST_NAME like 'S%';

-- SELECT - LIKE - NOT LIKE - Exercise #2
-- Use the LIKE operator and the % character to retrieve all records from the employees table for employees hired in 1989.
SELECT * FROM EMPLOYEES WHERE HIRE_DATE like '%1989%';

-- SELECT - LIKE - NOT LIKE - Exercise #3
-- Use the LIKE operator with the _ character to retrieve all records from the employees table for employees born in the 1950s.
SELECT * FROM EMPLOYEES WHERE BIRTH_DATE LIKE ('195_______');


-- Wildcard characters - Exercise #1
-- Use wildcard characters to retrieve a list of all records from the employees table for employees whose first name starts with 'SANI'.
SELECT * FROM EMPLOYEES WHERE FIRST_NAME like ('SANI%');

-- Wildcard characters - Exercise #2
-- Use wildcard characters to retrieve a list of all records from the employees table for employees whose first name does not start with 'SANI'.
SELECT * FROM EMPLOYEES WHERE FIRST_NAME NOT LIKE ('SANI%');

-- SELECT - BETWEEN - AND - Exercise #1
-- Use the BETWEEN ... AND ... operator to retrieve all records of salary contracts of value between 71,000 and 79,000 inclusive.
SELECT * FROM SALARIES WHERE SALARY BETWEEN 71000 AND 79000;

-- SELECT - BETWEEN - AND - Exercise #2
-- Use the NOT BETWEEN ... AND ... operator to retrieve all records of employees from the employees 
-- table whose employee number is either less than or equal to 10002 or greater than or equal to 10009.
SELECT * FROM EMPLOYEES WHERE EMP_NO NOT BETWEEN 10003 AND 10008;

-- SELECT - BETWEEN - AND - Exercise #3
-- Use the BETWEEN ... AND ... operator to retrieve the names of all departments from the departments 
-- table whose department numbers are between 'd002' and 'd005' inclusive.
SELECT DEPT_NAME FROM DEPARTMENTS WHERE DEPT_NO BETWEEN 'd002' AND 'd005';

-- SELECT - IS NOT NULL - IS NULL - Exercise #1
-- Retrieve the employee numbers (emp_no) and first names (first_name) of all individuals from the employees 
-- table whose first names are listed in that table.
SELECT emp_no,first_name FROM employees WHERE first_name IS NOT NULL;

-- SELECT - Other comparison operators - Exercise #1
-- Use a comparison operator to retrieve all records from the employees table for female employees hired after 1985.
SELECT * FROM EMPLOYEES WHERE GENDER='F' AND HIRE_DATE > '1986-01-01';

-- SELECT - Other comparison operators - Exercise #2
-- Use a comparison operator to retrieve all records from the salaries table for salary contracts with a value higher than $90,392.
SELECT * FROM SALARIES WHERE SALARY >90392;

-- SELECT DISTINCT - Exercise #1
-- Retrieve all unique to_date values recorded in the titles table.
SELECT DISTINCT TO_DATE FROM TITLES;

-- Introduction to aggregate functions - Exercise #1
-- How many salary contracts with a value of $75,405 or higher are recorded in the salaries table?
select count(*) from salaries where salary>=75405;

-- Introduction to aggregate functions - Exercise #2
-- How many departments are currently represented in the departments table?
-- Please note that, by design, the dept_no column in the departments table is a primary key.
-- Also, to obtain the desired number, please avoid using wildcard characters in your code.
select count(dept_no) from departments;

-- SELECT - ORDER BY - Exercise #1
-- Retrieve all data from the employees table, sorted so that the data about 
-- the youngest individual is at the top of the list and the data about the eldest is at the bottom.
SELECT * FROM EMPLOYEES order by birth_date desc;

-- SELECT - Using Aliases (AS) - Exercise #1
-- Retrieve the job title and the number of employees having it, as recorded in the titles table. 
-- Name the second column emps_with_same_job_title.
-- Apply the query only to individuals with open-ended contracts, which are recorded in the titles table with to_date of the January 1, 9999.
SELECT TITLE ,count(*) as emps_with_same_job_title FROM TITLES WHERE to_date = '9999-01-01' group by TITLE;

-- SELECT - HAVING - Exercise #1
-- Retrieve the average contract salary for each employee whose average salary is higher than $70,000. 
-- Sort the output by employee number in ascending order.
select emp_no,avg(salary) from salaries group by emp_no having avg(salary)>70000 order by emp_no;

-- SELECT - WHERE vs HAVING - Exercise #1
-- Select the employee numbers of all individuals who have signed more than one contract after the 1st of January 1990. 
-- Sort the output by employee number in ascending order.
SELECT emp_no from dept_emp where from_date>'1990-01-01' group by emp_no having count(from_date)>1 order by emp_no;

-- SELECT - LIMIT - Exercise #1
-- Ordered by employee number (emp_no) in descending order, retrieve the first five rows 
-- of output from the department-employees table (dept_emp).
select * from dept_emp order by emp_no desc limit 5;

