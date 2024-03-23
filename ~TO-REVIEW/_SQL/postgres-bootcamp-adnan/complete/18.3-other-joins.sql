/* ---------------------------------------------------
 * 191. Self Joins Part 1
 * --------------------------------------------------- */
-- self-join allows to compare rows within the same table
SELECT
    *
FROM
    left_products t1 -- we need to use different a alias (t2) for the self-join
    INNER JOIN left_products t2 ON t1.product_id = t2.product_id;

-- we can use self-join to compare fields in same table
-- ie: we are returning movies with same length
SELECT
    t1.movie_name,
    t2.movie_name,
    t1.movie_length
FROM
    movies t1
    INNER JOIN movies t2 ON t1.movie_length = t2.movie_length
    AND t1.movie_name <> t2.movie_name
ORDER BY
    t1.movie_length DESC,
    t1.movie_name;

/* ---------------------------------------------------
 * 192. Self Joins Part 2
 * --------------------------------------------------- */
/* ---------------------------------------------------
 * 193. CROSS Joins 
 * --------------------------------------------------- */
-- CROSS JOIN return all possible combinations of rows
SELECT
    lp.product_name,
    rp.product_name
FROM
    left_products lp
    CROSS JOIN right_products rp;

-- Alternative Syntax 1:
SELECT
    lp.product_name,
    rp.product_name
FROM
    left_products lp,
    right_products rp;

-- Alternative Syntax 2:
SELECT
    lp.product_name,
    rp.product_name
FROM
    left_products lp
    INNER JOIN right_products rp ON TRUE;

/* ---------------------------------------------------
 * 194. Natural Joins Part 1
 * --------------------------------------------------- */
-- A natural join create an implicit join based on the **same column names**
-- A natural join can be an inner, left or right join
SELECT
    *
FROM
    left_products NATURAL
    LEFT JOIN right_products;

/* ---------------------------------------------------
 * 195. Natural Joins Part 2
 * --------------------------------------------------- */
/* ---------------------------------------------------
 * 196. Append tables with different columns 
 * --------------------------------------------------- */
CREATE TABLE table1 (add_date DATE, col1 INT, col2 INT, col3 INT);

CREATE TABLE table2 (
    add_date DATE,
    col1 INT,
    col2 INT,
    col3 INT,
    col4 INT,
    col5 INT
);

INSERT INTO
    table1 (add_date, col1, col2, col3)
VALUES
    ('2020-01-01', 1, 2, 3),
    ('2020-01-02', 4, 5, 6);

INSERT INTO
    table2 (add_date, col1, col2, col3, col4, col5)
VALUES
    ('2020-01-01', NULL, 7, 8, 9, 10),
    ('2020-01-02', 11, 12, 13, 14, 15),
    ('2020-01-03', 16, 17, 18, 19, 20);

-- we want all the data from table1 and the additionnal column of table2
-- '2020-01-01', 1, 2, 3, 9, 10
-- '2020-01-02', 4, 5, 6, 14, 15
-- '2020-01-03', 16, 17, 18, 19, 20
SELECT
    COALESCE(t1.add_date, t2.add_date) AS "add_date",
    COALESCE(t1.col1, t2.col1) AS col1,
    COALESCE(t1.col2, t2.col2) AS col2,
    COALESCE(t1.col3, t2.col3) AS col3,
    t2.col4,
    t2.col5
FROM
    table1 t1 FULL
    JOIN table2 t2 ON (t1.add_date = t2.add_date);

/* ---------------------------------------------------
 * 197. ON versus WHERE
 * --------------------------------------------------- */