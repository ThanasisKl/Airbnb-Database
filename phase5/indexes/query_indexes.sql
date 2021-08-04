/* Query 1: w/out index: 634.537 ms; w/index: 22.837 ms */
create index intex_1 on "Listing"
(host_id, id);


/* Query 2: w/out index: 2110.981 ms; w/index(no price): 1952.028 ms ; w/index(with price): 1938.490 ms
when we include price in the index it is faster because we can limit even more the where condition*/
/*create index intex_2 on "Price"
(id, guests_included)
where guests_included > 5;*/
create index intex_2 on "Price"
(id, guests_included, price)
where guests_included > 5 and price > 40;



/*Our Query 1: w/out index: 531.0277 ms; w/index: 11.308 ms 
we use the main part of the where condition in our query*/
create index our_intex_1 on "Room"
(bed_type, beds)
where bed_type = 'Real Bed' and beds = 3;

/*Our Query 2: w/out index: 13666.008 ms; w/index: 30.893 ms
We base the index on the where condition of the query greatly decreasing the amount of cells we need to check*/
create index our_intex_2 on "Calendar"
(available, date)
where available = true and date = '2020-03-18';

/*Our Query 3: w/out index: 2694.635 ms w/index: 1764.038 ms*/
create index our_intex_3_1 
on "Host" 
(id, neighbourhood);

create index our_intex_3_2 
on "Location" 
(neighbourhood);

/*Our Query 4: w/out index: 77.618 ms; w/index: 33.031 ms */
create index our_intex_4_1 
on "Price" 
(id,price);

create index our_intex_4_2 
on "Listing" 
(id,review_scores_rating);

create index our_intex_4_3 
on "Location" 
(id,neighbourhood);

/*Our Query 5: w/out index: 22.185 ms; w/index: 21.951 ms 
The index is based on the where condition of the query*/
create index our_intex_5 on "Geolocation"
(properties_neighbourhood)
where properties_neighbourhood  = 'ΓΟΥΒΑ' or properties_neighbourhood = 'ΓΚΑΖΙ' or properties_neighbourhood = 'ΘΗΣΕΙΟ';