create table project."Temp" as
select unnest (string_to_array(genres,'}')) as id_name
from project."Movies_Metadata";

delete 
from project."Temp"
where id_name like '%]%';

UPDATE project."Temp"
SET id_name = replace(id_name,', {',' ');

create table project."Genres" as 
select split_part(id_name,',',1) as id,
       split_part(id_name,',',2) as name
from project."Temp";

drop table project."Temp";

update project."Genres" set id = replace(id,'[{','');

update project."Genres" set id = replace(id,'id','');

update project."Genres" set id = replace(id,'''','');

update project."Genres" set id = replace(id,':','');

update project."Genres" set id = replace(id,' ','');

update project."Genres" set name = replace(name,'name','');

update project."Genres" set name = replace(name,':','');

update project."Genres" set name = replace(name,'''','');

update project."Genres" set id = replace(id,' ','');

alter table project."Genres"
alter column id type int using id::integer;
	
alter table project."Genres"
alter column name type char(30);

create table project."Temp2" as
select distinct id,name
from project."Genres";

drop table project."Genres";

alter table project."Temp2" rename to "Genres";   --Genres it's a table that contains all the possible movie categories and their id.Genres helps us with some queries.

--query 1
select extract(year from release_date) as year, count(*) as number_of_movies
from project."Movies_Metadata"
group by  extract(year from release_date)
order by extract(year from release_date);

--query 2
select name,count(genres) as number_of_movies
from project."Movies_Metadata" as m
join project."Genres" as g
on m.genres like '%' || cast(g.id as char(10)) || '%'
group by name;

--query 3
select extract (year from release_date) as year, name as category , count(*) as number_of_movies
from project."Movies_Metadata" as m, project."Genres" as g
where m.genres like '%' || cast(g.id as char(10)) || '%'
group by year,name;

--query 4
select name as category,avg(cast(rating as float)) as average_rating
from project."Movies_Metadata" as m,project."Ratings" as r,project."Genres" as g
where m.genres like '%' || cast(g.id as char(10)) || '%' and m.id = r.movieId
group by name;

--query 5
select userid, count(userid) as number_of_ratings
from project."Ratings"
group by userid
order by userid;

--query 6
select userid, avg(cast(rating as float)) as average_rating
from project."Ratings"
group by userid
order by userid;

--view
create view project."view" as
select userid, count(rating) as number_of_ratings, avg(cast(rating as float)) as average_rating
from project."zRatings"
group by userid;

drop table project."Genres";