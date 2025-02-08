-- The INSERT statement - Exercise #1
-- Insert the float value 10.5 into the given table named test.
-- Assume the following query has already been executed in the database:
-- CREATE TABLE test (test DECIMAL(5, 3));
INSERT test VALUES (10.5);

-- The INSERT statement - Exercise #2
-- Select all data from the test table.

-- Assume the following query has already been executed in the database:
-- CREATE TABLE test (test DECIMAL(5, 3));
-- INSERT test VALUES (10.5);
select * from test;

-- The INSERT statement - Exercise #3
-- Insert the float value 12.55555 into the table named test using an INSERT INTO statement. Then, display all records currently stored in the test table.

-- Assume the following queries has already been executed in the database:

-- CREATE TABLE test (test DECIMAL(5, 3));
-- INSERT test VALUES (10.5);
-- SELECT * FROM test;
insert into test values (12.55555);
select * from test;


-- The INSERT statement - Exercise #4
-- Consider that the following query has been used to set up the employees table in the employees_10 database:

-- CREATE TABLE employees (
--     emp_no      INT             NOT NULL,
--     birth_date  DATE            NOT NULL,
--     first_name  VARCHAR(14)      NULL,
--     last_name   VARCHAR(16)     NOT NULL,
--     gender      ENUM ('M','F')  NOT NULL, 
--     hire_date   DATE            NOT NULL,
--     PRIMARY KEY (emp_no)
-- );
-- -- Write a new query to insert the following data about a new entry in the employees table:
-- -- Employee named Patrick Huston, male, employee number 999905, born on the 12th of March 1965, hired on the 1st of January 2000.
-- -- Provide the new values after naming all columns.
-- -- Finally, select all data from the employees table to verify that the new entry has been added. 
-- -- Retrieve this data sorted in descending order according to the values in the emp_no column.
insert into employees(emp_no,birth_date,first_name,last_name,gender,hire_date) values (999905,'1965-03-12','Patrick','Huston','M','2000-01-01');


-- The INSERT statement - Exercise #5
-- Consider that the following query has been used to set up the employees table in the employees_10 database:

-- CREATE TABLE employees (
--     emp_no      INT             NOT NULL,
--     birth_date  DATE            NOT NULL,
--     first_name  VARCHAR(14)      NULL,
--     last_name   VARCHAR(16)     NOT NULL,
--     gender      ENUM ('M','F')  NOT NULL, 
--     hire_date   DATE            NOT NULL,
--     PRIMARY KEY (emp_no)
-- );
-- Write a new query to insert the following data about a new entry in the employees table:

-- Employee named John Miller, male, employee number 999906, born on the 14th of February 1967, hired on the 1st of June 1997.

-- Provide the new values without naming all columns.

-- Finally, select all data from the employees table to verify that the new entry has been added. 
-- Retrieve this data sorted in descending order according to the values in the emp_no column.

insert into employees values (999906,'1967-02-14','John','Miller','M','1997-06-01');
select * from employees order by emp_no desc;

-- The INSERT statement - Exercise #6
-- Consider that the following query has been used to set up the titles table in the employees_10 database:

-- CREATE TABLE titles (
--     emp_no      INT             NOT NULL,
--     title       VARCHAR(50)     NOT NULL,
--     from_date   DATE            NOT NULL,
--     to_date     DATE,
--     PRIMARY KEY (emp_no,title, from_date)
-- ); 
-- Write a new query to insert the following data about a new entry in the titles table:

-- Employee number 999907, who has held the position of assistant engineer according to a contract signed on the November 15, 1998.

-- To verify the insertion has been successful, retrieve the entire data from the titles table, sorted in descending order according to the data in the emp_no field.

insert into titles (emp_no,title,from_date,to_date) values (999907,'Assistant Engineer','1998-11-15',null);

select * from titles order by emp_no desc;

-- The INSERT statement - Exercise #7
-- Consider that the following query has been used to set up the departments table in the employees_10 database:

-- CREATE TABLE departments (
--     dept_no     CHAR(4)         NOT NULL,
--     dept_name   VARCHAR(40)     NOT NULL,
--     PRIMARY KEY (dept_no),
--     UNIQUE  KEY (dept_name)
-- );
-- Here's an excerpt of the current state of the table:


-- Write a new query to insert the following entry into the departments table:

-- Department number 10, named 'Business Analysis'.

-- To verify the insertion has been successful, retrieve the entire data from the departments table.

insert into departments values ('d010','Business Analysis');
select * from departments ;

-- The INSERT statement - Exercise #8
-- Consider that the following query has been used to set up the dept_emp table, which stores data about departments and employees, 
-- in the employees_10 database:

-- CREATE TABLE dept_emp (
--     emp_no      INT             NOT NULL,
--     dept_no     CHAR(4)         NOT NULL,
--     from_date   DATE            NOT NULL,
--     to_date     DATE            NOT NULL,
--     PRIMARY KEY (emp_no,dept_no)
-- );
-- The same table structure has been used to create a duplicate table named dept_emp_dup. 
-- Your task is to fill it with the exact same data currently stored in the dept_emp table. 
-- To achieve and verify the successful execution of the task, you need to run three additional queries.

-- With the first query, insert the entire data from dept_emp into dept_emp_dup. 
-- With the second and third queries, select the entire data from dept_emp and dept_emp_dup, respectively, 
-- and observe that the data stored in the two tables is identical.
CREATE TABLE dept_emp_dup (
    emp_no      INT             NOT NULL,
    dept_no     CHAR(4)         NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    PRIMARY KEY (emp_no,dept_no)
);

insert into dept_emp_dup select * from dept_emp;

select * from dept_emp;
select * from dept_emp_dup;

