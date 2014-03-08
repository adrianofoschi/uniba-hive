CREATE TABLE multistar.d_user AS
SELECT DISTINCT
user.id,
user.location,
user.lang
FROM local.tweets;