use aiad018_db

insert into Task(TaskName,TypeID,StatusID,PriorityID,TaskDescription,AssigneeID,ReporterID)
		values ('T1','1','1','1','TESTING','1','1')
		
insert into SystemLog(LogType,TaskID,AssigneeID,ReporterID,Date)
				values ('HelloWorld','1','1','1',GETDATE())
				
insert into Staff(RealName,Username,Pwd,RoleID,DeptID,Email,ContactNumber)
		values ('Administrator','admin','admin','1',NULL,NULL,NULL)
		
insert into Comment (CommenterID,TaskID,Date,Content)
			values('1','1',GETDATE(),'This is the 1st comment')