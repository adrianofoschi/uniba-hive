SELECT h.addresses, COUNT(*)
FROM f_tweet f
JOIN d_user u ON (f.user_id = u.id AND u.lang<>'it')
JOIN d_date d ON (f.date_id = d.id AND d.month=3 AND d.year=2014)
JOIN d_hotspot h ON (f.hotspot_id = h.id)
GROUP BY h.addresses;