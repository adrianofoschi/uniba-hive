-- extensions
ADD JAR /root/extensions/Hive-JSON-Serde/target/json-serde-1.1.9.2-SNAPSHOT.jar;
ADD JAR /root/extensions/uniba-udfs/target/hive-extensions-1.0-SNAPSHOT.jar;
CREATE TEMPORARY FUNCTION harvesinedistance AS 'com.uniba.udfs.UDFHaversineDistance';

-- fact tweet
CREATE TABLE f_tweet AS
SELECT
id AS status_id,
user.id AS user_id,
CONCAT(
year(from_unixtime(unix_timestamp(created_at,'EEE MMM d HH:mm:ss Z yyyy'))),'-',
month(from_unixtime(unix_timestamp(created_at,'EEE MMM d HH:mm:ss Z yyyy'))),'-',
day(from_unixtime(unix_timestamp(created_at,'EEE MMM d HH:mm:ss Z yyyy')))
) AS date_id,
hotspot AS hotspot_id,
favorite_count AS status_favorite_count,
retweet_count AS status_retweet_count,
user.statuses_count AS user_statuses_count,
user.favourites_count AS user_favourites_count,
user.followers_count AS user_followers_count,
user.listed_count AS user_listed_count,
user.friends_count AS user_friends_count
FROM source.tweets;

-- fact entity
CREATE TABLE f_entity AS
SELECT
id AS status_id,
hashtag_id,
size(entities.hashtags.text) AS total
FROM source.tweets LATERAL VIEW explode(entities.hashtags.text) hTable AS hashtag_id;

-- fact profile
CREATE TABLE f_profile AS
SELECT
id AS place_id,
type_id,
size(types) AS total
FROM source.places LATERAL VIEW explode(types) tTable AS type_id;

-- fact area
-- weighting factor basato sulla distanza dall'hotspot
CREATE TABLE f_area AS
SELECT hotspot_id, place_id, 1/(distance*(sum(1/distance))) OVER (PARTITION BY hotspot_id) AS w_factor
FROM (
 SELECT
 hotspot AS hotspot_id,
 id AS place_id,
 harvesinedistance(
  geometry.location.lat,
  geometry.location.lng,
  SPLIT(hotspot,',')[0],
  SPLIT(hotspot,',')[1]
 ) AS distance
 FROM source.places
) t;

-- dimension status
CREATE TABLE d_status AS
SELECT
id,
lang,
source,
text,
truncated,
favorited,
retweeted
FROM source.tweets;

-- dimension date
CREATE TABLE d_date AS
SELECT DISTINCT
CONCAT(
year(from_unixtime(unix_timestamp(created_at,'EEE MMM d HH:mm:ss Z yyyy'))),'-',
month(from_unixtime(unix_timestamp(created_at,'EEE MMM d HH:mm:ss Z yyyy'))),'-',
day(from_unixtime(unix_timestamp(created_at,'EEE MMM d HH:mm:ss Z yyyy')))) AS id,
day(from_unixtime(unix_timestamp(created_at,'EEE MMM d HH:mm:ss Z yyyy'))) AS day,
month(from_unixtime(unix_timestamp(created_at,'EEE MMM d HH:mm:ss Z yyyy'))) AS month,
year(from_unixtime(unix_timestamp(created_at,'EEE MMM d HH:mm:ss Z yyyy'))) AS year
FROM source.tweets;

-- dimension user
CREATE TABLE d_user AS
SELECT DISTINCT
user.id,
user.name,
user.location,
user.description,
user.protected,
user.created_at,
user.timezone,
user.geo_enabled,
user.verified,
user.lang,
user.contributors_enabled,
user.is_translator,
user.withheld_in_countries,
user.withheld_scope
FROM source.tweets;

-- dimension hotspot
CREATE TABLE d_hotspot AS
SELECT
CONCAT(latitude,',',longitude) AS id,
latitude,
longitude,
collect_set(address) as addresses,
comune
FROM source.hotspots
GROUP BY latitude,longitude,comune;

-- dimension place
CREATE TABLE d_place AS 
SELECT DISTINCT
id,
name,
CAST(geometry.location.lat AS DOUBLE) as latitude,
CAST(geometry.location.lng AS DOUBLE) as longitude,
vicinity,
price_level,
rating
FROM source.places;