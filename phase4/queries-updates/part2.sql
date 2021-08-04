/*price and bed type of rooms ΠΕΤΡΑΛΩΝΑ with 3 beds in rows : 50*/
select R.id, R.beds,R.bed_type,R.price
from "Room" as R
join "Location" as L
on L.id = R.id
where L.neighbourhood_cleansed = 'ΠΕΤΡΑΛΩΝΑ' and R.bed_type = 'Real Bed' and R.beds = 3;


/*price of cleaning fee of each appartment available at 2020-03-18 rows : 5645*/
select "Price".id, "Price".cleaning_fee
from "Price"
full outer join "Calendar"
on "Calendar".listing_id = "Price".id 
where "Calendar".available = true and "Calendar".date = '2020-03-18';


/*which neighbourhoods have more than 100000 hosts rows : 10*/
select "Location".neighbourhood, count("Host".id) as number_of_hosts
from "Location"
join "Host"
on "Host".neighbourhood = "Location".neighbourhood
group by "Location".neighbourhood
having count("Host".id) > 100000
order by number_of_hosts;



/*the average rating at neighbourhoods with average price greater than 60 rows : 13*/
select avg(cast("Listing".review_scores_rating as int)) as avg_rating, "Location".neighbourhood	
from "Listing"
join "Price"
on "Listing".id = "Price".id
join "Location"
on "Location".id = "Price".id
group by "Location".neighbourhood
having avg("Price".price) > 60;



/*the neighbourhood group and number of appartments of ΓΟΥΒΑ, ΓΚΑΖΙ and ΘΗΣΕΙΟ rows : 3*/
select "Geolocation".properties_neighbourhood, count("Location".id) as number_of_listings, "Geolocation".properties_neighbourhood_group
from "Location"
full outer join "Geolocation"
on "Geolocation".properties_neighbourhood = "Location".neighbourhood_cleansed
where "Geolocation".properties_neighbourhood  = 'ΓΟΥΒΑ' or "Geolocation".properties_neighbourhood = 'ΓΚΑΖΙ' or "Geolocation".properties_neighbourhood = 'ΘΗΣΕΙΟ'
group by  "Geolocation".properties_neighbourhood;