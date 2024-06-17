USE [master]
go

drop table if exists inventory;
go

create table inventory (
	id int identity(1,1) primary key,
	name varchar(30),
	colour varchar(30),
	unit_price decimal(8,2) default 10.00,
	rec_retail_price smallmoney default 20.00,
	qoh int,
	acquired_date date default getdate(),
	instock bit,
	created_date smalldatetime default getdate()
);
go

-- Start of week 1 exericse

insert into inventory (name, colour, unit_price, rec_retail_price, qoh, acquired_date, instock, created_date)
VALUES 
	('Green Chair', 'Green', 45.99, 55.99, 10, '2024-02-27', 1, '2024-02-27 14:00:00'),
	('Blue Chair', 'Blue', 50.00, 60.00, 5, '2024-03-01',1, '2024-03-01 10:00:00');



insert into inventory (name, colour, qoh, instock)
values 
('Red Chair', 'Red', 15, 1),
('Red Table', 'Red', 20, 1),
('Blue Table', 'Blue', 25, 1),
('Green Table', 'Green', 30, 1), 
('Yellow Sofa', 'Yellow', 5, 1),
('Purple Lamp', 'Purple', 7, 0),
('Orange Desk', 'Orange', 3, 1),
('Whiteboard', 'White', 10, 1),
('Black Chair', 'Black', 15, 0),
('Grey Table', 'Grey', 8, 1);

-- Start of 3rd Lab

-- Using the count aggregate function
select count(unit_price) as NumberOfPrices
from inventory;
go

-- Other aggregate functions
select
	sum(unit_price) as TotalPrice,
	avg(unit_price) as AveragePrice,
	max(unit_price) as HighestPrice,
	min(unit_price) as LowestPrice
	from inventory;
	go

---- Combining numeric values with strings
select 'the total sum of unit_price is $' + cast(sum(unit_price) as varchar) as TotalPriceMessage
	from inventory;
go

-- Using Group By
select
	colour,
	sum(unit_price) as TotalPrice
	from inventory
	group by colour;
	go

---- Having and group by
select
	colour,
	sum(unit_price) as TotalPrice
	from inventory
	group by colour
	having sum(unit_price) > 30;
	go

-- Additional exercise 1
select 
	colour,
	sum(unit_price) as TotalPrice,
	max(unit_price) as TotalPrice,
	min(unit_price) as TotalPrice
	from inventory
	group by colour
	go

-- Additional exercise 2
SELECT 
    colour,
    'For Colour ' + colour + ', The total price is $' + 
    CAST(ROUND(SUM(unit_price), 2) AS VARCHAR) + ', The Average price is $' + 
    CAST(ROUND(AVG(unit_price), 2) AS VARCHAR) + ', and the highest price is $' + 
    CAST(ROUND(MAX(unit_price), 2) AS VARCHAR) AS message
FROM 
    inventory
GROUP BY 
    colour;
GO

-- Additional Exercise 3
SELECT 
    colour,
    'For Colour ' + colour + ', The total price is $' + 
    CONVERT(VARCHAR, ROUND(SUM(unit_price), 2)) + ', The Average price is $' + 
    CONVERT(VARCHAR, ROUND(AVG(unit_price), 2)) + ', and the highest price is $' + 
    CONVERT(VARCHAR, ROUND(MAX(unit_price), 2)) AS message
FROM 
    inventory
GROUP BY 
    colour;
GO


--select * from inventory
