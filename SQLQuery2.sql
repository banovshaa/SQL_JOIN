




Create database ShoppingMall
use ShoppingMall
Create Table Brands
(
Id int identity Primary Key,
Name nvarchar(200),
)

INSERT INTO Brands
VALUES
('Apple'),
( 'Hp'),
('Samsung')

Create Table Phones
(
Id int identity Primary Key,
Name nvarchar(200),
Price money ,
BrandId int Foreign Key References Brands(Id)
)
Create Table Notebooks
(
Id int identity Primary Key,
Name nvarchar(200),
Price money ,
BrandId int Foreign Key References Brands(Id)
)

Insert Into Phones 
Values
('Galaxy AiIR PRO',3376,3),
('A11',3376,3),
('A21',275,3),
('A31',285,3),
('A41',374,3),
('A51',467,3),
('Poco 5',1753,2),
('Poco 3',2153,2),
('Poco 4',4685,2),
('13',1704,1),
('13 pro',2467,1),
('13 pro max',3467,1)

Insert Into Notebooks 
Values
('Galahgtxy',5000,1),
('A1sg1',376,3),
('A2stg1',2075,2),
('A3s1',2850,3),
('As41',3674,2),
('Astg51',4667,3),
('Postco 5',1753,1),
('Poctso 3',2153,2),
('Possco 4',4685,2),
('13',1704,1),
('13 pro',2467,2),
('13 pro max',3467,1)

Select n.Name+' ' + b.Name as [BrandName], n.price From Notebooks n
Join Brands B
On n.BrandId= B.Id

Select n.Name+' ' + b.Name as [BrandName], n.price From Notebooks n
Left Join Brands B
On n.BrandId= B.Id

Select p.Name+' ' + b.Name as [BrandName], p.price From Phones p
Join Brands b
On p.BrandId= b.Id

Select n.Name as 'Name' , b.Name as 'Brand Name' From Notebooks n
Join Brands b 
On b.Id = n.BrandId
Where b.Name Like('%s%')

Select  n.Name ,N.Price From Notebooks n
Where Price between 2000 and 5000 or Price > 5000 

Select b.Name as 'Brand Name', Count(Notebooks.Id) as 'Notebook count' from Brands b
join Notebooks
on b.Id = Notebooks.BrandId
Group by b.Name

Select b.Name as 'Brand Name', Count(*) as 'Notebook count' from Brands b
right join Notebooks
on b.Id = Notebooks.BrandId
Group by b.Name

Select Name, BrandId from Notebooks
intersect
Select Name, BrandId from Phones

Select * From Notebooks
Union All
Select * From Phones

Select p.Id, p.Name, p.Price, b.Name as 'Brand Name' From Phones p
Join Brands b
On b.Id = p.BrandId
Union All
Select n.Id, n.Name, n.Price, b.Name as 'Brand Name' From Notebooks n
Join Brands b
On b.Id = n.BrandId

Select p.Id, p.Name, p.Price, b.Name as 'Brand Name' From Phones p
Join Brands b
On b.Id = p.BrandId
Where p.Price>1000
Union All
Select n.Id, n.Name, n.Price, b.Name as 'Brand Name' From Notebooks n
Join Brands b
On b.Id = n.BrandId
Where n.Price>1000

Select * From 
(
Select p.Id, p.Name, p.Price, b.Name as 'Brand Name' From Phones p
Join Brands b
On b.Id = p.BrandId
Union All
Select n.Id, n.Name, n.Price, b.Name as 'Brand Name' From Notebooks n
Join Brands b
On b.Id = n.BrandId
) as sq
Where sq.Price > 1000

Select  b.Name as 'Brand Name',Sum(Price)as 'Total Price', Count(*) as 'Total Count' From Brands b
Join Phones 
on Phones.BrandId = b.Id
Group By b.Name


