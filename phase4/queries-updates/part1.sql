create table "Amenity" as(
select distinct amenity_name
from "Room"
cross join regexp_split_to_table("Room".amenities , ',') as amenity_name);

update "Amenity" set amenity_name = replace(amenity_name, '{','');
update "Amenity" set amenity_name = replace(amenity_name, '"','');
update "Amenity" set amenity_name = replace(amenity_name, '}','');

alter table "Amenity"
add column amenity_id SERIAL primary key ;


create table "Amenities-Rooms" as(
select amenity_id, "Room".id
from "Amenity"
join "Room" 
on "Room".amenities like '%' || "Amenity".amenity_name || '%');

alter table "Room"
drop column amenities;

alter table "Amenities-Rooms"
add foreign key (amenity_id) references "Amenity"(amenity_id);