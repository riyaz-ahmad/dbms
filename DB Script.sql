INSERT INTO `POC_CaseTable` 
(`CaseId`, `CaseType`, `PassportNumber`, `FullName`, `Country`, `TravelDateAndTime`, `TravelFrom`, 
`TravelTo`, `Status`, `Remarks`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`)
AS
SELECT 
`CaseId`, `CaseType`, `PassportNumber`, `FullName`, `Country`, `TravelDateAndTime`, `TravelFrom`, 
`TravelTo`, `Status`, `Remarks`, `CreatedBy`, `CreatedOn`, `ModifiedBy`, `ModifiedOn`

CONCAT(PassportNumber,'A')


INSERT INTO POC_CaseTable 
(CaseType, PassportNumber, FullName, Country, TravelDateAndTime, TravelFrom, 
TravelTo, Status, Remarks, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn)

SELECT 
CaseType,CONCAT(PassportNumber,'3a') , FullName, Country, TravelDateAndTime, TravelFrom, 
TravelTo, Status, Remarks, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn From POC_CaseTable




where CaseId In (19,20,30,45,56)


select s1.* into POC_CaseTableTemp from (

	


)s1

select * from POC_CaseTable order by CaseId desc

set identity_insert POC_CaseTable ON

Alter table POC_CaseTable auto increment = 1002

DROP TABLE POC_CaseTable







