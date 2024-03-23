/* ---------------------------------------------------
 * 117. Create a sequence, advance a sequence, get current value, set value
 * --------------------------------------------------- */
CREATE SEQUENCE IF NOT EXISTS test_seq;

-- return next value
SELECT
    nextval('test_seq');

-- return current value
SELECT
    currval('test_seq');

-- set a value
SELECT
    setval('test_seq', 100);

-- set value but not skip over
SELECT
    setval('test_seq', 300, false);

-- create a sequence and assign a start value same time
CREATE SEQUENCE IF NOT EXISTS test_seq2 START WITH 100;

/* ---------------------------------------------------
 * 118. Restart, rename a sequence, and use pgAdmin to alter a sequence
 * --------------------------------------------------- */
ALTER SEQUENCE test_seq RESTART WITH 100;

ALTER SEQUENCE test_seq RENAME TO my_sequence;

/* ---------------------------------------------------
 * 119. Create a sequence with START WITH, INCREMENT, MINVALUE and MAXVALUE
 * --------------------------------------------------- */
CREATE SEQUENCE IF NOT EXISTS test_seq3 INCREMENT 50 MINVALUE 400 MAXVALUE 6000 START WITH 500;

/* ---------------------------------------------------
 * 120. Create a sequence using a specific data type
 * --------------------------------------------------- */
CREATE SEQUENCE IF NOT EXISTS test_seq_smallint AS SMALLINT;

/* ---------------------------------------------------
 * 121. Creating a descending sequence, and CYCLE sequence
 * --------------------------------------------------- */
-- note: CYCLE will infinit loop, NO CYCLE will give an error when reached the limit value
CREATE SEQUENCE seq_des INCREMENT -1 MINVALUE 1 MAXVALUE 3 START 3 CYCLE;

SELECT
    nextval('seq_des');

/* ---------------------------------------------------
 * 122. Delete a sequence
 * --------------------------------------------------- */
DROP SEQUENCE seq_des;

/* ---------------------------------------------------
 * 123. Attach a sequence to a table column
 * --------------------------------------------------- */
-- the SERIAL type is a SEQUENCE. We can create our custom SERIAL:
--1. Create a sequence and attach to a table
CREATE TABLE users2(user2_id INT PRIMARY KEY, user2_name VARCHAR(50));

CREATE SEQUENCE user_2_user2_id_seq START WITH 100 OWNED BY users2.user2_id;

--2. Alter table column and set sequence
ALTER TABLE
    users2
ALTER COLUMN
    user2_id
SET
    DEFAULT nextval('user_2_user2_id_seq');

--3. test: first record has the id of 100 
INSERT INTO
    users2 (user2_name)
VALUES
    ('MANI');

SELECT
    *
FROM
    users2;

/* ---------------------------------------------------
 * 124. List all sequences in a database
 * --------------------------------------------------- */
-- this statement list all sequences
SELECT
    relname sequence_name
FROM
    pg_class
WHERE
    relkind = 'S';

/* ---------------------------------------------------
 * 125. Share one sequence between two tables
 * --------------------------------------------------- */
CREATE SEQUENCE common_fruits_seq START WITH 100;

CREATE TABLE apples (
    fruit_id INT DEFAULT nextval('common_fruits_seq') NOT NULL,
    fruit_name VARCHAR(50)
);

CREATE TABLE mangoes (
    fruit_id INT DEFAULT nextval('common_fruits_seq') NOT NULL,
    fruit_name VARCHAR(50)
);

INSERT INTO
    apples (fruit_name)
VALUES
    ('big apple');

INSERT INTO
    mangoes (fruit_name)
VALUES
    ('big mango');

-- first record in 'mangoes' will have an id of 101
-- because 'mangoes' and 'apples' share the same sequence
SELECT
    *
FROM
    mangoes;

/* ---------------------------------------------------
 * 126. Create an alphanumeric sequence
 * --------------------------------------------------- */
-- ie: ID1, ID2, ID3, ...
CREATE SEQUENCE table_seq;

CREATE TABLE contact3 (
    contact_id TEXT NOT NULL DEFAULT ('ID' || nextval('table_seq')),
    contact_name VARCHAR(150)
);

ALTER SEQUENCE table_seq OWNED BY contact3.contact_id;

INSERT INTO
    contact3 (contact_name)
VALUES
    ('MANI1');

INSERT INTO
    contact3 (contact_name)
VALUES
    ('MANI2');

SELECT
    *
FROM
    contact3;