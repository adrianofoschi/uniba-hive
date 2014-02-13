CREATE TABLE source.hotspots (
address STRING, 
longitude DOUBLE, 
latitude DOUBLE
)
PARTITIONED BY(comune STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE;

CREATE TABLE source.places (
id STRING,
name STRING,
geometry STRUCT<location : STRUCT<lat : STRING, lng : STRING>>,
types ARRAY<STRING>,
vicinity STRING,
price_level STRING,
rating FLOAT
)
PARTITIONED BY(hotspot STRING)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe' STORED AS TEXTFILE;

CREATE TABLE source.tweets (
id BIGINT,
created_at STRING,
lang STRING,
source STRING,
text STRING,
truncated BOOLEAN,
favorited BOOLEAN,
retweeted BOOLEAN,
retweet_count STRING,
favorite_count STRING,
entities STRUCT<
 hashtags : ARRAY<STRUCT<text : STRING>>,
 urls: ARRAY<STRUCT<url : STRING>>,
 media : ARRAY<STRUCT<id : STRING, type : STRING, url : STRING>>,
 user_mentions: ARRAY<STRUCT<id : STRING, name : STRING>>
>,
user STRUCT<
 id : BIGINT,
 name : STRING,
 location : STRING,
 description : STRING,
 protected : BOOLEAN,
 followers_count : STRING,
 friends_count : STRING,
 listed_count : STRING,
 created_at : STRING,
 favourites_count : STRING,
 timezone : STRING,
 geo_enabled : BOOLEAN,
 verified : BOOLEAN,
 statuses_count : STRING,
 lang : STRING,
 contributors_enabled : BOOLEAN,
 is_translator : BOOLEAN,
 withheld_in_countries : STRING,
 withheld_scope : STRING
>
)
PARTITIONED BY(hotspot STRING)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe' STORED AS TEXTFILE;