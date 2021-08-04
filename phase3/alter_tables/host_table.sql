create table "Host" as select distinct host_id, host_url, host_name, host_since, host_location, host_about, host_response_time, host_response_rate, host_acceptance_rate, host_is_superhost, host_thumbnail_url, host_picture_url, 
host_neighbourhood, host_listings_count, host_total_listings_count, host_verifications, host_has_profile_pic, 
host_identity_verified, calculated_host_listings_count
from "Listings";

alter table "Host"
rename column host_id to id; 

alter table "Host"
rename column host_url to url; 

alter table "Host"
rename column host_name to name; 

alter table "Host"
rename column host_since to since; 

alter table "Host"
rename column host_location to location; 

alter table "Host"
rename column host_about to about; 

alter table "Host"
rename column host_response_time to response_time; 

alter table "Host"
rename column host_response_rate to response_rate; 

alter table "Host"
rename column host_acceptance_rate to acceptance_rate; 

alter table "Host"
rename column host_is_superhost to is_superhost; 

alter table "Host"
rename column host_thumbnail_url to thumbnail_url; 

alter table "Host"
rename column host_picture_url to picture_url; 

alter table "Host"
rename column host_neighbourhood to neighbourhood; 

alter table "Host"
rename column host_listings_count to listings_count; 

alter table "Host"
rename column host_total_listings_count to total_listings_count; 

alter table "Host"
rename column host_verifications to verifications; 

alter table "Host"
rename column host_has_profile_pic to has_profile_pic; 

alter table "Host"
rename column host_identity_verified to identity_verified; 

alter table "Host"
rename column calculated_host_listings_count to calculated_listings_count; 







alter table "Listings"
drop column host_url; 

alter table "Listings"
drop column host_name; 

alter table "Listings"
drop column host_since; 

alter table "Listings"
drop column host_location; 

alter table "Listings"
drop column host_about; 

alter table "Listings"
drop column host_response_time; 

alter table "Listings"
drop column host_response_rate; 

alter table "Listings"
drop column host_acceptance_rate; 

alter table "Listings"
drop column host_is_superhost; 

alter table "Listings"
drop column host_thumbnail_url; 

alter table "Listings"
drop column host_picture_url; 

alter table "Listings"
drop column host_neighbourhood; 

alter table "Listings"
drop column host_listings_count; 

alter table "Listings"
drop column host_total_listings_count; 

alter table "Listings"
drop column host_verifications; 

alter table "Listings"
drop column host_has_profile_pic; 

alter table "Listings"
drop column host_identity_verified; 

alter table "Listings"
drop column calculated_host_listings_count; 

alter table "Host"
add primary key (id);

alter table "Listings"
add foreign key (host_id) references "Host"(id);