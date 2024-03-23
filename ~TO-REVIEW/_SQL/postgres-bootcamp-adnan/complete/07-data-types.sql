--062 BOOLEAN
-- TRUE, 'true', 't', 'y', 'yes', '1'
INSERT INTO
    table_boolean (is_available)
VALUES
    (FALSE);

--condition on boolean
SELECT
    *
FROM
    table_boolean
WHERE
    is_available IS TRUE;

--using NOT
SELECT
    *
FROM
    table_boolean
WHERE
    NOT is_available;

-- 063 CHAR, VARCHAR and TEXT
-- fixed lenght: CHARACTER(n), CHAR(n)
-- variable with limit: CHARACTER VARYING(n), VARCHAR(n)
-- varaiable unlimited lenght: TEXT, VARCHAR
--
-- CHAR(n)
SELECT
    -- posgres will fill with space the remaining space
    CAST ('Adnan' AS CHAR(10)) AS "Name",
    -- shorthand for casting (equivalent)
    'Adnan' :: CHAR(10) AS "Name";

-- VARCHAR(n)
SELECT
    -- VARCHAR won't fill with space the remaining space
    'Adnan' :: VARCHAR(10);

-- VARCHAR can store 1GB of data
--
-- 065 DECIMALS
-- numeric(precision, scale)
-- precision represent the total number of digit (left and right of the decimal point)
-- scale represent the number of digit on the right of the decimal point.
-- ie: decimal(5,2) maximum value is: 999.99
CREATE TABLE table_number(
    col_numeric numeric(20, 5),
    col_real real,
    col_double double precision
);

-- 067 Date/Time data type
-- Date: stores date only
-- Time: stores time only
-- Timestamp: stores date and time
-- Timestamptz: stores date, time and time zone (UTC)
-- 068 DATE
INSERT INTO
    table_dates (employee_name, hire_date)
VALUES
    ('ADAM', '2020-01-01'),
    ('LINDA', '2020-02-01');

-- 069 TIME
-- time(precision), note: precision applies for the seconds
-- HH:MM, HH:MM:SS, HHMMSS
-- with precision: HH:MM:SS.pppp... ie: 01:01:30.123456
CREATE TABLE table_time(
    id serial PRIMARY KEY,
    class_name varchar(100) NOT NULL,
    start_time time NOT NULL,
    end_time time NOT NULL
);

INSERT INTO
    table_time (class_name, start_time, end_time)
VALUES
    (
        'MATCH',
        '08:00:00',
        '09:00.00'
    ),
    (
        'CHEMISTRY',
        '09:01:00',
        '10:00:00'
    );

-- CURRENT_TIME gives current time with timezone
SELECT
    CURRENT_TIME(4),
    -- we can specifie the precision (6 by default)
    LOCALTIME;

-- LOCALTIME (without timezone)
;

-- operation on time
SELECT
    time '12:00' - time '04:00' AS result;

SELECT
    CURRENT_TIME + INTERVAL '2 hours' AS result;

-- 070 TIMESTAMP and TIMESTAMPTZ
-- Timestamptz: stores date, time and time zone (in UTC format)
-- TIMESTAMPTZ stores the date as UTC and return as local time
CREATE TABLE table_time_tz (ts Timestamp, tstz Timestamptz);

-- SHOW TIMEZONE display local timezone
SHOW TIMEZONE;

-- TIMEOFDAY: current time
SELECT
    TIMEOFDAY();

-- timezone() convert time based on a timezone
SELECT
    timezone('Asia/Singapore', '2020-01-01 00:00:00');

INSERT INTO
    table_time_tz (ts, tstz);

VALUES
    ('2020-02-22 10:10-07');

-- 071 UUID
-- we need to enable the extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- generate uuid
-- note: v1 use MAC address / timestamp and random number
SELECT
    uuid_generate_v1();

-- create table
CREATE TABLE table_uuid (
    product_id UUID DEFAULT uuid_generate_v1(),
    product_name varchar(100) NOT NULL
);

-- insert
INSERT INTO
    table_uuid (product_name)
VALUES
    ('abc');

-- 072: ARRAY
CREATE TABLE table_array (
    id serial,
    name varchar (100),
    phones text []
);

INSERT INTO
    table_array (name, phones)
VALUES
    (
        'Adam',
        ARRAY ['(801)-123-4567','(819)-555-2222']
    );

-- retrieve in array
SELECT
    name
FROM
    table_array
WHERE
    phones [2] = '(819)-555-2222';

-- 073 HSTORE
-- we need to install the extension to use it
CREATE extension IF NOT EXISTS hstore;

-- create table
CREATE TABLE table_hstore(
    book_id serial PRIMARY KEY,
    title varchar(100) NOT NULL,
    book_info hstore
);

-- insert data
INSERT INTO
    table_hstore (title, book_info)
VALUES
    (
        'TITLE 1',
        ' 
            "publisher"=> "ASD publisher",
            "paper_cost"=> "30.00"
        '
    ),
    (
        'TITLE 2',
        ' 
            "publisher"=> "QWE publisher",
            "paper_cost"=> "20.00"
        '
    );

-- retrive hstore
SELECT
    book_info -> 'publisher' AS "publisher"
FROM
    table_hstore;

-- 074 JSON
-- create table
CREATE TABLE table_json (id serial PRIMARY KEY, docs JSON);

-- insert some data
INSERT INTO
    table_json (docs)
VALUES
    ('[1,2,3,4,5,6]'),
    ('[2,3,4,5,6,7]'),
    ('{"myKey":"myValue"}');

-- convert to JSONB
ALTER TABLE
    table_json
ALTER COLUMN
    docs TYPE JSONB;

-- retrieve date in json
SELECT
    docs
FROM
    table_json
WHERE
    docs @ > '2' --@ placeholder is available for JSONB
;

-- postgres use BTREE on index for json by default
-- but GIN is faster for JSON, so we need to conver
CREATE INDEX ON table_json USING GIN (docs jsonb_path_ops);

-- 075 Network Addresses
-- see lesson 075