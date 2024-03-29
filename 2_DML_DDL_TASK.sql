1. How to insert multiple records in a table in sql ?
use saidata;
INSERT INTO xx_customer (CustomerID, Cust_name, Cust_address, City, State, Email_ID, Date, In_time, Out_time, Device, Channel) VALUES
(5, 'Michael Brown', '222 Maple St', 'Houston', 'TX', 'michaelbrown@example.com', '2023-01-05', STR_TO_DATE('09:00:00', '%H:%i:%s'), STR_TO_DATE('10:00:00', '%H:%i:%s'), 'mobile', 'Facebook'),
(1, 'John Doe', '123 Main St', 'New York', 'NY', 'johndoe@example.com', '2023-01-01', STR_TO_DATE('10:10:00', '%H:%i:%s'), STR_TO_DATE('11:20:00', '%H:%i:%s'), 'tablet', 'Facebook'),
(3, 'Mark Johnson', '789 Oak St', 'Chicago', 'IL', 'markjohnson@example.com', '2023-01-03', STR_TO_DATE('09:00:00', '%H:%i:%s'), STR_TO_DATE('10:00:00', '%H:%i:%s'), 'mobile', 'Facebook'),
(7, 'Christopher Wilson', '444 Cedar St', 'Seattle', 'WA', 'christopherwilson@example.com', '2023-01-07', STR_TO_DATE('09:00:00', '%H:%i:%s'), STR_TO_DATE('10:00:00', '%H:%i:%s'), 'tablet', 'Facebook'),
(9, 'David Anderson', '666 Pine St', 'Dallas', 'TX', 'davidanderson@example.com', '2023-01-09', STR_TO_DATE('09:00:00', '%H:%i:%s'), STR_TO_DATE('10:00:00', '%H:%i:%s'), 'desktop', 'Facebook'),
(10, 'Michael Johnson', '777 Elm St', 'Chicago', 'IL', 'michaeljohnson@example.com', '2023-01-10', STR_TO_DATE('09:00:00', '%H:%i:%s'), STR_TO_DATE('10:00:00', '%H:%i:%s'),'desktop' ,'Facebook'),
(8, 'Jessica Martinez', '555 Oak St', 'Boston', 'MA', 'jessicamartinez@example.com', '2023-04-22', STR_TO_DATE('10:30:00', '%H:%i:%s'), STR_TO_DATE('11:30:00', '%H:%i:%s'),'desktop', 'Twitter'),

==============================================================================================================================================================================================================

2. How to add additional column in a table?		
show tables;
select * from  xx_customer
Alter table <tablename> add column <columnname> <datatype>
Alter table xx_customer add column Device char(100)
INSERT INTO xx_customer (CustomerID, Cust_name, Cust_address, City, State, Email_ID, Date, In_time, Out_time, Device, Channel) VALUES
(5, 'Michael Brown', '222 Maple St', 'Houston', 'TX', 'michaelbrown@example.com', '2023-01-05', STR_TO_DATE('09:00:00', '%H:%i:%s'), STR_TO_DATE('10:00:00', '%H:%i:%s'), 'mobile', 'Facebook'),
=======================================================================================================================================================================================================

3. how to change the constraint in a table?		
drop table if exists xx_customer
CREATE TABLE xx_customer
(
  CustomerID INT ,
  Cust_name VARCHAR(100),
  Cust_address varchar(100),
  City CHAR(50),
  State CHAR(50), 
  Email_ID VARCHAR(100),
  Date date,
  In_time TIMESTAMP,
  Out_time TIMESTAMP,
  Device char(100),
  Channel VARCHAR(50),
  constraint  check_date_quarter CHECK (Date >= '2023-01-01' AND Date <= '2023-06-30'),
  constraint check_time_variation CHECK (TIMESTAMPDIFF(HOUR, In_time, Out_time) BETWEEN 1 AND 2)
);
INSERT INTO xx_customer (CustomerID, Cust_name, Cust_address, City, State, Email_ID, Date, In_time, Out_time, Device, Channel) VALUES
(5, 'Michael Brown', '222 Maple St', 'Houston', 'TX', 'michaelbrown@example.com', '2023-01-05', STR_TO_DATE('09:00:00', '%H:%i:%s'), STR_TO_DATE('10:00:00', '%H:%i:%s'), 'mobile', 'Facebook'),
(1, 'John Doe', '123 Main St', 'New York', 'NY', 'johndoe@example.com', '2023-01-01', STR_TO_DATE('10:10:00', '%H:%i:%s'), STR_TO_DATE('11:20:00', '%H:%i:%s'), 'tablet', 'Facebook'),
(3, 'Mark Johnson', '789 Oak St', 'Chicago', 'IL', 'markjohnson@example.com', '2023-01-03', STR_TO_DATE('09:00:00', '%H:%i:%s'), STR_TO_DATE('10:00:00', '%H:%i:%s'), 'mobile', 'Facebook'),
(7, 'Christopher Wilson', '444 Cedar St', 'Seattle', 'WA', 'christopherwilson@example.com', '2023-01-07', STR_TO_DATE('09:00:00', '%H:%i:%s'), STR_TO_DATE('10:00:00', '%H:%i:%s'), 'tablet', 'Facebook'),
(8, 'Jessica Martinez', '555 Oak St', 'Boston', 'MA', 'jessicamartinez@example.com', '2023-02-12', STR_TO_DATE('09:30:00', '%H:%i:%s'), STR_TO_DATE('11:00:00', '%H:%i:%s'), 'laptop', 'Instagram'),
  
  ---To change the constraint
  a)--to drop
  Alter table xx_customer
  drop constraint  check_date_quarter CHECK (Date >= '2023-01-01' AND Date <= '2023-06-30'),
  b) --add new constarint
  Alter table xx_customer
   add constraint check_time_variation CHECK (TIMESTAMPDIFF(HOUR, In_time, Out_time) BETWEEN 1 AND 2)
 c) --checking for the new values
  INSERT INTO xx_customer (CustomerID, Cust_name, Cust_address, City, State, Email_ID, Date, In_time, Out_time, Device, Channel) VALUES
  (11, 'vikram', '234 new colony St', 'texas', 'TM', 'vikram@example.com', '2023-03-12', STR_TO_DATE('09:30:00', '%H:%i:%s'), STR_TO_DATE('11:00:00', '%H:%i:%s'), 'laptop', 'Instagram'),
  select * from xx_customer
 ===================================================================================================================================================================================================================
  
  4. How to alter the column name in a table?		
 Alter table xx_customer rename column CustomerID to Client_id
 select * from xx_customer
 
 ===================================================================================================================================================================================
 5. How to change the table name in sql?
Alter table xx_customer rename to customer_table
============================================================================================================================================================
 6. How to change a particular value inside a table		
  select * from xx_order
--DML
update xx_order  set RECIEVER_LOCATION  = 'chennai' where ORDER_ID = 8
=============================================================================================================================================================================

