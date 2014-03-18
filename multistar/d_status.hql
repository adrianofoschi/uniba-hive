CREATE TABLE multistar.d_status AS
SELECT DISTINCT
id,
lang,
text
FROM local.tweets
WHERE id IS NOT NULL;