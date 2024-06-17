use [master]
go

create table directors (
	 id int primary key,
	 director varchar(255) not null
);

create table actors (
	id int primary key,
	actor_name varchar(255) not null
);

create table films (
	id int primary key,
	film_name varchar(255) not null
	director_id int,
	foreign key (director_id) references directors(id)


);