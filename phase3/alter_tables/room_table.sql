create table "Room" as select distinct id, accommodates, bathrooms, bedrooms, beds, bed_type, amenities,
	square_feet, price, weekly_price, monthly_price, security_deposit
from "Listings";


alter table "Listings"
drop column accommodates; 

alter table "Listings"
drop column bathrooms; 

alter table "Listings"
drop column bedrooms; 

alter table "Listings"
drop column beds; 

alter table "Listings"
drop column bed_type; 

alter table "Listings"
drop column amenities; 

alter table "Listings"
drop column square_feet; 

alter table "Listings"
drop column price; 

alter table "Listings"
drop column weekly_price; 

alter table "Listings"
drop column monthly_price; 

alter table "Listings"
drop column security_deposit; 


alter table "Room"
add foreign key (id) references "Listings"(id);