SELECT h.addresses, SUM(distance*price_level)/SUM(distance) AS avgp
FROM f_area fa 
JOIN d_hotspot h ON fa.hotspot_id = h.id AND fa.price_level IS NOT NULL
GROUP BY h.addresses
ORDER BY avgp;