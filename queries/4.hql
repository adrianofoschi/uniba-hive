SELECT pt.type, COUNT(ft.status_id)
FROM f_tweet ft
JOIN f_area fa ON ft.hotspot_id = fa.hotspot_id
JOIN (
 SELECT id, type
 FROM d_place p LATERAL VIEW explode(p.types) tTable AS type
) pt ON pt.id = fa.place_id
GROUP BY pt.type;