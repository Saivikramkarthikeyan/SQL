                                                                        Problems					
					
					
1.					
column names	type		column names	type	
Id	int		addressid	int	
lastname	varchar		personid	int	
firstname	varchar		city	varchar	
person table			state	varchar	
			Address table		
					
Write an SQL query to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.	


    SELECT
    p.firstname,
    p.lastname,
    a.city,
    a.state
FROM
    person p
LEFT JOIN
    address a ON p.Id = a.personid;

==============================================================================================================================================================================================================

2.					
column names	type				
Id	int	Employee			
salary	int				
Find the second highest salary from the Employee table. If there is no second highest salary, return null 					
					
					
       SELECT DISTINCT salary
       FROM Employee
       ORDER BY salary DESC
       LIMIT 1 OFFSET 1;	
====================================================================================================================================================================

3.
  column names	type	
  Id	int	Employee
  salary	int		   
  					
  for the above employee table Find the nth highest salary from the Employee table. If there is no nth highest salary, return null.The result format is in the following example.					
					
   SELECT
    CASE
        WHEN COUNT(*) >= n THEN
            (SELECT DISTINCT salary FROM Employee ORDER BY salary DESC LIMIT 1 OFFSET n - 1)
        ELSE
            NULL
    END AS nth_highest_salary
FROM Employee;

====================================================================================================================================================================================
					
4.	column names	type				
empid	int				
name	int		column names	type	
supervisor	varchar		Id	int	
salary	varchar		bonus	int	
Employee			bonus		
					
Write an SQL query to report the name and bonus amount of each employee with a bonus less than 1000.					
									
    
	SELECT e.name, e.bonus
    FROM Employee e
    WHERE e.bonus < 1000;
    In this query:
	
====================================================================================================================================================================================

5.
  					
column names	type				
Id	int				
name	varchar				
referee_id	int				
Customer					
Write an SQL query to report the names of the customer that are not referred by the customer with id = 2.					
					
					
	
	   SELECT c.name
       FROM Customer c
       WHERE c.referee_id IS NULL OR c.referee_id <> 2;

====================================================================================================================================================================================

6.
   					
column names	type				
x	int				
y	int				
z	int				
Triangle					
Each row of this table contains the lengths of three line segments.
Write an SQL query to report for every three line segments whether they can form a triangle.					
					

  SELECT x, y, z,
    CASE
        WHEN x + y > z AND y + z > x AND z + x > y THEN 'Yes'
        ELSE 'No'
    END AS can_form_triangle
  FROM Triangle;
  
 =================================================================================================================================================================================
 
 7.
   column names	type				
   actor_id	int				
   director_id	int				
   timestamp	int				
   ActorDirector					
					
timestamp is the primary key column for this table.
Find all the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.

    
    SELECT ad.actor_id, ad.director_id
    FROM ActorDirector ad
    GROUP BY ad.actor_id, ad.director_id
    HAVING COUNT(*) >= 3;	
					
========================================================================================================================================================================================

8.
   column names	type				
   id	int	Primary key			
   name	varchar				
   weight	int	Kg			
   turn	int				
   Queue					
					
turn determines the order of which the people will board the bus, where turn=1 denotes the first person to board and turn=n denotes the last person to board.

There is a queue of people waiting to board a bus. However, the bus has a weight limit of 1000 kilograms, so there may be some people who cannot board.

Write an SQL query to find the person_name of the last person that can fit on the bus without exceeding the weight limit. The test cases are generated such that the first person does not exceed the weight limit.


    SELECT name AS person_name
    FROM Queue
    WHERE weight <= 1000
    ORDER BY turn DESC
    LIMIT 1;					
=============================================================================================================================================================================================================================

9.
  		
EMP_ID	Name	Manger_ID
1	Mark	3
2	Natasha	4
3	Chris	2
4	Robert	Null
5	Steve	2
		
query to get the employee id, employee name and their manager name and manager id		


    SELECT
    e.EMP_ID,
    e.Name AS EmployeeName,
    m.Name AS ManagerName,
    e.Manger_ID AS ManagerID
FROM
    YourTableName e
LEFT JOIN
    YourTableName m ON e.Manger_ID = m.EMP_ID;

========================================================================================================================================================================	
					
					
					
					
					
					
									
					


