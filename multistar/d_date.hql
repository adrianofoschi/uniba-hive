CREATE TABLE multistar.d_date AS
SELECT DISTINCT
CONCAT(
year(from_unixtime(unix_timestamp(created_at,'EEE MMM d HH:mm:ss Z yyyy'))),'-',
month(from_unixtime(unix_timestamp(created_at,'EEE MMM d HH:mm:ss Z yyyy'))),'-',
day(from_unixtime(unix_timestamp(created_at,'EEE MMM d HH:mm:ss Z yyyy')))) AS id,
day(from_unixtime(unix_timestamp(created_at,'EEE MMM d HH:mm:ss Z yyyy'))) AS day,
month(from_unixtime(unix_timestamp(created_at,'EEE MMM d HH:mm:ss Z yyyy'))) AS month,
year(from_unixtime(unix_timestamp(created_at,'EEE MMM d HH:mm:ss Z yyyy'))) AS year
FROM local.tweets;