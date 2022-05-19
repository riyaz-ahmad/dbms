
select * from  RAGTA_masterLookUpCdt

select * from RAGTA_employeeDetails

select * from RAGTA_academicInfo

select * from RAGTA_documentInfoR;

select * from RAGTA_RequestDetailsCdtR

select * from RAGTA_RequestTimeCdt


delete from RAGTA_RequestTimeCdt where Id = 21;


delete from RAGTA_employeeDetails where employee_id = 4

truncate  table RAGTA_academicInfo






select * from RAGTA_VW_employeeDetails


create view RAGTA_VW_employeeDetails
As
SELECT E.employee_id, E.first_name,E.last_name,E.gender, E.contact_no,E.email,D.milestone,D.status,D.isactive
FROM  RAGTA_employeeDetails E 
LEFT JOIN RAGTA_RequestDetailsCdtR D 
ON E.request_id= D.Id
GO

alter view RAGTA_VW_employeeDetails drop column position 


SELECT E.Employee_Id, CONCAT(E.first_name,' ',E.last_name)AS Name, E.contact_no,E.email,E.position,E.experience,D.milestone,D.status,D.isactive
FROM  RAGTA_employeeDetails E 
LEFT JOIN RAGTA_RequestDetailsCdtR D 
ON E.request_Id= D.Id

delete from RAGTA_employeeDetails where


update RAGTA_employeeDetails set is_active=1


drop view RAGTA_VW_employeeDetails


CREATE PROCEDURE  RAGTA_getActiveEmployee @position varchar(30)
AS
select a.employee_id, a.first_name, a.last_name, a.dob , a.email, a.contact_no, a.experience, a.position, a.gender, a.nationality, a.martial_status
from RAGTA_employeeDetails a inner join RAGTA_RequestDetailsCdtR b on a.request_id = b.Id where b.IsActive=1 and a.position= @position
GO


exec RAGTA_getActiveEmployee @position = 'Appian L2'



CREATE PROCEDURE  countAppianL1 @position varchar(30)
AS
select count(*) 
from RAGTA_employeeDetails a inner join RAGTA_RequestDetailsCdtR b on a.request_id = b.Id where b.IsActive=1 and a.position= @position
GO

exec countAppianL1 @position = 'Appian L1'