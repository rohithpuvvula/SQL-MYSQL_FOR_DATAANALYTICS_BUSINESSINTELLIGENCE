-- Creating a Table - Exercise #1
/*Create a table called test. It should contain a single column named test of the DECIMAL type, with a precision of 5 and a scale of 3.
Solution:*/
create table if not exists test(
test decimal(5,3));

-- Creating a Table - Exercise #2
/*Create a table named warehouse with two columns: warehouse_id and warehouse_location. 
The first column should be of type integer, set to auto-increment, and designated as a primary key. 
The second column should be a variable-length string with a maximum length of 20 characters.*/
create table warehouse(
warehouse_id INT PRIMARY KEY AUTO_INCREMENT,
warehouse_location VARCHAR(20));

-- Creating a Table - Exercise #3
-- Create a table named orders with the following four columns and their corresponding data types:

-- - order_id - integer
-- - order_date - date
-- - order_info - integer
-- - order_value - integer
-- - order_currency - variable-length string with a maximum length of 10 characters.

-- Let order_id be an autoincremented primary key.
create table orders(
order_id int auto_increment,
order_date date,
order_info int,
order_value int,
order_currency varchar(10));

-- Creating a Table - Exercise #4
-- Create a table named products with the following four columns and their corresponding data types:

-- - product_id - integer
-- - product_name - variable-length string with a maximum length of 20 characters
-- - product_price - integer
-- - warehouse_id - integer.

-- Let product_id be an auto-incremented primary key.
create table if not exists products(
product_id int auto_increment,
product_name varchar(20),
product_price int,
warehouse_id int);

-- Using Databases and Tables - Exercise #1
-- Assume that a table called products has already been created. Use a SELECT statement to verify that it is currently empty.
SELECT * FROM products;


-- Additional Notes on Using Tables - Exercise #9
-- Assume that a table called orders has already been created. Use a DDL statement to drop it.
DROP TABLE IF EXISTS orders;
