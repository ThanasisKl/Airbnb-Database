create function listings_update_func()
returns trigger as 
$$
begin
if TG_OP = 'DELETE' then
    update "Host"
    set listings_count = listings_count - 1
    where OLD.host_id = "Host".id;
	return OLD;
elsif TG_OP = 'INSERT' then
    update "Host"
    set listings_count = listings_count + 1
    where NEW.host_id = "Host".id;
	return NEW;
end IF;
end;
$$ language plpgsql;

create trigger listings_update_trig
after INSERT or DELETE
on "Listing-copy"
for each row
execute procedure listings_update_func();



/*when a price is updated in room it is also updated in price*/

create function price_update_func()
returns trigger as 
$$
begin

update "Price"
set price = cast(
		(select REPLACE(		
			(select REPLACE("Room".price, ',','') as varprice2 
	 		from "Room"
			where "Room".id = "Price".id)											
		, '$','') as varprice 
	 	from "Room"
		where "Room".id = "Price".id)
as double precision);

return NEW;
end;
$$ language plpgsql;

create trigger price_update_trig
after UPDATE
on "Room"
for each row
execute procedure price_update_func();