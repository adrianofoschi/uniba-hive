/* HACK */
CREATE TABLE local.places1 AS  
SELECT id, name, geometry, types, price_level, rating, hotspot
FROM local.places;