/* ---------------------------------------------------
 * 170. Using GROUP BY 
 * --------------------------------------------------- */
-- GROUP BY divides the rows into groups
-- for each groups, you can apply an aggregate like COUNT, SUM ...
-- Note: GROUP BY eliminates duplicate values (similar to DISTINCT)
--
-- SELECT
--  column1
--  AGGREGATE_FUNCTION(column2)
-- FROM tablename
-- GROUP BY column1
SELECT
    movie_lang,
    COUNT(movie_lang)
FROM
    movies
GROUP BY
    movie_lang;

SELECT
    movie_lang,
    AVG(movie_length)
FROM
    movies
GROUP BY
    movie_lang;

SELECT
    movie_lang,
    COUNT(movie_lang),
    MIN(movie_length),
    MAX(movie_length)
FROM
    movies
GROUP BY
    movie_lang
ORDER BY
    MAX(movie_length) DESC;

/* ---------------------------------------------------
 * 171. Using GROUP BY with multiple columns, ORDER BY 
 * --------------------------------------------------- */
-- multiple groups
SELECT
    movie_lang,
    age_certificate,
    AVG(movie_length)
FROM
    movies
GROUP BY
    movie_lang,
    age_certificate,
    -- we need to include the aggregate to be able to ORDER BY
    movie_length
ORDER BY
    movie_length;

/* ---------------------------------------------------
 * 172. Order of execution in GROUP BY clause
 * --------------------------------------------------- */
-- Order of Execution:
-- FROM
-- WHERE (condition)
-- GROUP BY (group set)
-- HAVING (filter again)
-- SELECT (columns)
-- DISTINCT (unique)
-- ORDER BY
-- LIMIT (filter records)
/* ---------------------------------------------------
 * 173. Using HAVING 
 * --------------------------------------------------- */
-- Note: we can not use alias in HAVING clause
--
-- SELECT
--  column1,
--  AGGREGATE_FUNCTION(column2),
-- FROM tablename
-- GROUP BY column1
-- HAVING
--  condition;
SELECT
    movie_lang,
    SUM(movie_length)
FROM
    movies
GROUP BY
    movie_lang
HAVING
    SUM(movie_length) > 200
ORDER BY
    SUM(movie_length);

SELECT
    director_id,
    SUM(movie_length)
FROM
    movies
GROUP BY
    director_id
HAVING
    SUM(movie_length) > 200
ORDER BY
    2 DESC;

/* ---------------------------------------------------
 * 174. Order of execution in HAVING clause
 * --------------------------------------------------- */
/* ---------------------------------------------------
 * 175. HAVING vs WHERE
 * --------------------------------------------------- */
-- HAVING is used on result group with aggregate functions
-- WHERE is used on SELECT columns and not on result group (not with aggregate functions)
/* ---------------------------------------------------
 * 176. Handling NULL values with GROUP BY 
 * --------------------------------------------------- */
-- COALESCE rename NULL
-- COALESCE(column, new_name)
SELECT
    COALESCE(department, 'NO DEPARTMENT') AS department,
    COUNT(emplyee_id) AS total_employees
FROM
    employees
GROUP BY
    department
ORDER BY
    department;