CREATE TABLE multistar.d_place AS 
SELECT DISTINCT
id,
name,
CAST(geometry.location.lat AS DOUBLE) as latitude,
CAST(geometry.location.lng AS DOUBLE) as longitude,
vicinity,
types,
formatted_address
FROM local.places
WHERE id IS NOT NULL;