-- PRIMARY KEY constraint - Exercise #1
-- Create a table named order_info with the following four columns and their corresponding data types:

-- - order_info_id - integer
-- - order_id - integer
-- - product_id - integer
-- - product_quantity - integer

-- Write the relevant code on the same line as the column name to indicate order_info_id is an auto-incremented primary key. 

CREATE TABLE order_info
(
	order_info_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,     
    product_id INT,
    product_quantity INT
);

-- OR
create table order_info (
order_info_id int auto_increment,
order_id int,
product_id int,
product_quantity int,
primary key (order_info_id));


-- PRIMARY KEY constraint - Exercise #2
-- Create a table named order_info with the following four columns and their corresponding data types:

-- - order_info_id - integer
-- - order_id - integer
-- - product_id - integer
-- - product_quantity - integer

-- Indicate that order_info_id is an auto-incremented primary key after specifying the four table fields.

CREATE TABLE order_info
(
	order_info_id INT AUTO_INCREMENT,
    order_id INT,     
    product_id INT,
    product_quantity INT,
PRIMARY KEY (order_info_id) 
);

-- FOREIGN KEY constraint - Exercise #1
-- Assume a table products, containing the fields product_id, product_name, product_price , and warehouse_id, has already been created.

-- Now, create a table named order_info with the following four columns and their corresponding data types:

-- - order_info_id - integer
-- - order_id - integer
-- - product_id - integer
-- - product_quantity - integer

-- Indicate that order_info_id is an auto-incremented primary key. 
-- Also, set a FOREIGN KEY constraint referencing the product_id column from the products table.

create table order_info(
order_info_id int auto_increment,
order_id int,
product_id int,
product_quantity int,
primary key (order_info_id) , 
foreign key (product_id) references products(product_id));
-- OR
CREATE TABLE order_info (
	order_info_id INT AUTO_INCREMENT PRIMARY KEY,
	order_id INT,
	product_id INT,
	product_quantity INT,
	FOREIGN KEY (product_id) REFERENCES products (product_id)
);

-- FOREIGN KEY constraint - Exercise #2
-- Assume the tables products, containing the fields product_id, product_name, product_price , and warehouse_id, and order_info, containing the fields order_info_id, order_id, product_id, and product_quantity, have already been created.

-- Now, create a table named orders with the following four columns and their corresponding data types:

-- - order_id - integer
-- - order_date - date
-- - order_info_id - integer
-- - order_value - integer
-- - order_currency - variable-length string with a maximum length of 10 characters

-- Indicate that order_id is an auto-incremented primary key. 
-- Also, set a FOREIGN KEY constraint referencing the order_info_id column from the order_info table.

create table orders(
order_id int auto_increment,
order_date date,
order_info_id int ,
order_value int,
order_currency varchar(10),
primary key (order_id) , 
foreign key (order_info_id) references orders_info(order_info_id));
-- OR
CREATE TABLE orders 
(
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,     
    order_info_id INT,
    order_value INT, 
    order_currency VARCHAR(10),
FOREIGN KEY (order_info_id) REFERENCES order_info (order_info_id)
);

-- FOREIGN KEY constraint - Exercise #3
-- Assume the following tables have already been created:

-- - products
-- - order_info
-- - orders

-- Drop the orders table.
DROP TABLE IF EXISTS orders;

-- UNIQUE constraint - Exercise #1
-- Assume a table warehouses, containing the fields warehouse_id and warehouse_name, has already been created. Now, create a table named products with the following four columns and their corresponding data types:

-- - product_id - integer
-- - product_name - variable-length string with a maximum length of 20 characters
-- - product_price - integer
-- - warehouse_id - integer

-- where product_id is an auto-incremented primary key. Then, set a FOREIGN KEY constraint referencing the warehouse_id 
-- column from the warehouses table. Finally, set a UNIQUE KEY constraint on the product_name field.
CREATE TABLE products
(
	product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(20),     
    product_price INT,
    warehouse_id INT,
FOREIGN KEY (warehouse_id) REFERENCES warehouses (warehouse_id),
UNIQUE KEY (product_name)
);
-- OR
CREATE TABLE products(
product_id int AUTO_INCREMENT PRIMARY KEY,
product_name varchar(20) UNIQUE ,
product_price int,
warehouse_id int,
foreign key(warehouse_id) references warehouses(warehouse_id)
);

-- DEFAULT constraint - Exercise #1
-- Assume a table warehouses, containing the fields warehouse_id and warehouse_name, has already been created. Now, create a table named products with the following four columns and their corresponding data types:

-- - product_id - integer
-- - product_name - variable-length string with a maximum length of 20 characters
-- - product_price - integer
-- - warehouse_id - integer

-- In addition, ensure the following four constraints are specified for the products table:

-- - product_id - an auto-incremented primary key
-- - a foreign key constraint referencing the warehouse_id column from the warehouses table
-- - a unique key constraint on the product name field
-- - a default clause on the product_name field to explicitly indicate 'no-name' as the default value for that column
CREATE TABLE products(
product_id int AUTO_INCREMENT PRIMARY KEY,
product_name varchar(20) UNIQUE DEFAULT 'no-name' ,
product_price int,
warehouse_id int,
foreign key(warehouse_id) references warehouses(warehouse_id)
);

-- NOT NULL constraint - Exercise #1
-- Create a table named products with the following four columns and their corresponding data types:

-- - product_id - integer
-- - product_name - variable-length string with a maximum length of 20 characters
-- - product_price - integer
-- - warehouse_id - integer

-- Let product_id be an auto-incremented primary key. Ensure no null values can be contained in any of the columns.

CREATE TABLE products(
product_id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
product_name varchar(20) NOT NULL ,
product_price int NOT NULL,
warehouse_id int NOT NULL
);

