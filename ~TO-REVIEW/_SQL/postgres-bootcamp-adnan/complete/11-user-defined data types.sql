/* ---------------------------------------------------
 * 087 CREATE DOMAINE - Create a DOMAINE data type
 * --------------------------------------------------- */
--1. define custom type
CREATE DOMAIN addr VARCHAR(100) NOT NULL;

--2. use it
CREATE TABLE locations (address addr);

--3. test
INSERT INTO
    locations (address)
VALUES
    ('123 London');

/* ---------------------------------------------------
 * 088 CREATE DOMAINE - Create a data type for a positive number
 * --------------------------------------------------- */
CREATE DOMAIN positive_numeric INT NOT NULL CHECK (VALUE > 0);

CREATE TABLE sample (
    sample_id SERIAL PRIMARY KEY,
    value_num positive_numeric
);

INSERT INTO
    sample (value_num)
VALUES
    (10);

/* ---------------------------------------------------
 * 089 CREATE DOMAINE - Create a postal code validation data type
 * --------------------------------------------------- */
CREATE DOMAIN us_postal_code AS TEXT CHECK (
    VALUE ~ '^\d{5}$'
    OR VALUE ~ '^\d{5}-\d{4}$'
);

CREATE TABLE addresses (
    address_id SERIAL PRIMARY KEY,
    postal_code us_postal_code
);

INSERT INTO
    addresses (postal_code)
VALUES
    ('10000-1000');

/* ---------------------------------------------------
 * 090 CREATE DOMAINE - Create a domain data type for an email validation
 * --------------------------------------------------- */
/* ---------------------------------------------------
 * 091 CREATE DOMAINE - Create a Enum or Set of values domain data type
 * --------------------------------------------------- */
CREATE DOMAIN valid_color VARCHAR(10) CHECK (VALUE IN ('red', 'green', 'blue'));

CREATE TABLE colors (color valid_color);

INSERT INTO
    colors (color)
VALUES
    ('red');

/* ---------------------------------------------------
 * 092 CREATE DOMAINE - Get the list of all DOMAIN data types 
 * --------------------------------------------------- */
/* ---------------------------------------------------
 * 093 CREATE DOMAINE - How to drop a domain data type
 * --------------------------------------------------- */
/* ---------------------------------------------------
 * 094 CREATE TYPE -  Create a composite address object
 * --------------------------------------------------- */
CREATE TYPE addrs AS (
    city VARCHAR(50),
    country VARCHAR(20)
);

CREATE TABLE companies (comp_id SERIAL PRIMARY KEY, address addrs);

INSERT INTO
    companies (address)
VALUES
    (ROW('LONDON', 'UK'));

-- we can select a composite field with the dot notation
SELECT
    (address).country
FROM
    companies;

/* ---------------------------------------------------
 * 095 CREATE TYPE - Create a composite inventory_item data type
 * --------------------------------------------------- */
CREATE TYPE inventory_item AS (
    name VARCHAR(200),
    supplier_id INT,
    price NUMERIC
);

CREATE TABLE inventory2 (
    inventory_id SERIAL PRIMARY KEY,
    item inventory_item
);

INSERT INTO
    inventory2 (item)
VALUES
    (ROW('pen', 10, 4.99));

SELECT
    (item).name
FROM
    inventory2
WHERE
    (item).price > 3.99;

/* ---------------------------------------------------
 * 096 CREATE TYPE - Create an ENUM data type and see how to drop a data type
 * --------------------------------------------------- */
CREATE TYPE currency AS ENUM ('USD', 'EUR', 'GBP');

--updating ENUM
ALTER TYPE currency
ADD
    VALUE 'CHF'
AFTER
    'EUR';

CREATE TABLE stocks (
    stock_id SERIAL PRIMARY KEY,
    stock_currency currency
);

INSERT INTO
    stocks(stock_currency)
VALUES
    ('USD');

/* ---------------------------------------------------
 * 097 ALTER TYPE - Alter a composite data type, change schema and more...
 * --------------------------------------------------- */
CREATE TYPE myaddress AS (city VARCHAR(50), COUNTRY varchar(20));

-- Rename
ALTER TYPE myaddress RENAME TO my_address;

-- Change owner
ALTER TYPE my_address OWNER TO postgres;

-- Change the schema
ALTER TYPE my_address
SET SCHEMA
    test_scm;

-- Add a new attribute
ALTER TYPE test_scm.my_address
ADD
    ATTRIBUTE street_address VARCHAR(150);

/* ---------------------------------------------------
 * 098 ALTER TYPE - Alter an ENUM data type
 * --------------------------------------------------- */
CREATE TYPE mycolors AS ENUM ('green', 'red', 'blue');

--Update a value
ALTER TYPE mycolors RENAME VALUE 'red' TO 'orange';

--List all ENUM values
SELECT
    enum_range(NULL :: mycolors);

--Add value
ALTER TYPE mycolors
ADD
    VALUE 'purple'
AFTER
    'green';

/* ---------------------------------------------------
 * 099 Update an ENUM data in production server
 * --------------------------------------------------- */
CREATE TYPE status_enum AS enum ('queued', 'waiting', 'running', 'done');

CREATE TABLE jobs (
    job_id SERIAL PRIMARY KEY,
    job_status status_enum
);

INSERT INTO
    jobs (job_status)
VALUES
    ('done');

--replace all 'waiting' to 'running'
--1. update the data
UPDATE
    jobs
SET
    job_status = 'running'
WHERE
    job_status = 'waiting';

--2. rename the enum
ALTER TYPE status_enum RENAME TO status_enum_old;

--3. create new enum
CREATE TYPE status_enum AS enum ('queued', 'running', 'done');

--4. we assign the new type to our table
ALTER TABLE
    jobs
ALTER COLUMN
    job_status TYPE status_enum USING job_status :: text :: status_enum;

--5. delete the old type
DROP TYPE status_enum_old;

/* ---------------------------------------------------
 * 100 An ENUM vith a DEFAULT value in a table 
 * --------------------------------------------------- */
CREATE TYPE cron_type_status AS ENUM ('pending', 'approved', 'declined');

CREATE TABLE cron_jobs (
    cron_job_id INT,
    cron_job_status cron_type_status DEFAULT 'pending'
);

-- will insert 'pending' for the status, because its default
INSERT INTO
    cron_jobs (cron_job_id)
VALUES
    (1);

/* ---------------------------------------------------
 * 101 Create a type if not exits using PL/pgSQL function
 * --------------------------------------------------- */