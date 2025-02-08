-- Intro to JOINs - exercise 1
-- If you currently have the ‘departments_dup’ table set up, use DROP COLUMN to remove the ‘dept_manager’ column from the ‘departments_dup’ table.
-- Then, use CHANGE COLUMN to change the ‘dept_no’ and ‘dept_name’ columns to NULL.
-- (If you don’t currently have the ‘departments_dup’ table set up, create it. 
-- Let it contain two columns: dept_no and dept_name. Let the data type of dept_no be CHAR of 4, 
-- and the data type of dept_name be VARCHAR of 40. Both columns are allowed to have null values. 
-- Finally, insert the information contained in ‘departments’ into ‘departments_dup’.)

-- Then, insert a record whose department name is “Public Relations”.
-- Delete the record(s) related to department number two.
-- Insert two new records in the “departments_dup” table. Let their values in the “dept_no” column be “d010” and “d011”.

-- Intro to JOINs - solution 1
# if you currently have ‘departments_dup’ set up:

ALTER TABLE departments_dup DROP COLUMN dept_manager;
ALTER TABLE departments_dup CHANGE COLUMN dept_no dept_no CHAR(4) NULL;

ALTER TABLE departments_dup CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

 

# if you don’t currently have ‘departments_dup’ set up

DROP TABLE IF EXISTS departments_dup;

CREATE TABLE departments_dup (dept_no CHAR(4) NULL,dept_name VARCHAR(40) NULL);
INSERT INTO departments_dup (dept_no,dept_name) SELECT * FROM departments;
INSERT INTO departments_dup (dept_name) VALUES ('Public Relations');

DELETE FROM departments_dup WHERE dept_no = 'd002';   
 
INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');

-- Intro to JOINs - exercise 2
-- Create and fill in the ‘dept_manager_dup’ table, using the following code:



DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (emp_no int(11) NOT NULL,dept_no char(4) NULL,from_date date NOT NULL,to_date date NULL);

 

INSERT INTO dept_manager_dup select * from dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES (999904, '2017-01-01'),(999905, '2017-01-01'),(999906, '2017-01-01'),(999907, '2017-01-01'); 

DELETE FROM dept_manager_dup 
WHERE
    dept_no = 'd001';
    
-- INNER JOIN - Part II - exercise
-- Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 
SELECT 
    e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no;

-- Duplicating the records  exercise:
select * from dept_manager_dup order by dept_no ASC; 
select * from departments_dup order by dept_no ASC; 
-- adding duplicate values
insert into departments_dup  values ('d009','Customer Service') ;
insert into dept_manager_dup values ('110228','d003','1992-03-21','9999-01-01');
-- deleting the duplicate values and inserting the record
delete from departments_dup where dept_no='d009';
insert into departments_dup  values ('d009','Customer Service') ;
-- deleting the duplicate values and inserting the record
delete from dept_manager_dup where emp_no='110228';
insert into dept_manager_dup values ('110228','d003','1992-03-21','9999-01-01');
-- Checking the data
select * from dept_manager_dup order by dept_no ASC; 
select * from departments_dup order by dept_no ASC;   

-- LEFT JOIN - Part II - exercise
-- Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. 
-- See if the output contains a manager with that name.  

-- Hint: Create an output containing information corresponding to the following fields: 
-- ‘emp_no’, ‘first_name’, ‘last_name’, ‘dept_no’, ‘from_date’. Order by 'dept_no' descending, and then by 'emp_no'.

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
    e.last_name = 'Markovitch'
ORDER BY dm.dept_no DESC , e.emp_no;

-- The new and the old join syntax - exercise
-- Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 
-- Use the old type of join syntax to obtain the result.
SELECT 
    e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM
    employees e,
    dept_manager dm
WHERE
    e.emp_no = dm.emp_no;

-- New Join Syntax:
SELECT 
    e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no; 


-- JOIN and WHERE Used Together - exercise
-- Select the first and last name, the hire date, and the job title of all employees whose 
-- first name is “Margareta” and have the last name “Markovitch”.
SELECT 
    e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    first_name = 'Margareta'
        AND last_name = 'Markovitch'
ORDER BY e.emp_no;   


-- CROSS JOIN - exercise 1
-- Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9.
-- CROSS JOIN - solution 1
SELECT 
    dm.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE
    d.dept_no = 'd009'
ORDER BY d.dept_no;

-- CROSS JOIN - exercise 2
-- Return a list with the first 10 employees with all the departments they can be assigned to.

-- Hint: Don’t use LIMIT; use a WHERE clause.
-- CROSS JOIN - solution 2
SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no < 10011
ORDER BY e.emp_no , d.dept_name;

-- Join more than two tables in SQL - exercise
-- Select all managers’ first and last name, hire date, job title, start date, and department name.
-- Join more than two tables in SQL - solution
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
ORDER BY e.emp_no;

-- 2nd Solution:
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
        AND m.from_date = t.from_date
ORDER BY e.emp_no;

-- Tips and tricks for joins - exercise
-- How many male and how many female managers do we have in the ‘employees’ database?
-- Tips and tricks for joins - solution
SELECT 
    e.gender, COUNT(dm.emp_no)
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;

-- UNION vs UNION ALL - exercise
-- Go forward to the solution and execute the query. 
-- What do you think is the meaning of the minus sign before subset A in the last row (ORDER BY -a.emp_no DESC)? 
-- UNION vs UNION ALL - solution
SELECT 
    *
FROM
    (SELECT 
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT 
        NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM
        dept_manager dm) AS a
ORDER BY - a.emp_no DESC;








    






