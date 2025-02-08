-- INNER JOIN - Exercise #1
-- Retrieve all employee numbers (emp_no) and contract start dates (from_date) from the department employees table (dept_emp). 
-- Add a third column, displaying the name of the department they have signed for (dept_name from the departments table).
SELECT 
    de.emp_no, de.from_date, d.dept_name
FROM
    dept_emp de
        JOIN
    departments d ON de.dept_no = d.dept_no;

-- LEFT JOIN - Exercise #1
-- Use a LEFT JOIN to retrieve the employee number (emp_no), first name (first_name), and last names (last_name) of 
-- all individuals whose last name is 'Bamford'. 
-- Join the data from the employees table with the data from dept_manager to add two more columns: 
-- the number of the department these people are working in (dept_no) and the start date of their contracts (from_date). 
-- Sort your output by department number in descending order.
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    dm.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.last_name = 'Bamford'
ORDER BY dept_no DESC , e.emp_no;

-- RIGHT JOIN - Exercise #1
-- Use a RIGHT JOIN to retrieve the employee number (emp_no), first name (first_name), and last names (last_name) of all 
-- individuals whose last name is 'Bamford'. 
-- Join the data from the employees table with the data from dept_manager to add two more columns: 
-- the number of the department these people are working in (dept_no) and the start date of their contracts (from_date). 
-- Sort your ouptut by department number in descending order.

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    dm.from_date
FROM
    dept_manager dm
        RIGHT JOIN
    employees e ON dm.emp_no = e.emp_no
WHERE
    e.last_name = 'Bamford'
ORDER BY dept_no DESC , e.emp_no;

-- The new and the old join syntax - Exercise #1
-- Retrieve a table containing three columns:

-- 1. The employee number (emp_no) as recorded in the departments manager table (dept_manager).

-- 2. Their contract salary value (salary), obtained from the salaries table.
-- 3. The start date of their contracts (from_date).

-- Aim to write your query using the old join syntax.

SELECT 
    dm.emp_no, s.salary, s.from_date
FROM
    dept_manager dm,
    salaries s
WHERE
    dm.emp_no = s.emp_no;
-- JOIN and WHERE Used Together - Exercise #1
-- Retrieve the employee number (emp_no), first name (first_name), last name (last_name), 
-- and hire date (hire_date) of all employees whose last name is 'Bamford'. 
-- Add a fifth column displaying their job title (title), as recorded in the titles table. 
-- Sort your output by employee number in ascending order.
SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    last_name = 'Bamford'
ORDER BY e.emp_no;

-- CROSS JOIN - Exercise #1
-- Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager 
-- table and department number 6 (dept_no) from the departments table.
select dm.*,d.* from departments d cross join dept_manager dm where d.dept_no='d006';


-- CROSS JOIN - Exercise #2
-- Return a list with the first two employees (i.e. employees 10001 and 10002) with all the departments they can be assigned to. To obtain the desired output, refer to all column from the departments and department employees tables (departments, dept_emp). Order your output by employee number (emp_no) and department name (dept_name).

-- Note: In the employees_10 database, employee numbers are stored as integers, not strings.

-- Hint: Don't use LIMIT; use a WHERE clause.

SELECT 
    de.emp_no, d.dept_no, de.from_date, de.to_date, d.dept_name
FROM
    departments d
        CROSS JOIN
    dept_emp de
WHERE
    de.emp_no IN (10001 , 10002)
ORDER BY de.emp_no , d.dept_name;

-- JOIN More than Two Tables in SQL - Exercise #1
-- Retrieve all Senior Engineers' first and last name (first_name, last_name), hire dates (hire_date), job titles (title), start dates (from_date), and names of the departments they are working in (dept_name).

-- To obtain the desired result, you should refer to data from the following tables:

-- employees, titles, departments, dept_emp.
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    de.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
        JOIN
    dept_emp de ON de.emp_no = e.emp_no
        JOIN
    departments d ON de.dept_no = d.dept_no
WHERE
    t.title = 'Senior Engineer'
ORDER BY e.emp_no;

-- Tips and tricks for joins - Exercise #1
-- Calculate the average salary (salary), as recorded in the salaries table, 
-- for each job title (title) as listed in the titles table, considering all contracts ever signed. 
-- Name the second column avg_salary and make sure to round the average salary to the nearest cent. 
SELECT 
    t.title, ROUND(AVG(s.salary), 2) AS avg_salary
FROM
    titles t
        JOIN
    salaries s ON t.emp_no = s.emp_no
GROUP BY t.title
HAVING avg_salary < 75000
ORDER BY avg_salary DESC;

-- UNION vs UNION ALL - Exercise #1
-- Use UNION to combine data from two subsets in the employees_10 database. 
-- The first subset should contain the employee number (emp_no), first name (first_name), 
-- and last name (last_name) of all employees whose family name is 'Bamford'. 
-- The second subset should contain the department number (dept_no) 
-- and start date (from_date) of all managers, as recorded in the departments manager table (dept_manager). 
-- Ensure to provide null values in all empty columns for each subset.
SELECT 
    emp_no,
    first_name,
    last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees
WHERE
    last_name = 'Bamford' 
UNION SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    dept_no,
    from_date
FROM
    dept_manager;
    

