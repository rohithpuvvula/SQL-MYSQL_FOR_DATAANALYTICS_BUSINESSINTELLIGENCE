-- Creating a Database – exercise 1
/*Create the “Sales” database. To do this, you’ll have to use one of the two possibilities shown in the lecture, and then execute the code!
*/
CREATE DATABASE IF NOT EXISTS Sales;
CREATE SCHEMA IF NOT EXISTS Sales;

-- exercise 2
-- How to use the select database?
USE Sales;

-- Creating a table – exercise 3
/*Create the “customers” table in the “sales” database. Let it contain the following 5 columns: 
customer_id, first_name, last_name, email_address, and number_of_complaints. Let the data types of customer_id and
 number_of_complaints be integer, while the data types of all other columns be VARCHAR of 255.*/
 CREATE TABLE customers                                                 
(
    customer_id INT,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int
);

-- Additional notes on using tables - exercise
-- In SQL, dropping a table is like dropping a database. If you have not removed the ‘sales’ table during the last lecture,
--  please use the following code to drop the ‘sales’ table from the ‘sales’ database:

DROP TABLE sales;


