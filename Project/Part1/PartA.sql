create table project."Ratings"(
   userId int,
   movieId int,
   rating varchar(10),
   timestamp int
);


create table project."Credits"(
   "cast" text,
   crew text,
   id int
);


create table project."Links"(
   movieId int,
   imdbId int,
   tmdbId int
);

create table project."Keywords"(
   id int,
   keywords text
);

create table project."Movies_Metadata"(
   adult varchar(10),
   belongs_to_collection varchar(190),
   budget int,
   genres varchar(270),
   homepage varchar(250),
   id int,
   imdb_id varchar(10),
   original_language varchar(10),
   original_title varchar(110),
   overview varchar(1000),
   popularity varchar(10),
   poster_path varchar(40),
   production_companies varchar(1260),
   production_countries varchar(1040),
   release_date date,
   revenue bigint,
   runtime varchar(10),
   spoken_languages varchar(770),
   status varchar(20),
   tagline varchar(300),
   title varchar(110),
   video varchar(10),
   vote_average varchar(10),
   vote_count int
);




create table project."Credits-copy"(
   id int,
   "cast" text,
   crew text
);

create table project."Links-copy"(
   movieId int,
   imdbId int,
   tmdbId int
);

create table project."Keywords-copy"(
   id int,
   keywords text
);

create table project."Movies_Metadata-copy"(
   id int,
   adult varchar(10),
   belongs_to_collection varchar(190),
   budget int,
   genres varchar(270),
   homepage varchar(250),
   imdb_id varchar(10),
   original_language varchar(10),
   original_title varchar(110),
   overview varchar(1000),
   popularity varchar(10),
   poster_path varchar(40),
   production_companies varchar(1260),
   production_countries varchar(1040),
   release_date date,
   revenue bigint,
   runtime varchar(10),
   spoken_languages varchar(770),
   status varchar(20),
   tagline varchar(300),
   title varchar(110),
   video varchar(10),
   vote_average varchar(10),
   vote_count int
);


insert into project."Credits-copy"
select distinct project."Credits".id
from  project."Credits";

insert into project."Links-copy"
select distinct project."Links".movieId
from  project."Links";

insert into project."Keywords-copy"
select distinct project."Keywords".id
from  project."Keywords";

insert into project."Movies_Metadata-copy"
select distinct project."Movies_Metadata".id
from  project."Movies_Metadata";



update project."Credits-copy"
set id = project."Credits-copy".id,
	"cast" = project."Credits"."cast",
	crew = project."Credits".crew
	from project."Credits"
where
	project."Credits-copy".id = project."Credits".id;
	

update project."Links-copy"
set movieId = project."Links".movieId,
   imdbId = project."Links".imdbId,
   tmdbId = project."Links".tmdbId
	from project."Links"
where
	project."Links-copy".movieId = project."Links".movieId;
	
	
update project."Keywords-copy"
set id = project."Keywords".id,
    keywords = project."Keywords".keywords
	from project."Keywords"
where
	project."Keywords-copy".id = project."Keywords".id;
	

update project."Movies_Metadata-copy"
set id = project."Movies_Metadata".id,
	adult  = project."Movies_Metadata".adult,
   belongs_to_collection  = project."Movies_Metadata".belongs_to_collection,
   budget  = project."Movies_Metadata".budget,
   genres  = project."Movies_Metadata".genres,
   homepage  = project."Movies_Metadata".homepage,
   imdb_id  = project."Movies_Metadata".imdb_id,
   original_language  = project."Movies_Metadata".original_language,
   original_title  = project."Movies_Metadata".original_title,
   overview  = project."Movies_Metadata".overview,
   popularity  = project."Movies_Metadata".popularity,
   poster_path  = project."Movies_Metadata".poster_path,
   production_companies  = project."Movies_Metadata".production_companies,
   production_countries  = project."Movies_Metadata".production_countries,
   release_date  = project."Movies_Metadata".release_date,
   revenue  = project."Movies_Metadata".revenue,
   runtime  = project."Movies_Metadata".runtime,
   spoken_languages = project."Movies_Metadata".spoken_languages,
   status  = project."Movies_Metadata".status,
   tagline  = project."Movies_Metadata".tagline,
   title  = project."Movies_Metadata".title,
   video  = project."Movies_Metadata".video,
   vote_average  = project."Movies_Metadata".vote_average,
   vote_count  = project."Movies_Metadata".vote_count
	from project."Movies_Metadata"
where
	project."Movies_Metadata-copy".id = project."Movies_Metadata".id;
	

drop table project."Credits";
drop table project."Keywords";
drop table project."Links";
drop table project."Movies_Metadata";


alter table project."Credits-copy"  rename to "Credits";
alter table project."Keywords-copy" rename to "Keywords";
alter table project."Links-copy" rename to "Links";
alter table project."Movies_Metadata-copy" rename to "Movies_Metadata";



delete 
from project."Credits"
where "Credits".id not in(select id
from project."Movies_Metadata");



delete 
from project."Links"
where "Links".movieId not in(select id
from project."Movies_Metadata");


delete 
from project."Keywords"
where "Keywords".id not in(select id
from project."Movies_Metadata");


delete 
from project."Ratings"
where "Ratings".movieId not in(select id
from project."Movies_Metadata");

alter table project."Credits" add primary key (id);
alter table project."Links" add primary key (movieId);
alter table project."Keywords" add primary key (id);
alter table project."Movies_Metadata" add primary key (id);
alter table project."Ratings" add primary key (movieId, userId);



alter table project."Credits" add foreign key(id) references project."Movies_Metadata"(id);
alter table project."Keywords" add foreign key(id) references project."Movies_Metadata"(id);
alter table project."Links" add foreign key(movieid) references project."Movies_Metadata"(id);
alter table  project."Ratings" add foreign key(movieid) references project."Movies_Metadata"(id);