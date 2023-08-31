                                                                                  Problem
1	Ranking Employees by Salary:														
	Given an "Employees" table with columns (EmployeeID, Name, Salary), write a SQL query to rank employees based on their salary in descending order, using the RANK() window function. If employees have the same salary, give them the same rank.

    SELECT
    EmployeeID,
    Name,
    Salary,
    RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM
    Employees;	
=======================================================================================================================================================================================================================================================================	

2	Running Total of Sales:											
	Given a "Sales" table with columns (TransactionID, Date, Amount), write a SQL query to calculate the running total of sales for each date, using the SUM() window function with the ORDER BY clause.


SELECT
    TransactionID,
    Date,
    Amount,
    SUM(Amount) OVER (ORDER BY Date) AS RunningTotal
FROM
    Sales;	
==================================================================================================================================================================================================================================
	
3	Finding the Top N Products in Each Category:												
	Given a "Products" table with columns (ProductID, ProductName, Category, Sales), write a SQL query to retrieve the top N products with the highest sales in each category, using the ROW_NUMBER() window function.												


WITH RankedProducts AS (
    SELECT
        ProductID,
        ProductName,
        Category,
        Sales,
        ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Sales DESC) AS RankInCategory
    FROM
        Products
)
SELECT
    ProductID,
    ProductName,
    Category,
    Sales
FROM
    RankedProducts
WHERE
    RankInCategory <= N;
	
===========================================================================================================================================================================================================================================================
4	Calculating the Difference in Revenue between Years:										
	Given a "Revenue" table with columns (Year, Revenue), write a SQL query to calculate the year-on-year revenue growth (or decline) using the LAG() or LEAD() window function.	


	SELECT
    Year,
    Revenue,
    LAG(Revenue) OVER (ORDER BY Year) AS PreviousYearRevenue,
    (Revenue - LAG(Revenue) OVER (ORDER BY Year)) AS RevenueChange
FROM
    Revenue;
	
==============================================================================================================================================================================================================
5	Calculating Average Monthly Sales:													
	Given a "Sales" table with columns (TransactionID, Date, Amount), write a SQL query to calculate the average monthly sales for each product, using the AVG() window function along with the PARTITION BY and GROUP BY clauses.

    SELECT
    ProductID,
    EXTRACT(YEAR FROM Date) AS Year,
    EXTRACT(MONTH FROM Date) AS Month,
    AVG(Amount) OVER (PARTITION BY ProductID, EXTRACT(YEAR FROM Date), EXTRACT(MONTH FROM Date)) AS AverageMonthlySales
FROM
    Sales;

======================================================================================================================================================================================================================================
6	Query to get the top 5 employee salary from table				
	Given a "employee" table with column (emp_id, name, department,salary)


    SELECT
    emp_id,
    name,
    department,
    salary
  FROM
    employee
  ORDER BY
    salary DESC
  LIMIT 5;	
 ======================================================================================================================================================================================================
 
 
7	customer id 	date	Transaction		
	1	01-Jan-21	Endrosement		
	1	05-Feb-21	call		
	1	01-Jul-21	call		
	2	15-Feb-21	New Business		
	2	15-Feb-21	call		
					
	1.check whether customer has atleast one call in the transaction. If they have a transaction then put yes as status else no				
	2.List the number of call has happen for each customer				
	3.Get the details of customer and date where their first call transcation happen
	
1.	 
SELECT DISTINCT
    c.customer_id,
    CASE WHEN EXISTS (SELECT 1 FROM transactions t WHERE t.customer_id = c.customer_id AND t.transaction = 'call') THEN 'yes' ELSE 'no' END AS status
FROM
    customers c;
	
2.	
SELECT
    customer_id,
    COUNT(*) AS call_count
FROM
    transactions
WHERE
    transaction = 'call'
GROUP BY
    customer_id;
	
3.	
SELECT
    t.customer_id,
    c.date AS first_call_date
FROM
    transactions t
JOIN
    (SELECT customer_id, MIN(date) AS date FROM transactions WHERE transaction = 'call' GROUP BY customer_id) c
ON
    t.customer_id = c.customer_id
WHERE
    t.transaction = 'call';