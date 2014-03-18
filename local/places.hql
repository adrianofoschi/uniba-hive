CREATE EXTERNAL TABLE local.places (
events ARRAY<
 STRUCT<
  event_id:STRING,
  summary:STRING,
  url:STRING
 >>,
icon STRING,
id STRING,
geometry STRUCT<location : STRUCT<lat : STRING, lng : STRING>>,
name STRING,
opening_hours STRUCT<open_now:BOOLEAN>,
photos ARRAY<
 STRUCT<
  photo_reference:STRING,
  height:INT,
  width:INT,
  html_attributors:ARRAY<STRING>
>>,
types ARRAY<STRING>,
vicinity STRING,
price_level STRING,
rating FLOAT,
formatted_address STRING,
hotspot_id STRING
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe' STORED AS TEXTFILE
LOCATION '/root/datasource/places/';