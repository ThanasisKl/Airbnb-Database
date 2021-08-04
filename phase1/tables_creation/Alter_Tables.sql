ALTER TABLE "Calendar" ADD FOREIGN KEY (listing_id) REFERENCES "Listings"(id);
ALTER TABLE "Listings-Summary" ADD FOREIGN KEY (id) REFERENCES "Listings"(id);
ALTER TABLE "Reviews" ADD FOREIGN KEY (listing_id) REFERENCES "Listings"(id);
ALTER TABLE "Reviews-Summary" ADD FOREIGN KEY (listing_id) REFERENCES "Listings"(id);
ALTER TABLE "Listings-Summary" ADD FOREIGN KEY (neighbourhood) REFERENCES "Neighbourhoods"(neighbourhood);
ALTER TABLE "Geolocation" ADD FOREIGN KEY (properties_neighbourhood) REFERENCES "Neighbourhoods"(neighbourhood);
ALTER TABLE "Listings" ADD FOREIGN KEY (neighbourhood_cleansed) REFERENCES "Neighbourhoods"(neighbourhood);