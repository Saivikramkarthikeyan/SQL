                                                               Windows function

a) Update the changes in the employee table as added in the SQL basics repository - 4_WindowsFunctions_Duplicates.sql

----to get the duplicate
with cte_salarydup as
(
select
id,
phone_number,
location,
ROW_NUMBER()
over (partition by phone_number) as num 
from employee
)
select * from cte_salarydup where num=1


----to get the duplicate for 2 column
with cte_salarydup as
(
select
id,
phone_number,
location,
ROW_NUMBER()
over (partition by phone_number,location) as rnum 
from employee
)
select * from cte_salarydup where rnum=1;

--Recent changes
INSERT INTO Employee (id, salary, age, phone_number, email_id, location)
VALUES (17, 70000, 31, '888-999-0000', 'natalie@example.com', 'London');

update employee set salary = 60000 where id = 15

----Pick the employee with nth highest salary in each location
with location_salary_order_desc as
(
select id,
salary,
location,
dense_rank()
over
(partition by location order by salary desc) as increasing_order
from
employee
)

select * from location_salary_order_desc where increasing_order=4



b)Generate the consecutive numbers for each record locationswise

select* from employee
SELECT 
    ROW_NUMBER() OVER (PARTITION BY location ORDER BY id) AS consecutive_number,
    id,
    location
FROM 
    employee;
	

c) From the employee tables derive a new table called employee_updated with no duplicates

CREATE TABLE employee_updated AS
SELECT DISTINCT * FROM employee;


d) FRom the employee write a select query to get all the duplicate phone numbers


SELECT phone_number, COUNT(*) as duplicate_count
FROM employee
GROUP BY phone_number
HAVING COUNT(*) > 1;

e) Implement a logic to show the difference between row_number and row_id


SELECT
    id,
    ROW_NUMBER() OVER (ORDER BY salary) AS row_num
FROM
    employee;



f) implement the different common table expressions to implement the below case statements

---Case 1: Arrange the employees in increasing order of their salary

WITH increasing_employees AS (
    SELECT *
    FROM employee
    ORDER BY salary 
)
SELECT *
FROM increasing_employees;


---Case 2: Arrange the employees based on the increasing order of their salary location wise

WITH increasing_employees AS (
    SELECT *
    FROM employee
    ORDER BY salary 
)
SELECT *
FROM increasing_employees;


---Case 3: Pick the employee with the second-highest salary in each location

WITH secondhighest_employees AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY location ORDER BY salary DESC) AS salary_rank
    FROM employee
)
SELECT *
FROM secondhighest_employees
WHERE salary_rank = 2;

---Case 4: Pick the employee with least salary in each location

WITH leastsalary_employees AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY location ORDER BY salary  ) AS salary_rank
    FROM employee
)
SELECT *
FROM leastsalary_employees
WHERE salary_rank = 1;







