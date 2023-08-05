                                                                  Lead and lag upadated
use internship;
CREATE TABLE sales_demo (
  customer_id INT,
  order_id INT,
  order_date DATE,
  sales_amount FLOAT
);

INSERT INTO sales_demo (customer_id, order_id, order_date, sales_amount)
VALUES
  (1, 1002, '2022-02-03', 120.0),
  (3, 1007, '2022-01-02', 250.0),
  (7, 1019, '2022-01-05', 250.0),
  (4, 1010, '2022-01-03', 320.0),
  (1, 1001, '2022-01-01', 100.0),
  (5, 1015, '2022-03-11', 150.0),
  (2, 1006, '2022-03-08', 220.0),
  (6, 1016, '2022-01-04', 200.0),
  (2, 1005, '2022-02-04', 180.0),
  (5, 1014, '2022-02-07', 120.0),
  (3, 1008, '2022-02-06', 300.0),
  (4, 1012, '2022-03-12', 400.0),
  (1, 1003, '2022-03-05', 150.0),
  (6, 1018, '2022-03-14', 220.0),
  (4, 1011, '2022-02-07', 350.0),
  (5, 1013, '2022-01-03', 100.0),
  (6, 1017, '2022-02-08', 180.0),
  (7, 1020, '2022-02-09', 300.0),
  (3, 1009, '2022-03-10', 280.0),
  (2, 1004, '2022-01-01', 200.0);
  
  select * from sales_demo
  
  ---running total
Select customer_id,
  order_id,
  order_date,
  sales_amount,
  SUM(sales_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS running_total
FROM 
  sales_demo
ORDER BY 
  customer_id, order_date;
  
-----Running totals for datewise
select distinct order_date, sum(sales_amount) over (order by order_date) as running_totals from sales_demo

-----to get the Running totals for monthwise
select distinct order_date,
month(order_date) as month,
sales_amount,
sum(sales_amount) 
over (partition by month(order_date) 
order by order_date,month(order_date)) as running_totals_monthwise
from sales_demo

---to find monthwise running total and the overall order count along
select distinct month(order_date), 
count(order_id) over (partition by month(order_date)) as orders_count_monthwise,
sum(sales_amount) over (partition by month(order_date)) as sales_value_monthwise,
sum(sales_amount) over (ORDER BY month(order_date)) AS monthwise_running_total
from sales_demo


-- Add the profit_status column to the table and update its values
SELECT
  order_Date,
  sales_amount,
  LAG(sales_amount) OVER (ORDER BY order_Date) AS PreviousDaySales,
  lead(sales_amount) OVER (ORDER BY order_Date) AS NextDaysales,
  ((sales_amount)- (lag(sales_amount) OVER (ORDER BY order_Date)))
  /
  LAG(sales_amount) OVER (ORDER BY order_Date)*100 as change_percentage
 FROM
  sales_demo;
     

----to calculate the change in sales percentage
SELECT
  order_Date,
  sales_amount,
  LAG(sales_amount) OVER (ORDER BY order_Date) AS PreviousDaySales,
  lead(sales_amount) OVER (ORDER BY order_Date) AS NextDaySales,
  ((sales_amount)- (lag(sales_amount) OVER (ORDER BY order_Date)))
  /
  LAG(sales_amount) OVER (ORDER BY order_Date)*100 as change_percentage
FROM
  sales_demo;

-- Step 5: Display the updated table
SELECT * FROM sales_demo;
  
