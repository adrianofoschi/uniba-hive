CREATE EXTERNAL TABLE local.tweets (
contributors ARRAY<STRUCT<id:BIGINT,id_str:STRING,screen_name:STRING>>,
coordinates STRUCT<coordinates:ARRAY<FLOAT>,type:STRING>,
created_at STRING,
current_user_retweet STRUCT<id:BIGINT,id_str:STRING>,
entities STRUCT<
 hashtags:ARRAY<STRUCT<
  indices:ARRAY<INT>,
  text:STRING>>,
 urls:ARRAY<STRUCT<
  indices:ARRAY<INT>,
  url:STRING,
  display_url:STRING, 
  expanded_url:STRING>>,
 media:ARRAY<STRUCT<
  display_url:STRING,
  expanded_url:STRING,
  id:BIGINT,
  id_str:STRING,
  indices:ARRAY<INT>,
  media_url:STRING,
  media_url_https:STRING,
  sizes:STRUCT<
   thumb:STRUCT<h:INT,resize:STRING,w:INT>,
   large:STRUCT<h:INT,resize:STRING,w:INT>,
   medium:STRUCT<h:INT,resize:STRING,w:INT>,
   small:STRUCT<h:INT,resize:STRING,w:INT>
  >>>,
 user_mentions:ARRAY<STRUCT<
  name:STRING,
  indices:ARRAY<INT>,
  screen_name:STRING,
  id:BIGINT,
  id_str:STRING>>
>,
favorite_count INT,
favorited BOOLEAN,
filter_level STRING,
id BIGINT,
id_str STRING,
in_replay_to_screen_name STRING,
in_replay_to_user_id STRING,
in_replay_to_user_id_str STRING,
in_replay_to_status_id BIGINT,
in_replay_to_status_id_str STRING,
lang STRING,
place STRUCT<
 country:STRING,
 country_code:STRING,
 full_name:STRING,
 id:STRING,
 id_str:STRING,
 place_type:STRING,
 url:STRING
>,
possibily_sensitive BOOLEAN,
scopes MAP<STRING,BOOLEAN>,
retweet_count INT,
source STRING,
text STRING,
truncated BOOLEAN,
user STRUCT<
 contributors_enabled:BOOLEAN,
 created_at:STRING,
 default_profile:BOOLEAN,
 default_profile_image:BOOLEAN,
 description:STRING,
 entities:STRUCT<
  hashtags:ARRAY<STRUCT<
   indices:ARRAY<INT>,
   text:STRING>>,
  urls:ARRAY<STRUCT<
   indices:ARRAY<INT>,
   url:STRING,
   display_url:STRING, 
   expanded_url:STRING>>,
  media:ARRAY<STRUCT<
   display_url:STRING,
   expanded_url:STRING,
   id:BIGINT,
   id_str:STRING,
   indices:ARRAY<INT>,
   media_url:STRING,
   media_url_https:STRING,
   sizes:STRUCT<
    thumb:STRUCT<h:INT,resize:STRING,w:INT>,
    large:STRUCT<h:INT,resize:STRING,w:INT>,
    medium:STRUCT<h:INT,resize:STRING,w:INT>,
    small:STRUCT<h:INT,resize:STRING,w:INT>
   >>>,
  user_mentions:ARRAY<STRUCT<
   name:STRING,
   indices:ARRAY<INT>,
   screen_name:STRING,
   id:BIGINT,
   id_str:STRING>>>,
 favorites_count:INT,
 follow_request_sent:BOOLEAN,
 followers_count:INT,
 geo_enabled:BOOLEAN,
 id:BIGINT,
 id_str:STRING,
 is_translator:BOOLEAN,
 lang:STRING,
 listed_count:INT,
 location:STRING,
 name:STRING,
 profile_background_color:STRING,
 profile_background_image_url:STRING,
 profile_background_image_url_https:STRING,
 profile_background_tile:BOOLEAN,
 profile_banner_url:STRING,
 profile_image_url:STRING,
 profile_image_url_https:STRING,
 profile_link_color:STRING,
 profile_sidebar_border_color:STRING,
 profile_sidebar_fill_color:STRING,
 profile_text_color:STRING,
 profile_use_background_image:BOOLEAN,
 protected:BOOLEAN,
 screen_name:STRING,
 show_all_inline_media:BOOLEAN,
 statuses_count:INT,
 time_zone:STRING,
 url:STRING,
 utc_offset:INT,
 verified:BOOLEAN,
 withheld_in_countries:STRING,
 withheld_scope:STRING
>,
withheld_copyright BOOLEAN,
withheld_in_countries ARRAY<STRING>,
withheld_scope STRING,
hotspot_id STRING
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe' STORED AS TEXTFILE
LOCATION '/root/datasource/tweets/';