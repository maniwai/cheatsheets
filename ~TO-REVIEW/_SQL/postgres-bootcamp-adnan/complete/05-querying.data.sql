--036: Selecting specific columns
SELECT
    movie_name,
    movie_lang
FROM
    movies;

--037: Adding Aliases to column
-- Note: Aliases are lowercase by convention
SELECT
    -- double quote force the use of uppercase and space
    first_name AS "First Name",
    last_name AS "Last Name"
FROM
    actors;

-- Note: AS keyword is optional
-- But double quote is mandatory
SELECT
    first_name "First Name",
    last_name "Last Name"
FROM
    actors;

--038: Using Expressions
SELECT
    first_name || ' ' || last_name AS "Full Name"
FROM
    actors;

--039: Using ORDER BY to sort data
SELECT
    *
FROM
    movies
ORDER BY
    release_date ASC --ASC is the default order;
SELECT
    *
FROM
    actors
ORDER BY
    --Order on multiple columns
    release_date DESC,
    movie_name ASC;

--040: ORDER BY using Alias column name
SELECT
    first_name,
    last_name AS surname
FROM
    actors
ORDER BY
    surname;

--041: ORDER BY to sort rows by expressions
SELECT
    first_name,
    LENGTH(first_name) AS len
FROM
    actors
ORDER BY
    len DESC;

--042: ORDER BY with column name or column number
--We can specify the order by the column number
SELECT
    first_name,
    last_name,
    date_of_birth
FROM
    actors
ORDER BY
    1 ASC,
    --1 for first_name
    3 DESC --3 for date_of_birth
;

--043: ORDER BY with NULL values
SELECT
    *
FROM
    demo_sorting
ORDER BY
    num DESC NULLS FIRST;

DROP TABLE demo_sorting;

--044: Using DISTINCT for selecting unique values
SELECT
    DISTINCT movie_lang
FROM
    movies
ORDER BY
    1 --for movie_lang (we are using number reference here)
;

--multiple DISTINCT
--Note: it return distinct combinations value
SELECT
    DISTINCT movie_lang,
    director_id
FROM
    movies
ORDER BY
    1;

--temp
SELECT
    *
FROM
    demo_sorting;