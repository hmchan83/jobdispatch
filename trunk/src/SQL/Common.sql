use aiad018_db

SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES

delete from TaskStatus where StatusName='Closed' 

update TaskStatus set StatusName='Closed' where StatusID=5

ALTER TABLE Department ADD PRIMARY KEY (DeptID)

select * from information_schema.columns order by table_name

drop table Staff

select * from Comment

