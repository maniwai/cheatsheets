/* ---------------------------------------------------
 * 147. Datetimes data types 
 * --------------------------------------------------- */
-- 1. Date  YYYY-MM-DD
-- 2. Time  HH:MM:SS
-- 3. Timestamp YYYY-MM-DD HH:MM:SS
/* ---------------------------------------------------
 * 148. System Month Date settings
 * --------------------------------------------------- */
SHOW DateStyle;

SET
    DateStyle = 'ISO, YMD';

/* ---------------------------------------------------
 * 149. Time of day formats and inputs
 * --------------------------------------------------- */
-- 06:10:10.786 -> 10.786 seconds
/* ---------------------------------------------------
 * 150. Strings to Dates conversions 
 * --------------------------------------------------- */
-- TO_DATE (date, format)
/* ---------------------------------------------------
 * 151. Using TO_TIMESTAMP function 
 * --------------------------------------------------- */
-- TO_TIMESTAMP (datetime, format)
SELECT
    TO_TIMESTAMP('2020-01-01 10:30:20', 'YYYY-MM-DD HH:MI:SS');

/* ---------------------------------------------------
 * 152. Formatting Dates 
 * --------------------------------------------------- */
-- TO_CHAR (expression, format)
SELECT
    TO_CHAR(CURRENT_TIMESTAMP, 'DD Month YYYY');

-- with timezone (we need to cast with TIMESTAMPTZ)
SELECT
    TO_CHAR(
        '2020-01-01T10:45:55+1' :: TIMESTAMPTZ,
        'DD Month YYYY tz'
    );

/* ---------------------------------------------------
 * 153. Date construction functions
 * --------------------------------------------------- */
-- MAKE_DATE(YYYY,MM,DD)
-- MAKE_TIME(HH,MI,SS)
-- MAKE TIMESTAMP (YYYY, MM, DD, HH, MI, SS)
/* ---------------------------------------------------
 * 154. Using MAKE_INTERVAL function
 * --------------------------------------------------- */
-- MAKE_INTERVAL (years, months, weeks, days, hours, minutes, seconds)
SELECT
    MAKE_INTERVAL (2020, 1, 1, 1, 10, 30, 45);

-- Alternative notation
SELECT
    MAKE_INTERVAL (months = > 10, days = > 2, mins = > 35);

/* ---------------------------------------------------
 * 155. Using MAKE_TIMESTAMPTZ function 
 * --------------------------------------------------- */
SELECT
    *
FROM
    -- list all timezone names
    pg_timezone_names;

SELECT
    *
FROM
    -- list all timezone abbreviation
    pg_timezone_abbrevs;

SELECT
    MAKE_TIMESTAMPTZ(2020, 01, 01, 00, 01, 01, 'EST');

/* ---------------------------------------------------
 * 156. Date Value Extractors functions
 * --------------------------------------------------- */
SELECT
    EXTRACT(
        'DAY'
        FROM
            CURRENT_TIMESTAMP
    );

-- alternatively with DATE_PART (using comma instead of FROM)
SELECT
    DATE_PART(
        'DAY',
        CURRENT_TIMESTAMP
    );

/* ---------------------------------------------------
 * 157. Using math operators with dates
 * --------------------------------------------------- */
SELECT
    -- add 10 days
    DATE '20200101' + 10;

--alternative by casting
SELECT
    '20200101' :: date + 10;

-- with interval
SELECT
    TIME '23:59:59' + INTERVAL '1 SECOND';

/* ---------------------------------------------------
 * 158. OVERLAPS Operator
 * --------------------------------------------------- */
-- OVERLAPS return true if 2 range overlaps
/* ---------------------------------------------------
 * 159. Date / Time Functions
 * --------------------------------------------------- */
SELECT
    CURRENT_DATE,
    CURRENT_TIME,
    CURRENT_TIMESTAMP,
    LOCALTIME,
    LOCALTIMESTAMP;

