/*what is the cheapest appartment of each neighbourhood (45 results)*/
select "neighbourhoods".neighbourhood, min("listings_summary".price) as min_price
from "listings_summary"
join "neighbourhoods"
on "listings_summary".neighbourhood = "neighbourhoods".neighbourhood
group by "neighbourhoods".neighbourhood;


/*last review for each appartment (9003 results)*/
select "listings".id, "listings".last_review, "reviews".comments
from "listings"
full outer join "reviews"
on "listings".id = "reviews".listing_id
where "listings".last_review = cast("reviews".date as varchar) and "listings".id = "reviews".listing_id;


/*what is the geolocation of each appartment compeared to its price (11541 results)*/
select "listings_summary".id, "listings_summary".price, "geolocation".*
from "listings_summary"
join "geolocation"
on "geolocation".properties_neighbourhood = "listings_summary".neighbourhood;


/*what are the comments about each host and their appartment (416617 results)*/
select "listings".host_name, "listings".id ,"reviews".comments
from "listings"
full outer join "reviews"
on "listings".id = "reviews".listing_id
group by "listings".host_name, "listings".id ,"reviews".comments;


/*what are the reviews of the appartents at gkazi (5223 results)*/
select "listings".id, "listings".description, "reviews".comments
from "listings"
full outer join "reviews"
on "listings".id = "reviews".listing_id 
where "listings".neighbourhood_cleansed = 'ΓΚΑΖΙ';


/*what are the 85 appartments in gkazi in which one can stay in the longest (85 results)*/
select distinct "listings".id, "calendar".maximum_nights
from "listings"
join "calendar"
on "listings".id = "calendar".listing_id 
where "listings".neighbourhood_cleansed = 'ΓΚΑΖΙ' 
order by "calendar".maximum_nights desc
limit 85


/*what are the maximum nigths at each fully furnished appartment acording to its description (347 results)*/
select "listings".id, "listings".description, max("calendar".maximum_nights) as maximum_nights
from "listings"
join "calendar"
on "listings".id = "calendar".listing_id
where "listings".description like '%fully furnished%'
group by "listings".id, "listings".description


/*at which dates each appartment with a price from 30 to 50 is available (1087428 results)*/ 
select "calendar".date_ , "listings_summary".price, "listings_summary".id
from "listings_summary"
join "calendar"
on "listings_summary".id = "calendar".listing_id
where ("listings_summary".price between 30 and 50) and ("calendar".available = true);

 
/*what are maximun and minmum nights that one can stay in each neighbourhood (45 results)*/
select distinct  "listings".neighbourhood_cleansed,max("calendar".maximum_nights) as max_nights, min("calendar".maximum_nights) as min_nights
from "listings"
join "calendar"
on "listings".id = "calendar".listing_id
group by "listings".neighbourhood_cleansed ;

/*which are the apartments that cost less than 100, are available and where are they located in (9163 results)*/
select distinct "listings_summary".id,"listings_summary".price,"listings_summary".neighbourhood
from "calendar"
join "listings_summary"
on "listings_summary".id = "calendar".listing_id 
where ("listings_summary".price < 100) and ("calendar".available = true)
order by "listings_summary".price ;


/*what is the average price in each neibourhood (45 results)*/
select "neighbourhoods".neighbourhood, avg("listings_summary".price) as avg_price
from "neighbourhoods"
join "listings_summary"
on "listings_summary".neighbourhood = "neighbourhoods".neighbourhood
group by "neighbourhoods".neighbourhood;


/*what the first 5 reviewers that wrote about apartment 10990 and what did they commented (5 results)*/
select "reviews".reviewer_name, "reviews".comments
from "reviews"
where "reviews".listing_id = 10990
limit 5 ;
