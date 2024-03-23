/* ---------------------------------------------------
 * 198. Combine results sets with UNION 
 * --------------------------------------------------- 
 */
-- UNION combine SELECT statement from multiple tables
SELECT
    product_id,
    product_name,
    'left_products' AS "tablename"
FROM
    left_products
UNION
SELECT
    product_id,
    product_name,
    'right_products' AS "tablename"
FROM
    right_products;

/* ---------------------------------------------------
 * 199. UNION with filters and conditions 
 * --------------------------------------------------- 
 */
SELECT
    first_name,
    last_name
FROM
    directors
WHERE
    nationality IN ('American', 'Chinese', 'Japanese')
UNION
SELECT
    first_name,
    last_name
FROM
    actors
WHERE
    gender = 'F';

/* ---------------------------------------------------
 * 200. UNION tables with different number of columns
 * --------------------------------------------------- 
 */
-- tips: we use NULL to combining table with different column number
-- ie: table1.col2 and table1.col3 are combined
SELECT
    col1,
    col2
FROM
    table1
UNION
SELECT
    NULL,
    col3
FROM
    table2;

/* ---------------------------------------------------
 * 201. INTERSECT with tables
 * --------------------------------------------------- 
 */
-- INTERSECT return common fields from 2 tables
SELECT
    product_id,
    product_name
FROM
    left_products
INTERSECT
SELECT
    product_id,
    product_name
FROM
    right_products;

/* ---------------------------------------------------
 * 202. EXCEPT with tables
 * --------------------------------------------------- 
 */
-- EXCEPT return the rows in the 1st query that do not appear in the 2nd query
SELECT
    product_id,
    product_name
FROM
    left_products
EXCEPT
SELECT
    product_id,
    product_name
FROM
    right_products;