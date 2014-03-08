CREATE TABLE f_area AS
SELECT hotspot_id, place_id, 1/(distance*(sum(1/distance))) OVER (PARTITION BY hotspot_id) AS w_factor
FROM (
 SELECT
 hotspot AS hotspot_id,
 id AS place_id,
 rating,
 price_level,
 harvesinedistance(
  geometry.location.lat,
  geometry.location.lng,
  SPLIT(hotspot,',')[0],
  SPLIT(hotspot,',')[1]
 ) AS distance
 FROM source.places
) t;