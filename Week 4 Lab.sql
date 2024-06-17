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

create table characters (
	actor_id int,
	film_id int,
	character_name varchar(255) not null,
	primary key (actor_id, film_id),
	foreign key (actor_id) references actors(id),
	foreign key (film_id) references films(id)
);