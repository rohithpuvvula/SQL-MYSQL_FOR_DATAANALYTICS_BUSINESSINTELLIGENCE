-- The DELETE statement - Exercise #1
-- Retrieve all records from the department-and-employees table twice. In between the two executions, remove all the data from that table. 
-- If you've worked correctly, you'll obtain:

-- - an output containing the entire data currently stored in that table
-- - a message stating the number of rows you've removed with the execution of the second query
-- - an empty result set, indicating that after the execution of the second query, the relevant table is empty.
SELECT * FROM dept_emp;
DELETE FROM dept_emp;
SELECT * FROM dept_emp;

-- The DELETE statement - Exercise #2
-- Retrieve all records from the department-and-employees table, dept_emp, sorted by the department number (dept_no) in ascending order. 
-- Then, remove all records of employees who are working in the fifth department precisely. 
-- To finish off, using the same query you used at the beginning, obtain all records from the same table to verify that no records 
-- regarding the fifth department exist anymore.
select * from dept_emp order by dept_no;
delete from dept_emp where dept_no='d005';
select * from dept_emp order by dept_no;

