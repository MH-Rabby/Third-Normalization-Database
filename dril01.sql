create database Evedence03
on
(
name='evedence03data',
fileName = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Evedence03.mdf',
size=20mb,
maxsize=25mb ,
filegrowth=10mb
)
log on
(
name='evedence03log',
fileName = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Evedence03.ldf',
size=20mb,
maxsize=25mb ,
filegrowth=10mb
)
go
--Use database 
Use Evedence03
go 
--create all needed tables

create table ITEM
(
SerialNo int identity not null,
ItemId int not null primary key,
ItemName nvarchar (50) not null
)
go 
--create table
create table color
(
SerialNo int identity not null,
ColorID INT not null primary key,
ColorName varchar (50) not null
)
go 
--create table
create table lot 
(
SerialNo int identity not null,
LotId int not null primary key ,
LotName varchar (40) not null,
ItemID INT REFERENCES Item(itemId)

)
go 
--create table 
create table Quantity
(
SerialNo int identity not null,
Quantity bigint not null primary key,
ItemID INT References item(itemid) not null,
ColorName varchar(50) not null
)
go 
exec sp_help 'quantity'
GO
alter table quantity
alter column colorName varchar (30) not null
go
--CREATE Table
create table Price
(
SerialNo int not null identity ,
Price money not null primary key,
ItemId int references item(itemid),
ColorName varchar (30) not null
)
go 
---alter all by mistake (for mistake)
alter table price
Drop constraint FK__Price__ColorID__4E88ABD4
go
alter table price 
drop column colorID
go 
alter table price 
add colorName varchar (30) not null
go 

--Create table 
create table Vat
(
SerialNo int not null identity ,
VatRate nvarchar (7) not null,
ItemID int References Item(itemid)
)
GO 
--solve my mistake(data type mistake)
alter table vat
alter column vatrate decimal (10,2) not null
go 
--Data Insert into (item) table 

select * from item
go
insert into item (ItemId,ItemName) values ( 1,'Denim')
insert into item(ItemId,ItemName) VALUES (2,'T-Shirt')
go 

--insert into color table
select *from color
go 

Insert into color(ColorID,ColorName) values (1,'Black'),
(2,'Blue'),(3,'Red'),(4,'Green')
go
---insert into lot 
insert into lot (LotId,LotName) values
(1,'Lot-1'),
(2,'Lot-2')
go 
--insert into Quantity
select *from Quantity
go 
insert into Quantity(Quantity,ItemID,colorName)values (12,1,'Black,Blue')
insert into Quantity (Quantity,ItemID,colorName)values (2,2,'Red,Green,Blue')

go
--data insert into price
select *from Price
go 
insert into Price(Price,ItemId,ColorName) values ( 15000,1,'Black,Blue'),
(14500,2,'Red,Green,Blue')
go
--data insert into vat
select *from vat
go 
insert into vat (VatRate,ItemID) values
(0.15,1),(0.15,2)
go 
--The end-----