SELECT
    -- with precision
    CURRENT_TIMESTAMP(2),
    CURRENT_TIMESTAMP(6);

/* ---------------------------------------------------
 * 160. PostgreSQL Date / Time Functions
 * --------------------------------------------------- */
SELECT
    NOW(),
    TRANSACTION_TIMESTAMP(),
    STATEMENT_TIMESTAMP(),
    CLOCK_TIMESTAMP(),
    TIMEOFDAY();

/* ---------------------------------------------------
 * 161. AGE function
 * --------------------------------------------------- */
SELECT
    AGE (CURRENT_DATE, DATE '1977-12-07');

/* ---------------------------------------------------
 * 162. CURRENT_DATE function
 * --------------------------------------------------- */
-- CURRENT_DATE return the current date as 'YYYY-MM-DD'
/* ---------------------------------------------------
 * 163. CURRENT_TIME function
 * --------------------------------------------------- */
-- CURRENT_TIME return 'HH:MI:SS.MS+TZ'
/* ---------------------------------------------------
 * 164. Date accuracy with EPOCH
 * --------------------------------------------------- */
SELECT
    -- we use EPOCH to compare 2 date with precision
    EXTRACT(
        EPOCH
        FROM
            TIMESTAMPTZ '2020-12-20'
    ) - EXTRACT(
        EPOCH
        FROM
            TIMESTAMPTZ '2020-10-20'
    ) AS "Difference in seconds";

/* ---------------------------------------------------
 * 165. Using Date, time, timestamp in tables
 * --------------------------------------------------- */
CREATE TABLE times (
    times_id SERIAL PRIMARY KEY,
    start_date DATE,
    start_time TIME,
    start_timestamp TIMESTAMP
);

INSERT INTO
    times (start_date, start_time, start_timestamp)
VALUES
    -- epoch: 1970-01-01
    -- allballs: 00:00:00
    ('epoch', 'allballs', 'infinity');

INSERT INTO
    times (start_date, start_time, start_timestamp)
VALUES
    -- note: now can be use for date, time and timestamp
    ('now', 'now', 'now');

/* ---------------------------------------------------
 * 166. View and set timezones
 * --------------------------------------------------- */
SELECT
    *
FROM
    pg_timezone_names;

SELECT
    *
FROM
    pg_timezone_abbrevs;

-- system timezone:
SHOW TIME ZONE;

SET
    TIME ZONE 'Europe/Paris';

/* ---------------------------------------------------
 * 167. How to handle timezones 
 * --------------------------------------------------- */
ALTER TABLE
    times
ADD
    COLUMN end_timestamp TIMESTAMP WITH TIME ZONE;

ALTER TABLE
    times
ADD
    COLUMN end_time TIME WITH TIME ZONE;

INSERT INTO
    times (end_timestamp, end_time)
VALUES
    -- will convert to the system timezone
    ('2020-02-20 11:30:00 US/Pacific', '11:30:00+6');

/* ---------------------------------------------------
 * 168. date_part function 
 * --------------------------------------------------- */
-- DATE_PART(field, source)
SELECT
    DATE_PART('year', TIMESTAMP '2020-01-01') AS "year",
    DATE_PART('quarter', TIMESTAMP '2020-01-01') AS "quarter",
    DATE_PART('decade', TIMESTAMP '2020-01-01') AS "decade",
    DATE_PART('century', TIMESTAMP '2020-01-01') AS "century";

SELECT
    movie_name,
    release_date,
    DATE_PART('week', release_date) AS "release week",
    DATE_PART('month', release_date) AS "release month"
FROM
    movies;

/* ---------------------------------------------------
 * 169. date_trunc function
 * --------------------------------------------------- */
-- DATE_TRUNC round a timestamp to a level of precision
-- DATE_TRUNC('datepart', field)
SELECT
    --> '2020-01-01 00:00:00'
    DATE_TRUNC('day', TIMESTAMP '2020-01-01 18:11:11');