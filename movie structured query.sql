drop table  movie  cascade constraints;
drop table  company  cascade constraints;
drop table  director  cascade constraints;
drop table  actor cascade constraints;
drop table  quotes   cascade constraints;
drop table  directed_by  cascade constraints;
drop table  produces  cascade constraints;
drop table  acts_in  cascade constraints;
drop table  genere  cascade constraints;


create table company
(
pname varchar(20),
address varchar(50),
pn int,
primary key(pname)
);
insert into company values('YRF','98 vidyanagar hubballi',4563256381);
insert into company values('T-series','#100 rajnagar Bangalore',6548464516);
insert into company values('Hombale','#45 Gandhinagar Bangalore',6584848553);
insert into company values('Aditya movies','hydrabad ',4563256381);

select * from company;

create table  movie
(
yr number,
title varchar(20),
len number,
budget number,
col number,
pname varchar(20),
primary key(yr,title),
foreign key (pname) references company (pname)
);

insert into movie values(2001,'don',150,50,60,'YRF');
insert into movie values(2003,'KGF',200,80,200,'Hombale');
insert into movie values(1985,'gabbar',100,50,20,'T-series');
insert into movie values(2021,'pushpa',170,100,300,'Aditya movies');
insert into movie values(2009,'kurup',250,15,45,'YRF');
insert into movie values(2019,'war',120,300,201,'YRF');
insert into movie values(2009,'tempor',150,10,25,'Aditya movies');

select * from movie;




create table genere
(
type varchar (20),
title varchar(20),
yr number ,
foreign key (yr,title) references movie(yr,title)
);

insert into genere values('action','don',2001);
insert into genere values('action','war',2019);
insert into genere values('comidy','gabbar',1985);
insert into genere values('action','KGF',2003);
insert into genere values('thriller','kurup',2009);
insert into genere values('emotional','tempor',2009);

select * from genere;
create table director 
(
dname varchar(20),
ddob date,
dnum number,
primary key (dname ,ddob)
);


insert into director values ('rohit shetty','23-06-1962',25);
insert into director values ('rajmouli','15-03-1982',30);
insert into director values ('prashant neel','15-11-1992',15);
insert into director values ('bhansali','20-06-2002',35);
insert into director values ('prabhu dev','29-06-1972',10);

select * from director;



create table actor
(
aname varchar(20),
adob date ,
anum int,
primary key(aname,adob)
);

insert into actor values ('allu arjun','23-06-1989',35);
insert into actor values ('yash','19-05-1977',32);
insert into actor values ('rajanikanth','25-07-194745',22);
insert into actor values ('prabhas','06-02-1989',32);
insert into actor values ('thalapaty vijay','23-02-1975',19);
insert into actor values ('vijay devarkonda','16-06-2001',15);
insert into actor values ('darshan nayak','06-06-2002',21);
insert into actor values ('prabhu dev','29-06-72',1);
select * from actor;

create table quotes
(
qname varchar(20),
aname varchar(20),
adob date,
title varchar(20),
yr number,
foreign key(aname,adob) references actor(aname,adob)
);

 create table directed_by
(
dname varchar(20),
ddob date,
yr number,
title varchar(20),
foreign key(dname,ddob) references director (dname,ddob),
foreign key(yr,title) references movie(yr,title)
);
select * from movie;
insert into directed_by values('rajmouli','15-03-1982',2001,'don');
insert into directed_by values('rajmouli','15-03-1982',2009,'kurup');
insert into directed_by values('rohit shetty','23-06-1962',2003,'KGF');
insert into directed_by values('prabhu dev','29-06-1972',1985,'gabbar');
insert into directed_by values('prashant neel','15-11-1992',2019,'war');
insert into directed_by values('rajmouli','15-03-1982',2021,'pushpa');

select * from directed_by;

create table produces 
(
pname varchar(20),
title varchar(20),
yr number,
foreign key(pname) references company (pname),
foreign key(yr,title)  references movie (yr,title)
);
 select * from company;
 select* from movies
 
insert into produces values('',

create table acts_in
(
aname varchar(20),
adob date ,
yr number,
title varchar(20),
foreign key(aname,adob) references actor (aname,adob),
foreign key(yr,title)  references movie (yr,title)
);


create table acts_in
(
aname varchar(20),
adob date,
yr number,
title varchar(20),
foreign key (aname,adob) references actor(aname,adob),
foreign key(yr,title) references movie(yr,title)
);
select * from actor;
select * from movie;

insert into acts_in values('allu arjun','23-06-89',2021,'pushpa');
insert into acts_in values('yash','19-05-1977',2003,'KGF');
insert into acts_in values('prabhas','06-02-1989',2009,'kurup');
insert into acts_in values('thalapaty vijay','23-02-75',2009,'tempor');
insert into acts_in values('darshan nayak','06-06-02',2019,'war');
insert into acts_in values('prabhu dev','29-06-1972',1985,'gabbar');

select * from acts_in ;
select * from produces;

--simple

--1 retrive the names of movies having budget >100
select title 
from movie 
where budget>100;

--2  retrive  names of movies which have earned profit
select title 
from movie 
where budget<col;

--3  retrive the names of the movie and year of release of genere action
select title,yr
from genere
where type='action';
select * from directed_by;

--4 retrive title ,director ,actor,collectionand genere of movie
select title ,dname,aname
from movie m,acts_in a,directed_by d
where m.(yr,title)=a.(yr,title) and  m.(yr,title)=d.(yr,title);

-- 5 retrive the names of movie produced by YRF after 2000
select title 
from movie 
where pname='YRF' and yr>=2000;


--aggrigate
--1 retrive the total number of production companies
select count(*)
from company;

-- 2 retrive the movie with highest budget
select max(budget)
from movie;

--3 

--group by

--1  retrive the count of movie in each genere
select type,count(*)
from genere
group by type;

--2  retrive the total collection of each production company by all movies
select pname,sum(col)
from movie
group by pname;

select * from movie;

3-- retrive the total budget of each production company by all movies greater than 250 cr
select pname,sum(budget)
from movie
group by pname
having sum(budget)>250;
-- simple nesterd

--1 retrive the names of movie which have collected money greater than thae avg collection of all movies
select title 
from movie
where col >(
select avg(col)
from movie );

2-- retrive names of directors who act in movies

select dname
from director
where dname in(
select aname 
from actor
);

3--retrive the name and year of movie which have collected then the avg collection of all movies;
select title ,yr,col
from movie 
where col>(
select avg (col)
from movie );




--1 retrive the movie of genere on which more than 1 movies are made and have director with more than 20 movies


4-- retrive names of actor who have worked in movie which was fop
select aname,adob
from acts_in
where title not in(
select title 
from movie 
where budget<col);

--5 retrive the name ,year and budget of 3rd highest budget movie
 
 select title,yr,budget
 from movie
 where budget=(
 select max(budget)
 from movie
 where budget<(
 select max(budget)
 from movie
 where budget<(
 select max(budget)
 from movie)));
 
 
 
 select title ,type ,len
 from movie m,genere g
 where m.title=g.title ;
