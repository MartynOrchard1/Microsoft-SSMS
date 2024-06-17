use [master]
go

drop table if exists patient;
drop table if exists patients;

create table patient (
	patient_id int primary key not null,
	patient_first_name varchar(25) not null, 
	patient_last_name varchar(25) not null,
	gender char(2) not null,
	date_of_birth smalldatetime not null,
	height decimal(5,2),
	[weight] decimal(5,2),
	hm_phone varchar(25)
);

exec sp_rename 'patient','patients'
go

sp_rename 'patients.hm_phone', 'home_phone'
go

alter table patients
	alter column date_of_birth date;
	go

alter table patients
	add primary_doctor_id int;
	go

insert into patients 
values
(1, 'John', 'Doe', 'M', '1986-03-26', 1.80, 77.50, '06-3559090', 5),
(2, 'Jane', 'Doe', 'F', '1986-03-19', 1.70, 69.50, '06-3559090', 5),
(3, 'Max', 'Merrit', 'M', '1986-02-28', 2.00, 77.50, '06-3333333', 1),
(4, 'Maxine', 'Merrot', 'F', '1986-05-26', 1.80, 66.50, '06-3333333', 1),
(5, 'Anne', 'Davies', 'GF', '1986-01-03', 1.60, 78.50, '07-77777756', 4),
(6, 'James', 'Hendrix', 'M', '1986-01-27', 1.60, 66.50, '06-7777777', 3);
go

select * from patients where patient_last_name = 'Doe';

select * from patients where gender != 'F';

select patient_first_name, patient_last_name, [weight] from patients where [weight] > 66.50;

select * from patients where height between 1.71 and 1.99;

select * from patients where patient_first_name like '%e%';

update patients 
	set [weight] = 79.00	
	where patient_id = 1
	go

select * from patients where patient_id = 1

select avg([weight]) [average weight of all patients] from patients;

