/* ---------------------------------------------------
 * 139. Counting results via COUNT function
 * --------------------------------------------------- */
SELECT
    COUNT(*)
FROM
    movies;

-- COUNT with DISTINCT
--> '8' distinct language
SELECT
    COUNT(DISTINCT(movie_lang))
FROM
    movies;

-- COUNT all english movies
SELECT
    COUNT(*)
FROM
    movies
WHERE
    movie_lang = 'English';

/* ---------------------------------------------------
 * 140. COUNT(), COUNT(*) and COUNT(1)
 * --------------------------------------------------- */
/* ---------------------------------------------------
 * 141. Sum with SUM function
 * --------------------------------------------------- */
SELECT
    SUM(revenues_domestic)
FROM
    movies_revenues
WHERE
    revenues_domestic > 200;

/* ---------------------------------------------------
 * 142. MIN and MAX functions 
 * --------------------------------------------------- */
SELECT
    MAX(movie_length)
FROM
    movies
WHERE
    movie_lang = 'English';

/* ---------------------------------------------------
 * 143. GREATEST AND LEAST functions
 * --------------------------------------------------- */
-- GREATEST & MAX are similar
--> '30'
SELECT
    GREATEST(10, 20, 30);

/* ---------------------------------------------------
 * 144. GREATEST vs. MAX()
 * --------------------------------------------------- */
/* ---------------------------------------------------
 * 145. Average with AVG function 
 * --------------------------------------------------- */
SELECT
    AVG(movie_length)
FROM
    movies
WHERE
    movie_lang = 'English';

/* ---------------------------------------------------
 * 146. Combining Columns using Mathematical operators
 * --------------------------------------------------- */
SELECT
    11 / 2 :: numeric(10, 2) AS addition;

SELECT
    15 % 2;