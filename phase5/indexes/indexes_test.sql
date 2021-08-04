vacuum (analyze);
set enable_seqscan=off;


explain analyze
select R.id, R.beds,R.bed_type,R.price
from "Room" as R
join "Location" as L
on L.id = R.id
where L.neighbourhood_cleansed = 'ΠΕΤΡΑΛΩΝΑ' and R.bed_type = 'Real Bed' and R.beds = 3;


explain analyze
select "Price".id, "Price".cleaning_fee
from "Price"
full outer join "Calendar"
on "Calendar".listing_id = "Price".id 
where "Calendar".available = true and "Calendar".date = '2020-03-18';


explain analyze
select "Location".neighbourhood, count("Host".id) as number_of_hosts
from "Location"
join "Host"
on "Host".neighbourhood = "Location".neighbourhood
group by "Location".neighbourhood
having count("Host".id) > 100000
order by number_of_hosts;


explain analyze
select avg(cast("Listing-copy".review_scores_rating as int)) as avg_rating, "Location".neighbourhood	
from "Listing-copy"
join "Price"
on "Listing-copy".id = "Price".id
join "Location"
on "Location".id = "Price".id
group by "Location".neighbourhood
having avg("Price".price) > 60;


explain analyze
select "Geolocation".properties_neighbourhood, count("Location".id) as number_of_listings, "Geolocation".properties_neighbourhood_group
from "Location"
full outer join "Geolocation"
on "Geolocation".properties_neighbourhood = "Location".neighbourhood_cleansed
where "Geolocation".properties_neighbourhood  = 'ΓΟΥΒΑ' or "Geolocation".properties_neighbourhood = 'ΓΚΑΖΙ' or "Geolocation".properties_neighbourhood = 'ΘΗΣΕΙΟ'
group by  "Geolocation".properties_neighbourhood;