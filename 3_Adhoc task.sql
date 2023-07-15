                                                                         Adhoc Task

Select the  
Row_id, Customer_Name, Order_id, Order_date, order_month, order_year, Country, State, City, Region, Ship_mode, location_info  from the  salesdata_updated table and they should follow the below rules

DROP TABLE IF EXISTS salesdata_updated;
CREATE TABLE salesdata_updated AS
SELECT
    Row_ID,
    Order_ID,
    STR_TO_DATE(Order_Date, '%d-%m-%Y') AS Order_Date,
    STR_TO_DATE(Ship_Date, '%d-%m-%Y') AS Ship_Date,
    Ship_Mode,
    Customer_ID,
    Customer_Name,
    Segment,
    Country,
    City,
    State,
    Region
FROM salesdata;


1. Get the order id alone from the order_Id column and name it as Order_id
ex: CA-2022-152156
o/p  2022-152156 (Expected format)

SELECT
    SUBSTRING(order_Id, 4) AS Order_id
    FROM salesdata;

2.  order_month,  should have month of the order date and year_month should have year of the month

select 
Order_Date,
month(Order_Date) as month_orderdate,
year(Order_Date) as year_orderdate
from salesdata_updated
limit 10

3. Customer id must be in the mentioned format
Ex: CG-12520 to 12520

SELECT
  SUBSTRING(Customer_id, 4) AS Customer_id
FROM
  salesdata_updated;


4. Concatenate Region,Country, city, state as location_info for each records
ex: South_United states_Los Anagels_Texas

  SELECT
  CONCAT(Region, '_', Country, '_', City, '_', State) AS location_info
FROM
  salesdata;

5. From the derived table salesdata_updated table create a new table called Sales_order_info it should  have
Product_ID	
,Category	
,Sub_Category	
,Product_Name	
,Sales	
,Quantity
, per_quantity_price
, super_type
,Discount	
,Profit
, Loss
 and follow the below pattern

a)product id should be  in this format 
ex FUR-BO-10001798 to 10001798 
b) per_quantity_price should be  output of Sales / Quantity of each customer records
c) sales_type should be 3 categories 
 if sales are higher than 1000 then 'Super'
if sales are higher than 400 but lesser than 1000  then 'Average'
if sales are lesser than 400 then 'low'
d)cLoss will be 1 if profit is negative


CREATE TABLE Sales_order_info AS
SELECT 
    SUBSTRING_INDEX(Product_ID, '-', -1) AS Product_ID,
    Category,
    Sub_Category,
    Product_Name,
    Sales,
    Quantity,
    Sales / Quantity AS per_quantity_price,
    CASE
        WHEN Sales > 1000 THEN 'Super'
        WHEN Sales > 400 AND Sales <= 1000 THEN 'Average'
        ELSE 'Low'
    END AS super_type,
    Discount,
    Profit,
    CASE
        WHEN Profit < 0 THEN 1
        ELSE 0
    END AS Loss
FROM salesdata_updated;


------Use single select statements to execute this

6) Count of distinct order_ids in  salesdata_updated table

SELECT COUNT(DISTINCT order_id) AS distinct_order_count
FROM salesdata_updated;

7) Count of Unique product names in Sales_order_info 

SELECT COUNT(DISTINCT Product_Name) AS unique_product_count
FROM Sales_order_info;

8) Count of distinct Segments in salesdata_updated table

SELECT COUNT(DISTINCT Segment) AS distinct_segment_count
FROM salesdata_updated;

9) Recent order date in  salesdata_updated table

SELECT MAX(order_date) AS recent_order_date
FROM salesdata_updated;

10)Old order date in salesdata_updated table

SELECT MIN(order_date) AS old_order_date
FROM salesdata_updated;

11) Customer info of all the columns for the maximum order date

SELECT *
FROM salesdata_updated
WHERE order_date = (
  SELECT MAX(order_date)
  FROM salesdata_updated
);

12) No .of Unique Customers from Texas and New york
o/p No_of_cust_texas |  No_of_cust_New_york

SELECT
  COUNT(DISTINCT CASE  WHEN State = 'Texas' THEN Customer_ID END) AS No_of_cust_texas,
  COUNT(DISTINCT CASE  WHEN State = 'New York' THEN Customer_ID END) AS No_of_cust_New_york
FROM
  salesdata_updated
WHERE
  State IN ('Texas', 'New York');

