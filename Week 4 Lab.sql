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
    id INT PRIMARY KEY,
    film_name VARCHAR(255) NOT NULL,
    director_id INT,
    FOREIGN KEY (director_id) REFERENCES directors(id)
);