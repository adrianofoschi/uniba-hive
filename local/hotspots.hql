CREATE EXTERNAL TABLE local.hotspots (
address STRING,
latitude DOUBLE,
longitude DOUBLE,
comune STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE
LOCATION '/root/datasource/hotspots/';