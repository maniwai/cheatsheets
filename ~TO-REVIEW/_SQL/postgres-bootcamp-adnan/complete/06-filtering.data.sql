--046: AND operator
--note: text values must be surrounded by Single quotes
SELECT
    *
FROM
    movies
WHERE
    movie_lang = 'English'
    AND age_certificate = '18';

--047: OR operator
SELECT
    *
FROM
    movies
WHERE
    movie_lang = 'English'
    OR movie_lang = 'Chinese';

--049: combinining AND and OR
--note: use parentheses to combine conditions
SELECT
    *
FROM
    movies
WHERE
    (
        movie_lang = 'English'
        OR movie_lang = 'Chinese'
    )
    AND age_certificate = '12'
ORDER BY
    movie_lang;

--052: Order of Execution
-- FROM | WHERE | SELECT | ORDER BY
--note: this is not the order of declaration
SELECT
    *
FROM
    movies
WHERE
    movie_lang = 'English'
ORDER BY
    movie_length DESC;

--53: Using logical operators
SELECT
    *
FROM
    movies
WHERE
    movie_length < 100
ORDER BY
    movie_length;

-- operators on date
SELECT
    *
FROM
    movies
WHERE
    release_date > '1999-12-31' --remember we need single quote
;

-- operators on text
SELECT
    *
FROM
    movies
WHERE
    movie_lang <> 'English' --all exept 'English'
;

--054: LIMIT and OFFSET
SELECT
    *
FROM
    movies
ORDER BY
    movie_name
LIMIT
    10;

--OFFSET from where to start
SELECT
    *
FROM
    movies
ORDER BY
    movie_id
LIMIT
    5 OFFSET 5;

--055: Using FETCH
--FETCH is an alternative to LIMIT
SELECT
    *
FROM
    movies
ORDER BY
    movie_length DESC
FETCH FIRST
    5 ROW ONLY;

-- FETCH with OFFSET
SELECT
    *
FROM
    movies
ORDER BY
    movie_length DESC
FETCH FIRST
    5 ROW ONLY OFFSET 5;

--056: IN, NOT IN
-- IN is an alternative to chaining OR
SELECT
    *
FROM
    movies
WHERE
    movie_lang = 'English'
    OR movie_lang = 'Chinese'
    OR movie_lang = 'Portuguese'
ORDER BY
    movie_lang;

--instead we can do:
SELECT
    *
FROM
    movies
WHERE
    movie_lang IN ('English', 'Chinese', 'Portuguese')
ORDER BY
    movie_lang;

--NOT IN
SELECT
    *
FROM
    actors
WHERE
    gender NOT IN ('M');

--057: Using BETWEEN and NOT BETWEEN
--note: equivalent to >= AND <= (but BETWEEN is faster to run)
SELECT
    *
FROM
    actors
WHERE
    date_of_birth BETWEEN '1991-01-01'
    AND '1995-12-31'
ORDER BY
    date_of_birth;

--058: Using LIKE and ILIKE (ILIKE is not case sensitive)
-- % matches any sequence of zero or more characters
-- _ matches any single character
-- note: they have high performance cost
SELECT
    *
FROM
    actors
WHERE
    first_name LIKE 'A%'
ORDER BY
    first_name;

--059 using IS NULL and IS NOT NULL
SELECT
    *
FROM
    movies_revenues
WHERE
    revenues_domestic IS NOT NULL
    AND revenues_international IS NULL;

--060 Concatenation techniques
SELECT
    'Hello' || 'World' AS new_string;

--CONCAT is equivalent to ||
SELECT
    CONCAT (first_name, ' ', last_name) AS "Actor Name"
FROM
    actors;

--CONCAT_WS
--note: CONCAT_WS won't concatenate null values
SELECT
    CONCAT_WS(', ', first_name, last_name, date_of_birth) AS surname
FROM
    actors
ORDER BY
    surname;

--061