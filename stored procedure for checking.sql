USE [AppianSecondary]
GO

/****** Object:  StoredProcedure [dbo].[RRT_Temp_SP]    Script Date: 12/17/2021 10:29:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[RRT_Temp_SP](
@Output_flag INTEGER Output,
@Input_IsProsess INTEGER,
@ProcessId INTEGER
 )
AS

Declare @countRecordFailed int;

IF @Input_IsProsess = 1

BEGIN

			Update RRT_temp
			set employeeId = LTRIM(employeeId),
			fristName = LTRIM(fristName),
			lastName = LTRIM(lastName),
			contactNo = LTRIM(contactNo),
			address = LTRIM(address);
					
			
			Update RRT_temp
			set employeeId = RTRIM(employeeId),
		    fristName = RTRIM(fristName),
			lastName = RTRIM(lastName),
			contactNo = RTRIM(contactNo),
			address = RTRIM(address);
			
			
		UPDATE RRT_temp 
		SET Remarks= concat(isnull(Remarks,''),'Employee Id is not valid.')
		WHERE  isnumeric(employeeId)= 0 ;
		
		UPDATE RRT_temp 
		SET Remarks= concat(isnull(Remarks,''),'Employee Id Not Given.')
		WHERE  employeeId = '';

		UPDATE RRT_temp 
		SET Remarks= concat(isnull(Remarks,''),'Employee Id Added More than one.')
		where employeeId In (select employeeId from RRT_temp 
        GROUP BY employeeId having count(employeeId)>1);
		 
		UPDATE RRT_temp
		SET Remarks= concat(isnull(Remarks,''),'EmployeeId already exists.')
		WHERE EXISTS (Select employeeId from RRT_main where RRT_main.employeeId = RRT_temp.employeeId );

		
		UPDATE RRT_temp 
		SET Remarks= concat(isnull(Remarks,''),'Employee First Name is not valid.')
		WHERE  fristName LIKE '%[^a-zA-Z]%';
		
		UPDATE RRT_temp 
		SET Remarks= concat(isnull(Remarks,''),'Employee Name Required.')
		WHERE  fristName = '';
		
		UPDATE RRT_temp 
		SET Remarks= concat(isnull(Remarks,''),'Employee Last Name is not valid.')
		WHERE  lastName LIKE '%[^a-zA-Z]%';
		
		UPDATE RRT_temp 
		SET Remarks= concat(isnull(Remarks,''),'Employee Last Name is Required.')
		WHERE lastName = '';
		
		UPDATE RRT_temp 
		SET Remarks= concat(isnull(Remarks,''),'Employee Address is not valid.')
		WHERE  isnumeric(address)=1 ;
		
		UPDATE RRT_temp 
		SET Remarks= concat(isnull(Remarks,''),'Employee Address Required.')
		WHERE  address = '';
		
		UPDATE RRT_temp 
		SET Remarks= concat(isnull(Remarks,''),'Employee NUMBER NOT GREATER THAN TEN.')
	    where LEN(contactNo)>10 ;
	
	    UPDATE RRT_temp 
		SET Remarks= concat(isnull(Remarks,''),'Employee NUMBER not valid.')
		WHERE contactNo LIKE '%[a-zA-Z]%' or contactNo LIKE '%[^a-zA-Z0-9]%';

	    UPDATE RRT_temp 
		SET Remarks= concat(isnull(Remarks,''),'Employee NUMBER SHOULD NOT BE LESS THAN 10.')
	   where LEN(contactNo)<10 ; 
	
		UPDATE RRT_temp 
		SET Remarks= concat(isnull(Remarks,''),'Employee NUMBER Required.')
		where contactNo = '';
	

		set @countRecordFailed = (select count(Remarks) from RRT_temp where Remarks !='' );
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


