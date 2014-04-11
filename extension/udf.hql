ADD JAR /root/extensions/uniba-hive-udf/target/hive-extensions-1.0-SNAPSHOT.jar;
CREATE TEMPORARY FUNCTION harvesinedistance AS 'com.uniba.udfs.UDFHaversineDistance';