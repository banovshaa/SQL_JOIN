Create database Company
use Company
Create Table dbo.Departments 
(
Id int identity Primary Key,
Name nvarchar(100) Not Null Check(Len(Name)>2)
)
Create Table dbo.Employees 
(
Id int identity Primary Key,
FullName nvarchar(100) Not Null Check(Len(FullName)>3),
Salary money Check(Salary>=0) Not Null,
Email nvarchar(200) Not Null Unique,
DepartmentId int Foreign Key References Departments(Id)
)
