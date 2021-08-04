create table "Price" as select distinct id, price, weekly_price, monthly_price, security_deposit, cleaning_fee, guests_included, extra_people, minimum_nights, maximum_nights, minimum_minimum_nights, 
maximum_minimum_nights, minimum_maximum_nights, maximum_maximum_nights, minimum_nights_avg_ntm, maximum_nights_avg_ntm
from "Listings";


UPDATE "Price" SET price = REPLACE(price, '$','');
UPDATE "Price" SET price = REPLACE(price, ',','');

UPDATE "Price" SET weekly_price = REPLACE(weekly_price, '$','');
UPDATE "Price" SET weekly_price = REPLACE(weekly_price, ',','');

UPDATE "Price" SET monthly_price = REPLACE(monthly_price, '$','');
UPDATE "Price" SET monthly_price = REPLACE(monthly_price, ',','');

UPDATE "Price" SET security_deposit = REPLACE(security_deposit, '$','');
UPDATE "Price" SET security_deposit = REPLACE(security_deposit, ',','');

UPDATE "Price" SET cleaning_fee = REPLACE(cleaning_fee, '$','');
UPDATE "Price" SET cleaning_fee = REPLACE(cleaning_fee, ',','');

UPDATE "Price" SET extra_people = REPLACE(extra_people, '$','');
UPDATE "Price" SET extra_people = REPLACE(extra_people, ',','');



alter table "Price"
alter column price type float USING price::double precision;

alter table "Price"
alter column  weekly_price type float USING weekly_price::double precision;

alter table "Price"
alter column monthly_price type float USING monthly_price::double precision;

alter table "Price"
alter column security_deposit type float USING security_deposit::double precision;

alter table "Price"
alter column cleaning_fee type float USING cleaning_fee::double precision;

alter table "Price"
alter column minimum_nights_avg_ntm type float USING minimum_nights_avg_ntm::double precision;

alter table "Price"
alter column maximum_nights_avg_ntm type float USING maximum_nights_avg_ntm::double precision;

alter table "Price"
alter column extra_people type float USING extra_people::double precision;





alter table "Listings"
drop column price; 

alter table "Listings"
drop column weekly_price; 

alter table "Listings"
drop column monthly_price; 

alter table "Listings"
drop column security_deposit; 

alter table "Listings"
drop column cleaning_fee; 

alter table "Listings"
drop column guests_included; 

alter table "Listings"
drop column extra_people; 

alter table "Listings"
drop column minimum_nights; 

alter table "Listings"
drop column maximum_nights; 

alter table "Listings"
drop column minimum_minimum_nights; 

alter table "Listings"
drop column maximum_minimum_nights; 

alter table "Listings"
drop column minimum_maximum_nights; 

alter table "Listings"
drop column maximum_maximum_nights; 

alter table "Listings"
drop column minimum_nights_avg_ntm; 

alter table "Listings"
drop column maximum_nights_avg_ntm; 


alter table "Price"
add foreign key (id) references "Listings"(id);