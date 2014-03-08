CREATE TABLE multistar.d_hotspot AS
SELECT
CONCAT(latitude,',',longitude) AS id,
latitude,
longitude,
collect_set(address) as addresses,
comune
FROM local.hotspots
GROUP BY latitude,longitude,comune;