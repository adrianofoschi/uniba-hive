CREATE TABLE d_user AS
SELECT DISTINCT
user.id,
user.location,
user.lang
FROM source.tweets;