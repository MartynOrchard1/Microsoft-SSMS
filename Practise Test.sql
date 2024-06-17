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
	weight decimal(5,2),
	hm_phone varchar(25)
);