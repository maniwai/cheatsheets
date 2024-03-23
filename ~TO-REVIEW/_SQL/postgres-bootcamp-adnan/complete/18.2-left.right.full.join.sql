/* ---------------------------------------------------
 * 183. LEFT joins Part 1 
 * --------------------------------------------------- */
-- LEFT JOIN return all row from the left table + the rows that match from the right table
CREATE TABLE left_products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100)
);

CREATE TABLE right_products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100)
);

INSERT INTO
    left_products (product_id, product_name)
VALUES
    (1, 'Computers'),
    (2, 'Laptops'),
    (3, 'Monitors'),
    (5, 'Mics');

INSERT INTO
    right_products (product_id, product_name)
VALUES
    (1, 'Computers'),
    (2, 'Laptops'),
    (3, 'Monitors'),
    (4, 'Pen'),
    (7, 'Paper');

SELECT
    *
FROM
    left_products
    LEFT JOIN right_products ON left_products.product_id = right_products.product_id;

SELECT
    *
FROM
    left_products;

/* ---------------------------------------------------
 * 184. LEFT joins Part 2
 * --------------------------------------------------- */
SELECT
    d.first_name,
    d.last_name,
    mv.movie_name
FROM
    directors d
    LEFT JOIN movies mv ON mv.director_id = d.director_id;

/* ---------------------------------------------------
 * 185. LEFT joins Part 3
 * --------------------------------------------------- */
SELECT
    *
FROM
    directors d
    LEFT JOIN movies mv ON mv.director_id = d.director_id
WHERE
    d.nationality IN ('American', 'Chinese', 'Japanese');

/* ---------------------------------------------------
 * 186. LEFT joins Part 4
 * --------------------------------------------------- */
SELECT
    d.first_name,
    d.last_name,
    mv.movie_name,
    SUM(r.revenues_domestic + r.revenues_international) AS "total_revenues"
FROM
    directors d
    LEFT JOIN movies mv ON mv.director_id = d.director_id
    LEFT JOIN movies_revenues r ON r.movie_id = mv.movie_id
GROUP BY
    d.first_name,
    d.last_name,
    mv.movie_name
HAVING
    SUM(r.revenues_domestic + r.revenues_international) > 0
ORDER BY
    4 DESC NULLS LAST;

/* ---------------------------------------------------
 * 187. RIGHT joins 
 * --------------------------------------------------- */
-- RIGHT JOIN return all row from the right table + the rows that match from the left table
/* ---------------------------------------------------
 * 188. RIGHT joins Part 2
 * --------------------------------------------------- */
/* ---------------------------------------------------
 * 189. FULL Joins
 * --------------------------------------------------- */
-- FULL JOIN return all row from the left and right table
/* ---------------------------------------------------
 * 190. Joining multiple tables
 * --------------------------------------------------- */
SELECT
    *
FROM
    movies mv
    JOIN directors d ON d.director_id = mv.director_id
    JOIN movies_revenues r ON r.movie_id = mv.movie_id;