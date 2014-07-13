use aiad018_db

create table Staff 
(StaffID int identity(1,1) Primary Key,
RealName varchar(20) Not Null,
Username varchar(20),
Pwd nvarchar(32),
RoleID int FOREIGN KEY REFERENCES UserRole(RoleID),
DeptID int FOREIGN KEY REFERENCES Department(DeptID),
Email nvarchar(250),
ContactNumber varchar(15),
)

create table SystemLog
(LogID int identity(1,1)Primary Key,
LogType varchar(20),
TaskID int FOREIGN KEY REFERENCES Task(TaskID),
AssigneeID int FOREIGN KEY REFERENCES Staff(StaffID),
ReporterID int FOREIGN KEY REFERENCES Staff(StaffID),
Date datetime
)

create table Task
(TaskID int identity(1,1)Primary Key,
TaskName varchar(200),
TypeID int FOREIGN KEY REFERENCES TaskType(TypeID),
StatusID int FOREIGN KEY REFERENCES TaskStatus(StatusID),
PriorityID int FOREIGN KEY REFERENCES TaskPriority(PriorityID),
TaskDescription nvarchar(500),
AssigneeID int FOREIGN KEY REFERENCES Staff(StaffID),
ReporterID int FOREIGN KEY REFERENCES Staff(StaffID)
)

create table Department
{DeptID int identity(1,1) Primary Key,
DeptName varchar(20)
}

create table TaskType
{TypeID int identity(1,1) Primary Key,
TypeName varchar(20)
}

create table TaskStatus
{StatusID int identity(1,1) Primary Key,
StatusName varchar(20)
}

create table TaskPriority
{PriorityID int identity(1,1) Primary Key,
PriorityName varchar(20)
}

create table UserRole
{RoleID int identity(1,1) Primary Key,
RoleName varchar(20)
}

create table Comment
(CommentID int identity(1,1) Primary Key,
CommenterID int FOREIGN KEY REFERENCES Staff(StaffID),
TaskID int FOREIGN KEY REFERENCES Task(TaskID),
Date datetime,
Content nvarchar(500)
)