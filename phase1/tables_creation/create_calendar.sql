create table "Calendar"(
   listing_id int,
   date date,
   PRIMARY KEY (listing_id,date),
   available boolean,
   price varchar(10),
   adjusted_price varchar(10),
   minimum_nights int,
   maximum_nights int
);