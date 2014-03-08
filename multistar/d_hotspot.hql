CREATE TABLE d_hotspot AS
SELECT
CONCAT(latitude,',',longitude) AS id,
latitude,
longitude,
collect_set(address) as addresses,
comune
FROM source.hotspots
GROUP BY latitude,longitude,comune;