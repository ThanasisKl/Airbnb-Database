create table "Reviews"(
   listing_id int,
   id int,
   PRIMARY KEY(id),
   date date,
   reviewer_id int,
   reviewer_name varchar(50),
   comments text
);