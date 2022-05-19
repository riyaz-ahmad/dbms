
drop procedure [dbo].[RAGTA_studentInfoTemp_SP]

CREATE PROCEDURE [dbo].[RAGTA_studentInfoTemp_SP](
@Output_flag INTEGER Output,
@Input_IsProsess INTEGER,
@ProcessId INTEGER
 )
AS

Declare @countRecordFailed int;

IF @Input_IsProsess = 1

BEGIN

			Update RAGTA_studentInfoTemp  
			set sId = LTRIM(sId),
			name = LTRIM(name),
			age = LTRIM(age),
			mobile = LTRIM(mobile),
			email = LTRIM(email);
					
			Update RAGTA_studentInfoTemp
			set sId = RTRIM(sId),
			name = RTRIM(name),
			age = RTRIM(age),
			mobile = RTRIM(mobile),
			email = RTRIM(email);
			
			
			
		UPDATE RAGTA_studentInfoTemp 
		SET remarks= concat(isnull(remarks,''),'Student Id Sid is not valid.')
		WHERE  isnumeric(sId)= 0 ;
		
		UPDATE RAGTA_studentInfoTemp 
		SET remarks= concat(isnull(remarks,''),'Student Id Not Given.')
		WHERE  sId = '';

		UPDATE RAGTA_studentInfoTemp 
		SET remarks= concat(isnull(remarks,''),'Student Id Added More than one.')
		where sId In (select sId from RAGTA_studentInfoTemp 
        GROUP BY sId having count(sId)>1);
		 
		UPDATE RAGTA_studentInfoTemp
		SET remarks= concat(isnull(remarks,''),'Student Id already exists.')
		WHERE EXISTS (Select sId from RAGTA_studentInfo where RAGTA_studentInfoTemp.sId = RAGTA_studentInfo.sId);

		
		UPDATE RAGTA_studentInfoTemp 
		SET remarks= concat(isnull(remarks,''),'Student Name  is not valid.')
		WHERE  name LIKE '%[^a-zA-Z]%';
		
		UPDATE RAGTA_studentInfoTemp 
		SET remarks= concat(isnull(remarks,''),'Student Name Required.')
		WHERE  name = '';
		
		UPDATE RAGTA_studentInfoTemp 
		SET remarks= concat(isnull(remarks,''),'Student age is not valid.')
		WHERE  ISNUMERIC(age)=0 ;
		
		UPDATE RAGTA_studentInfoTemp 
		SET remarks= concat(isnull(remarks,''),'Student Age is Required.')
		WHERE age = '';
		
		UPDATE RAGTA_studentInfoTemp 
		SET remarks= concat(isnull(remarks,''),'Student email is not valid.')
		WHERE  email not like '%@%' ;

		UPDATE RAGTA_studentInfoTemp 
		SET remarks= concat(isnull(remarks,''),'Student email is not valid.')
		WHERE  email  like '@%' ;
		
		UPDATE RRT_temp 
		SET remarks= concat(isnull(remarks,''),'Student email Required.')
		WHERE  email = '';
		
		UPDATE RAGTA_studentInfoTemp 
		SET remarks= concat(isnull(remarks,''),'Student conatact NOT GREATER THAN TEN.')
	    where LEN(mobile)>10 ;
	
	    UPDATE RAGTA_studentInfoTemp 
		SET remarks= concat(isnull(remarks,''),'Student contact not valid.')
		WHERE mobile LIKE '%[a-zA-Z]%' or contactNo LIKE '%[^a-zA-Z0-9]%';

	    UPDATE RAGTA_studentInfoTemp 
		SET remarks= concat(isnull(remarks,''),'Student cintact SHOULD NOT BE LESS THAN 10.')
	   where LEN(mobile)<10 ; 
	
		UPDATE RAGTA_studentInfoTemp 
		SET remarks= concat(isnull(remarks,''),'Student conatct Required.')
		where contactNo = '';
	

		set @countRecordFailed = (select count(remarks) from RAGTA_studentInfoTemp where remarks !='' );
		IF(@countRecordFailed != 0)
		BEGIN
		  set @Output_flag = 0;
		  
		  
		  END;
		  ELSE
		   BEGIN
		   set @Output_flag = 1;
		   
		   END;
		   END;
		  
		   
GO


