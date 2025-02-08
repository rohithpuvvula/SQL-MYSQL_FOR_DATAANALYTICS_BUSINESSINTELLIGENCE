-- The UPDATE statement - Exercise #1
-- Update the record of employee number 10003 from the employees table. 
-- To do this, first retrieve all rows from this table to explore its current data. 
-- Then, update the record with the following information for the new individual: 

-- Juan Speed, male, born on the 5th of June, 1979.

-- To conclude, retrieve the information currently stored for employee 10003. 
select * from employees;


update employees set first_name='Juan',last_name='Speed',gender='M',birth_date='1979-06-05' where emp_no=10003;

select * from employees where emp_no=10003;

-- The UPDATE statement - Exercise #2
-- Update the name of the fourth department In the departments table to 'Data Analysis'.

-- To do this, execute three queries. First retrieve the information about this row from the departments table to see its current name. 
-- Then, update the given department's name to 'Data Analysis'.
--  Finally, retrieve the information about the fourth department once again 
--  (by using the query you already used at the beginning of the exercise).
select * from departments where dept_no='d004';

update departments set dept_name='Data Analysis' where dept_no='d004';
