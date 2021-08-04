create table "Location" as select distinct id, street, neighbourhood, neighbourhood_cleansed, city,
 	state, zipcode, market, smart_location, country_code, country, latitude, longitude, is_location_exact
from "Listings";


alter table "Location"
add foreign key (id) references "Listings"(id);


alter table "Listings"
drop constraint "listings_neighbourhood_cleansed_fkey";

alter table "Location"
add foreign key (neighbourhood_cleansed) references "Neighborhoods"(neighbourhood);


alter table "Listings"
drop column street; 

alter table "Listings"
drop column neighbourhood; 

alter table "Listings"
drop column neighbourhood_cleansed; 

alter table "Listings"
drop column city; 

alter table "Listings"
drop column state; 

alter table "Listings"
drop column zipcode; 

alter table "Listings"
drop column market; 

alter table "Listings"
drop column smart_location; 

alter table "Listings"
drop column country_code; 

alter table "Listings"
drop column country; 

alter table "Listings"
drop column latitude; 

alter table "Listings"
drop column longitude; 

alter table "Listings"
drop column is_location_exact; 