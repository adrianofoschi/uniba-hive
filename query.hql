/* 
1. Query in 3 dimensioni (1:N)
   Numero di tweet: di utenti italiani, nel mese di febbraio 2014, raggruppati per comune
*/
SELECT h.comune, count(*)
FROM f_tweet f
JOIN d_user u ON (f.user_id = u.id AND u.lang='it')
JOIN d_date d ON (f.date_id = d.id AND d.month=2 AND d.year=2014)
JOIN d_hotspot h ON (f.hotspot_id = h.id)
GROUP BY h.comune;

/*
2. Query attraverso più fatti
   Analisi dei tweet con i posti effettuando una join per la stessa chiave (dh.id)
*/
SELECT status_id, comune, name 
FROM f_tweet ft
JOIN d_hotspot dh ON ft.hotspot_id = dh.id
JOIN f_area fa ON fa.hotspot_id = dh.id
JOIN d_place dp ON fa.place_id = dp.id;

/*
3. Analizziamo i place che hanno dato un contributo
   maggiore alla popolarità del tweet
*/
SELECT dp.name, SUM(status_retweet_count*fa.w_factor)
FROM f_tweet ft
JOIN d_hotspot dh ON ft.hotspot_id = dh.id
JOIN f_area fa ON fa.hotspot_id = dh.id
JOIN d_place dp ON fa.place_id = dp.id
GROUP BY dp.name;

-- Stessa query con weighting factor
-- Mostriamo come queste due query restituiscono il medesimo risultato
SELECT ft.date_id, ft.hotspot_id, SUM(status_favorite_count*fa.w_factor)
FROM f_tweet ft
JOIN d_hotspot dh ON ft.hotspot_id = dh.id
JOIN f_area fa ON fa.hotspot_id = dh.id
JOIN d_place dp ON fa.place_id = dp.id
GROUP BY ft.date_id, ft.hotspot_id;

SELECT ft.date_id, ft.hotspot_id, SUM(status_favorite_count)
FROM f_tweet ft
JOIN d_hotspot dh ON ft.hotspot_id = dh.id
GROUP BY ft.date_id, ft.hotspot_id;

/*
4. Analizziamo i tweet in vicinanza di un
   un posto di tipo bar
*/
SELECT ft.status_id
FROM f_tweet ft
LEFT SEMI JOIN d_hotspot dh ON ft.hotspot_id = dh.id
JOIN f_area fa ON fa.hotspot_id = dh.id
JOIN d_place dp ON fa.place_id = dp.id
JOIN f_profile fp ON (fp.place_id = dp.id AND fp.type_id = 'bar'); 
