use [master]
go

drop table if exists directors;
drop table if exists actors;
drop table if exists films;
drop table if exists characters;

-- Create Tables
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

--Populate Tables
INSERT INTO directors (id, director) 
VALUES 
(1, 'Steven Spielberg'),
(2, 'David Ayer'),
(3, 'Clint Eastwood'),
(4, 'Ben Affleck');

INSERT INTO actors (id, actor_name)
VALUES 
(1, 'Roy Schneider'),
(2, 'Clint Eastwood'),
(3, 'Drew Barrymore');

INSERT INTO films (id, film_name, director_id) 
VALUES 
(1, 'Jaws', 1),
(2, 'E.T. the Extra-Terrestrial', 1),
(3, 'Unforgiven', 3);

INSERT INTO characters (actor_id, film_id, character_name) 
VALUES 
(1, 1, 'Brody'),
(1, 2, 'Quint'),
(3, 2, 'Gertie');

-- Exercise 1
select 
	films.film_name,
	directors.director
from films
inner join directors
on films.director_id = director_id;

-- Exercise 2
select 
directors.director,
films.film_name
from directors
left join films
on directors.id = films.director_id;

-- Exercise 3
select 
directors.director,
films.film_name
from directors
right join films
on directors.id = films.director_id;
