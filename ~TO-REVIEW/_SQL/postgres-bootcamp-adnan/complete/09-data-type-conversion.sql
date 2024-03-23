--079 What is a data type conversion
SELECT
    *
FROM
    movies
WHERE
    movie_id = integer '1';

--080 Using CAST for data conversion
SELECT
    CAST('2020-01-01' AS DATE);

SELECT
    CAST ('14.7888' AS DOUBLE PRECISION);

--082 Table data conversion
SELECT
    rating_id,
    CASE
        WHEN rating ~ E '^\\d+$' THEN CAST (rating AS INTEGER)
        ELSE 0
    END AS rating
FROM
    ratings;