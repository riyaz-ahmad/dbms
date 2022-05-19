/*Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case*/
SELECT UPPER(FIRST_NAME) FROM WORKER;

/* Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.*/
/*The MySQL BINARY function is used for converting a value to a binary string. The BINARY function can also be implemented using CAST function as CAST(value AS BINARY).
The BINARY function accepts one parameter which is the value to be converted and returns a binary string.*/
SELECT SUBSTRING(FIRST_NAME,1,3) FROM WORKER;

/*Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.*/
/*The INSTR() function returns the position of the first occurrence of a string in another string.
This function performs a case-insensitive search.*/
Select INSTR(FIRST_NAME, BINARY'a') from Worker where FIRST_NAME = 'Amitabh';

/*Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’*/
Select REPLACE(FIRST_NAME,'a','A') from Worker;

/*Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.*/
Select CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'COMPLETE_NAME' from Worker;

/*Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.*/
Select * from Worker where FIRST_NAME LIKE '%a%';

/*Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.*/
Select * from Worker where FIRST_NAME LIKE '_____h';

/* Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.*/
Select * from Worker where SALARY BETWEEN 100000 AND 500000;

/*Write an SQL query to print details of the Workers who have joined in Feb’2014.*/
Select * from Worker where YEAR(JOINING_DATE) = 2014 AND MONTH(JOINING_DATE) = 2;

/*Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.*/
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM worker 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM worker 
WHERE Salary BETWEEN 50000 AND 100000);

/*Write an SQL query to print details of the Workers who are also Managers*/
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');

/*Write an SQL query to fetch duplicate records having matching data in some fields of a table.*/
SELECT WORKER_TITLE, COUNT(*) AS COUNT
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

/* Write an SQL query to fetch the list of employees with the same salary.*/
Select distinct * 
from Worker W, Worker W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID;

/*Write an SQL query to fetch the departments that have less than five people in it*/
SELECT DEPARTMENT, COUNT(WORKER_ID) as 'No of Workers' FROM Worker GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 5;

/*Write an SQL query to fetch departments along with the total salaries paid for each of them.*/
SELECT DEPARTMENT, sum(Salary) AS TOTAL_SALARY from worker group by DEPARTMENT;
