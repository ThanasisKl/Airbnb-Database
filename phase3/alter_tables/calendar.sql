UPDATE "Calendar" SET price = REPLACE(price, '$','');
UPDATE "Calendar" SET price = REPLACE(price, ',','');

UPDATE "Calendar" SET adjusted_price = REPLACE(adjusted_price, '$','');
UPDATE "Calendar" SET adjusted_price = REPLACE(adjusted_price, ',','');



alter table "Calendar"
alter column price type float USING price::double precision;

alter table "Calendar"
alter column adjusted_price type float USING adjusted_price::double precision;

alter table "Calendar"
alter column available type boolean;