/* ---------------------------------------------------
 * 177. INNER joins 
 * --------------------------------------------------- */
-- SELECT *
-- FROM table_a
-- JOIN table_b
-- ON table_a.pkey_column = table_b.fkey_column
--
-- SELECT
--  table1.column1,
--  table2.column1
-- FROM table1
-- INNER JOIN table2 ON table1.column1 = table2.column2
SELECT
    movies.movie_id,
    movies.movie_name,
    movies.director_id,
    directors.first_name
FROM
    movies
    INNER JOIN directors ON movies.director_id = directors.director_id;

-- with alias
SELECT
    mv.movie_id,
    mv.movie_name,
    mv.director_id,
    dir.first_name
FROM
    movies mv
    INNER JOIN directors dir ON mv.director_id = dir.director_id;

-- with filter
SELECT
    mv.movie_id,
    mv.movie_name,
    mv.director_id,
    mv.movie_lang,
    dir.first_name
FROM
    movies mv
    INNER JOIN directors dir ON mv.director_id = dir.director_id
WHERE
    mv.movie_lang = 'English'
    AND dir.director_id = 3;

-- with all the columns
SELECT
    mv.*,
    dir.*
FROM
    movies mv
    INNER JOIN directors dir ON mv.director_id = dir.director_id;

/* ---------------------------------------------------
 * 178. INNER joins with USING
 * --------------------------------------------------- */
SELECT
    *
FROM
    movies
    INNER JOIN directors USING (director_id);

-- connect multiple tables
SELECT
    *
FROM
    movies
    INNER JOIN directors USING (director_id)
    INNER JOIN movies_revenues USING (movie_id);

/* ---------------------------------------------------
 * 179. INNER joins with filter data Part 1
 * --------------------------------------------------- */
-- IN
SELECT
    mv.movie_name,
    d.first_name,
    d.last_name,
    r.revenues_domestic
FROM
    movies mv
    INNER JOIN directors d ON mv.director_id = d.director_id
    INNER JOIN movies_revenues r ON mv.movie_id = r.movie_id
WHERE
    mv.movie_lang IN ('English', 'Chinese', 'Japanese')
    AND r.revenues_domestic > 100
ORDER BY
    4 DESC;

/* ---------------------------------------------------
 * 180. INNER joins with filter data Part 2
 * --------------------------------------------------- */
SELECT
    mv.movie_name,
    d.first_name,
    d.last_name,
    r.revenues_domestic,
    r.revenues_international,
    (r.revenues_domestic + r.revenues_international) AS "Total Revenues"
FROM
    movies mv
    INNER JOIN directors d ON mv.director_id = d.director_id
    INNER JOIN movies_revenues r ON mv.movie_id = r.movie_id
ORDER BY
    6 DESC NULLS LAST
LIMIT
    5;

/* ---------------------------------------------------
 * 181. INNER joins with filter data Part 3
 * --------------------------------------------------- */
SELECT
    mv.movie_name,
    mv.movie_lang,
    mv.release_date,
    d.first_name,
    d.last_name,
    r.revenues_domestic,
    r.revenues_international
FROM
    movies mv
    INNER JOIN directors d ON mv.director_id = d.director_id
    INNER JOIN movies_revenues r ON mv.movie_id = r.movie_id
WHERE
    mv.release_date BETWEEN '2005-01-01'
    AND '2005-12-31'
ORDER BY
    7 DESC NULLS LAST;

/* ---------------------------------------------------
 * 182. INNER joins with different data type columns
 * --------------------------------------------------- */
-- we use CAST to joins different data type
CREATE TABLE t1 (test INT);

CREATE TABLE t2 (test VARCHAR(10));

SELECT
    *
FROM
    t1
    INNER JOIN t2 ON t1.test = CAST(t2.test AS INT);