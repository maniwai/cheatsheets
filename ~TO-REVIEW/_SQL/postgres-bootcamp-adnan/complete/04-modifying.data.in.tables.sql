--026
INSERT INTO
    customers (first_name, last_name, email, age)
VALUES
    ('Adnan', 'Waheed', 'a@b.com', 40);

--027
INSERT INTO
    customers (first_name, last_name)
VALUES
    ('ADNAN', 'WAHEED'),
    ('JOHN', 'ADAMS'),
    ('LINDA', 'ABE');

--028: escaping quote
INSERT INTO
    customers (first_name)
VALUES
    ('Bill'' O Sullivan');

--029: Return the value
INSERT INTO
    customers (first_name)
VALUES
    ('ADAM3') RETURNING customer_id,
    first_name;

--030: UPDATE
UPDATE
    customers
SET
    email = 'a3@b.com'
WHERE
    customer_id = 1 RETURNING *;

--update multiple rows
UPDATE
    customers
SET
    email = 'a4@b.com',
    age = 30
WHERE
    customer_id = 1 RETURNING *;

--031
UPDATE
    customers
SET
    email = 'a@b.com'
WHERE
    customer_id = 3;

--032: Updating all (we just omit WHERE)
UPDATE
    customers
SET
    is_enable = 'Y' RETURNING *;

--033: DELETE RECORDS FROM A TABLE
DELETE FROM
    customers
WHERE
    customer_id = 9;

--delete all records
DELETE FROM
    customers;

--034: Using UPSERT (similar to INSERT INTO... IF NOT EXIST)
/* Syntax:
 * INSERT INTO table_name (column_list)
 * VALUES(value_list)
 * ON CONFLICT target action;
 * Action:
 * DO NOTHING (do nothing if the row already exists)
 * DO UPDATE SET column_1 = value_1 (update some fields)
 * WHERE condition
 */
-- DO NOTHING
INSERT INTO
    t_tags (tag)
VALUES
    ('Pen') ON CONFLICT (tag) DO NOTHING;

-- DO UPDATE SET
INSERT INTO
    t_tags (tag)
VALUES
    ('Pen') ON CONFLICT (tag) DO
UPDATE
SET
    tag = EXCLUDED.tag || '-1',
    --we are concatenating with ||
    update_date = NOW() RETURNING *;