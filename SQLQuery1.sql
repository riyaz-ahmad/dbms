select * from RAGTA_academicInfo

insert into RAGTA_academicInfo ("education", "university", "subjects", "passing_year","percentage", "is_active")
values (
'B.Tech','RTU','Appian','2020','80.5',1
);

insert into RAGTA_academicInfo ("education", "university", "subjects", "passing_year","percentage", "is_active")
values (
'M.Tech','RTU','AI','2018','80.5',1
);

insert into RAGTA_academicInfo ("education", "university", "subjects", "passing_year","percentage", "is_active")
values (
'B.Tech','RTU','CS','2020','80.5',1
);

insert into RAGTA_academicInfo ("education", "university", "subjects", "passing_year","percentage", "is_active")
values (
'M.Tech','KU','CS','2022','79',1
);

insert into RAGTA_academicInfo ("education", "university", "subjects", "passing_year","percentage", "is_active")
values (
'B.Tech','KU','ME','2020','77',1
);

insert into RAGTA_academicInfo ("education", "university", "subjects", "passing_year","percentage", "is_active")
values (
'M.Tech','BHU','CS','2019','88',1
);



select * from RAGTA_academicInfo where percentage>80 AND subjects='CS' and (university='AKTU' or university='RTU')


select * from RAGTA_academicInfo;

SELECT count(*)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'RAGTA_academicInfo'

select * from RAGTA_employeeDetails


/* to get total numbr of columns present in a table*/
SELECT count(*)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'RAGTA_employeeDetails'

insert into RAGTA_employeeDetails values
(
'Komal','Agarwal','6852681771','6298275130','2021-10-15 01:49:25.000', 'RiyazA','1998-07-11', 1, 'komalA@gamil.com', '2020-11-23 08:12:05.000', 'RiyazA',
'Appian L2', 2, 'Unmarried', 'Female','American',3,'komalA'
);

delete from RAGTA_employeeDetails where employee_id in (14,15)

select * from RAGTA_documentInfoR;

SELECT count(*)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'RAGTA_documentInfoR'

ALTER TABLE dbo.RAGTA_documentInfoR DROP COLUMN createdon;

SELECT count(*)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'RAGTA_RequestTimeCdt'

drop table RAGTA_masterLookUp

SELECT count(*)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'RAGTA_masterLookUpCdt'

select * from  RAGTA_masterLookUpCdt


select * from RAGTA_RequestDetailsCdtR


SELECT count(*)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'RAGTA_RequestDetailsCdtR'

insert into RAGTA_RequestDetailsCdtR values(
'submitted','RiyazA', '2021-10-15 01:49:25.000', 'Milestone','RiyazA','2021-10-15 01:49:25.000',1
);

select * from RAGTA_masterLookUpCdt

update RAGTA_academicInfo
set is_active=0

insert into RAGTA_masterLookUpCdt values
(
'HR', 'Sr HR', 'Senior HR', 'Senior HR', 1, 10, '2021-11-20 11:23:36.000', 'RiyazA'
);


select * from ragtacreateorder



/*creating a query fro grouping the data of master lookup*/
select ROW_NUMBER() over (order by Type) As 
MasterKookUpId, Type, [Group], CreatedBy, CreatedOn
from RAGTA_masterLookUpCdt
Group By Type, [Group],CreatedBy, CreatedOn;

/*Creating a view*/
create view RAGTA_VW_masterLookUpCdt
as
select ROW_NUMBER() over (order by Type) As 
MasterKookUpId, Type, [Group], CreatedBy, CreatedOn
from RAGTA_masterLookUpCdt
Group By Type, [Group],CreatedBy, CreatedOn
go

/*checking the data of view*/
select * from RAGTA_VW_masterLookUp

drop view RAGTA_VW_masterLookUpCdt

create view RAGTA_VW_masterLookUp
as
select row_number() over(order by Type) As MasterLookUpId,Type,[Group],CreatedBy,CreatedOn from RAGTA_masterLookUpCdt GROUP BY Type,[Group],CreatedBy,CreatedOn
go

select * from RAGTA_RequestDetailsCdtR

/*drop table RAGTA_RequestDetailsCdtR*/