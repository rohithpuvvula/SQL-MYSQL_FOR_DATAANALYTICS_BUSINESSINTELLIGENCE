-- PRIMARY KEY constraint - exercise
-- Drop the “customers” table and re-create it using the following code:
CREATE TABLE customers                                                              
(  
    customer_id INT,  
    first_name varchar(255),  
    last_name varchar(255),  
    email_address varchar(255),  
    number_of_complaints int,  
primary key (customer_id)  

);  

-- Then, create the “items” table  
-- (columns - data types:  
-- item_code – VARCHAR of 255,  
-- item – VARCHAR of 255,  
-- unit_price – NUMERIC of 10 and 2,  
-- company­_id – VARCHAR of 255),  
-- and the “companies” table  
-- (company_id – VARCHAR of 255,  
-- company_name – VARCHAR of 255,  
-- headquarters_phone_number – integer of 12). 

-- PRIMARY KEY constraint - solution
DROP TABLE customers;

CREATE TABLE customers                                                    
(  
    customer_id INT,  
    first_name varchar(255),  
    last_name varchar(255),  
    email_address varchar(255),   
    number_of_complaints int,   
primary key (customer_id)   
);  

   

CREATE TABLE items                                                                                                                              

(  
    item_code varchar(255),   
    item varchar(255),   
    unit_price numeric(10,2),   
    company_id varchar(255),
primary key (item_code)   
);  
    CREATE TABLE companies   
(
    company_id varchar(255),   
    company_name varchar(255),  
    headquarters_phone_number int(12),   
primary key (company_id)   

);


-- FOREIGN KEY constraint - Part II - exercise
-- Looking to the next few lectures of the course, drop all tables from the “Sales” database in the following order:
--  first drop “sales”, then “customers”, “items”, and finally “companies”.

-- FOREIGN KEY constraint - Part II - solution
DROP TABLE sales;
DROP TABLE customers;
DROP TABLE items;
DROP TABLE companies;

-- UNIQUE Constraint - exercise
-- Drop the “customers” table, and then recreate it using the following code.
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id)
);

-- Then run the following code that will add a “gender” column in the “customers” table, and will then insert a new record in it. 
-- Don’t worry if you don’t understand the meaning of the code perfectly – we will discuss these structures later 
-- on in the course in more detail. We will just use them now to insert a row in our “customers” table.
 ALTER TABLE customers
ADD COLUMN gender ENUM('M', 'F') AFTER last_name;
INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0);

-- DEFAULT Constraint - exercise
-- Recreate the “companies” table

-- (company_id – VARCHAR of 255,  
-- company_name – VARCHAR of 255,  
-- headquarters_phone_number – VARCHAR of 255),    
-- This time setting the “headquarters phone number” to be the unique key, and default value of the company's name to be “X”.   
-- After you execute the code properly, drop the “companies” table.

-- DEFAULT Constraint - solution
CREATE TABLE companies
(
    company_id VARCHAR(255),
    company_name VARCHAR(255) DEFAULT 'X',
    headquarters_phone_number VARCHAR(255),
PRIMARY KEY (company_id),
UNIQUE KEY (headquarters_phone_number)
);
DROP TABLE companies;

-- NOT NULL Constraint - Part I - exercise
-- Using ALTER TABLE, first add the NULL constraint to the headquarters_phone_number field 
-- in the “companies” table, and then drop that same constraint.

-- NOT NULL Constraint - Part I - solution
ALTER TABLE companies
MODIFY headquarters_phone_number VARCHAR(255) NULL;
ALTER TABLE companies
CHANGE COLUMN headquarters_phone_number headquarters_phone_number VARCHAR(255) NOT NULL;


