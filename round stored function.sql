DELIMITER &&
CREATE FUNCTION ROUNDSALARY(SALARY INT) RETURNS INT DETERMINISTIC 
BEGIN RETURN ROUND(SALARY, -2); 
END &&
DELIMITER ;

SELECT  FIRST_NAME, LAST_NAME , ROUNDSALARY(SALARY) FROM Worker;

/* PROCEDURE WHICH WILL TAKE INPUT*/
create procedure my(
	IN worker_id INT,
)
BEGIN
select * from 
worker w join bonus b
ON (w.worker_id=b.worker_ref_id)
where w.worker_id=b.worker_ref_id
GROUP BY WORKER_ID

END

/*CALLING*/
call my(1)
