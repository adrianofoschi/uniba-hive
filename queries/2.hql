SELECT h.addresses, count(fa.place_id) AS total
FROM f_area fa 
JOIN d_hotspot h ON fa.hotspot_id = h.id
GROUP BY h.addresses
ORDER BY total DESC;