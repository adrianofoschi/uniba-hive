CREATE TABLE multistar.d_hotspot AS
SELECT DISTINCT
CONCAT(latitude,',',longitude) AS id,
latitude,
longitude,
address,
comune
FROM local.hotspots
WHERE latitude IS NOT NULL AND longitude IS NOT NULL;