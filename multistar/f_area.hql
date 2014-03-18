CREATE TABLE multistar.f_area AS
SELECT DISTINCT
hotspot_id,
id AS place_id,
rating,
price_level,
harvesinedistance(geometry.location.lat, geometry.location.lng,
 SPLIT(hotspot_id,',')[0], SPLIT(hotspot_id,',')[1]
) AS distance
FROM local.places
WHERE
 hotspot_id IS NOT NULL AND
 id IS NOT NULL;