/* HACK */
CREATE TABLE source.places1 AS  
SELECT id, name, geometry, types, price_level, rating, hotspot
FROM source.places;