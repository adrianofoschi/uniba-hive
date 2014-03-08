CREATE TABLE multistar.f_tweet AS
SELECT
id AS status_id,
user.id AS user_id,
CONCAT(
year(from_unixtime(unix_timestamp(created_at,'EEE MMM d HH:mm:ss Z yyyy'))),'-',
month(from_unixtime(unix_timestamp(created_at,'EEE MMM d HH:mm:ss Z yyyy'))),'-',
day(from_unixtime(unix_timestamp(created_at,'EEE MMM d HH:mm:ss Z yyyy')))
) AS date_id,
hotspot AS hotspot_id
FROM local.tweets;