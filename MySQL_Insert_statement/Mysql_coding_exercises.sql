-- The INSERT statement - exercise 1
-- Select ten records from the “titles” table to get a better idea about its content.

-- Then, in the same table, insert information about employee number 999903. State that he/she is a “Senior Engineer”, who has started working in this position on October 1st, 1997.

-- At the end, sort the records from the “titles” table in descending order to check if you have successfully inserted the new record.

-- Hint: To solve this exercise, you’ll need to insert data in only 3 columns!

-- Don’t forget, we assume that, apart from the code related to the exercises, you always execute all code provided in the lectures. This is particularly important for this exercise. If you have not run the code from the previous lecture, called ‘The INSERT Statement – Part II’, where you have to insert information about employee 999903, you might have trouble solving this exercise!

-- Code:
-- INSERT INTO employees
-- VALUES
-- (
--     999903,
--     '1977-09-14',
--     'Johnathan',
--     'Creek',
--     'M',
--     '1999-01-01'
-- );

-- The INSERT statement - solution 1
SELECT 
    *
FROM
    titles
LIMIT 10;

insert into titles(emp_no,title,from_date) values (999903,'Senior Engineer','1997-10-01');

SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC;



-- The INSERT statement - exercise 2
-- Insert information about the individual with employee number 999903 into the “dept_emp” table. He/She is working for department number 5, and has started work on  October 1st, 1997; her/his contract is for an indefinite period of time.

-- Hint: Use the date ‘9999-01-01’ to designate the contract is for an indefinite period.

-- The INSERT statement - solution 2
SELECT 
    *
FROM
    dept_emp
ORDER BY emp_no DESC
LIMIT 10;
insert into dept_emp(emp_no,dept_no,from_date,to_date) values (999903,'d005','1997-10-01','9999-01-01');


-- Inserting Data INTO a New Table - exercise
-- Create a new department called “Business Analysis”. Register it under number ‘d010’.

-- Hint: To solve this exercise, use the “departments” table.

-- Inserting Data INTO a New Table - solution
INSERT INTO departments VALUES ('d010', 'Business Analysis');


