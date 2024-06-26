use [master]
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

---- Correct usage of string data types
--insert into inventory (name, colour) 
--VALUES (
--	'John Doe', 'Red'
--);

---- Correct usage of numeric data types
--insert into inventory (qoh, unit_price) 
--VALUES (
--	10, 45.99
--);

---- Correct usage of boolean data types
--insert into inventory (instock) VALUES (1); -- True
--insert into inventory (instock) VALUES (0); -- False

---- Correct usage of date data types
--insert into inventory (acquired_date) VALUES ('2024-02-27');

-- Start of week 1 exericse

insert into inventory (name, colour, unit_price, rec_retail_price, qoh, acquired_date, instock, created_date)
	VALUES 
		('Green Chair', 'Green', 45.99, 55.99, 10, '2024-02-27', 1, '2024-02-27 14:00:00'),
		('Blue Chair', 'Blue', 50.00, 60.00, 5, '2024-03-01',1, '2024-03-01 10:00:00');
		go

--insert into inventory
	--Values (
	--	'Blue Chair', 'Blue', 50.00, 60.00, 5, '2024-03-01',1, '2024-03-01 10:00:00' -- If entering into a table this way you must enter the values in the order in which the table is layed out e.g name first then colour and so on.
	--);

insert into inventory (name, colour, qoh, instock)
	values 
	('Red Chair', 'Red', 15, 1),
	('Red Table', 'red', 15, 1),
	('Blue Table', 'Blue', 15, 1),
	('Green Table', 'Green', 15, 1), 
	('Yellow Sofa', 'Yellow', 5, 1),
	('Purple Lamp', 'Purple', 7, 0),
	('Orange Desk', 'Orange', 3, 1),
	('Whiteboard', 'White', 10, 1),
	('Black Chair', 'Black', 15, 0),
	('Grey Table', 'Grey', 8, 1);
	go

--Altering records:

-- Update a specific record
update inventory set
	qoh = 8
	where id =1;

-- Update multiple records
update inventory set 
	qoh = 8,
	colour = 'Pink'
	where id = 1;

-- Altering Tables:

-- Adding New column(s)
alter table inventory
	add category varchar(50);
	go
-- Populate new column
update inventory set category = case
	when name LIKE '%Chair%' then 'chairs'
	when name LIKE '%Table%' then 'Tables'
	when name LIKE '%Sofa%' then 'Furniture'
	when name LIKE '%Lamp%' then 'Lighting'
	when name LIKE '%Desk%' then 'Desks'
	else 'misc'
	end;

-- Temporary column
alter table inventory
	add tmp_name varchar(50), tmp_colour varchar(50);
	go

update inventory set 
	tmp_name = name,  -- it's normal for the red lines to appear however the code should still run perfectly fine 
	tmp_colour = colour;
	go

-- Challenge Number 1
alter table inventory
	add inv_name varchar(50), colours varchar(50);
	go

update inventory set
	inv_name = name,
	colours = colour;
	go

-- Drop Columns | THIS IS CHALLENGE 2 FROM 2ND LAB
alter table inventory
	drop column tmp_name, tmp_colour
	go

-- Deleting specific records
delete from inventory
	where id = 1;
	go

-- Delete multiple records
delete from inventory
	where category = 'Tables'; -- is underlined in red because the column was added to the inventory table after the query is run.
	go

-- Challenge Time!:

-- Challenge 1 Add a new column named location to the inventory table to store the warehouse location of each item.
alter table inventory
	add location bit;
	go

-- Challenge 2 Modify the qoh (quantity on hand) column to a SMALLINT data type to save storage space.
alter table inventory
	alter column qoh smallint;
	go	

-- Challenge 3 Increase the rec_retail_price by $5.00 for all items with a unit_price less than $40.00.
update inventory
	set rec_retail_price = rec_retail_price + 5.00
	where unit_price < 40.00
	go

-- Challenge 4 Delete all items acquired before '2024-03-01'.
delete from inventory
where acquired_date < '2024-03-01';
	
-- Challenge 5 Delete all items in the Tables category.
delete from inventory
	where category like '%Tables%';
	go

-- Rename a column
exec sp_rename 'inventory.inv_name', 'name1';
	go

-- Rename a table
exec sp_rename 'inventory', 'products';
	go

exec sp_rename 'products', 'inventory';
	go


select * from inventory
	




-- Bunch of select queries for week 1
	--select * from inventory where unit_price > 20.00 -- Pulls records where unit price is greater than 20

	--select * from inventory where qoh != 0 -- Pulls all records where qoh is not equal to 0

	--select * from inventory where rec_retail_price < 100 -- Pulls all records where rec retial price is less than 100

	--select * from inventory where acquired_date < '2024-03-01' -- Pulls all records where the acquired date was before 2024-03-01

	--select * from inventory where name like '%Table%' -- Pulls all records that have the word 'table' in them

	--select * from inventory where colour in ('Red','Blue','Green') -- Pulls all records that have the colours stated 

	--select * from inventory where unit_price > 30.00 and instock = 1 -- Pulls all records that have a unit price greater than 30 and is instock 

	--select * from inventory where instock = 0 or unit_price < 30.00 -- Pulls all records that are either not in stock OR have a unit price less than 30 

	--select * from inventory where not instock =1; -- Pulls are records that are not instock   

	--select * from inventory -- Pulls all records in the inventory table
