/* ---------------------------------------------------
 * 127. UPPER, LOWER and INITCAP
 * --------------------------------------------------- */
-- Ex: UPPER make all charactere upper case
-- Ex: INITCAP make the first char upper case
/* ---------------------------------------------------
 * 128. LEFT and RIGHT
 * --------------------------------------------------- */
-- Ex: LEFT('ABCD',-1) -> return 'ABC'
-- Ex: RIGHT('ABCD',-1) -> return 'BCD'
SELECT
    LEFT(first_name, 1) AS initial,
    COUNT(*) AS total_initials
FROM
    directors
GROUP BY
    1
ORDER BY
    1;

/* ---------------------------------------------------
 * 129. REVERSE
 * --------------------------------------------------- */
-- REVERSE('ABC') -> 'CBA'
/* ---------------------------------------------------
 * 130. SPLIT_PART
 * --------------------------------------------------- */
-- SPLIT_PART(string, delimiter, position)
SELECT
    --> 'two'
    SPLIT_PART('one, two, three', ',', 2);

SELECT
    movie_name,
    release_date,
    -- note: we need to cast the date as text
    SPLIT_PART(release_date :: text, '-', 1) AS release_year
FROM
    movies;

/* ---------------------------------------------------
 * 131. TRIM, BTRIM, LTRIM and RTRIM
 * --------------------------------------------------- */
SELECT
    TRIM (
        LEADING '0'
        FROM
            CAST (000123456 AS TEXT)
    );

/* ---------------------------------------------------
 * 132. LPAD and RPAD
 * --------------------------------------------------- */
SELECT
    --> '*******Database'
    LPAD ('Database', 15, '*');

/* ---------------------------------------------------
 * 133. LENGTH
 * --------------------------------------------------- */
-- LENGTH return the number of charactere 
/* ---------------------------------------------------
 * 134. POSITION
 * --------------------------------------------------- */
--> '3'
SELECT
    POSITION ('is' IN 'This is a computer');

/* ---------------------------------------------------
 * 135. STRPOS
 * --------------------------------------------------- */
-- STRPOS and POSITION only differ with the syntax
--> '7'
SELECT
    STRPOS('World Bank', 'Bank');

/* ---------------------------------------------------
 * 136. SUBSTRING
 * --------------------------------------------------- */
-- SUBSTRING (string, start_position, lenght)
--> 'wonderful'
SELECT
    SUBSTRING('What a wonderful world', 8, 10);

/* ---------------------------------------------------
 * 137. REPEAT
 * --------------------------------------------------- */
--> 'AAA'
SELECT
    REPEAT ('A', 3);

/* ---------------------------------------------------
 * 138. REPLACE
 * --------------------------------------------------- */
-- REPLACE (string, old, new)
--> '1|2|3'
SELECT
    REPLACE ('1x2x3', 'x', '|');