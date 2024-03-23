-- 076 Creating sample database "mydata"
CREATE TABLE persons(
    persone_id SERIAL PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL
);

ALTER TABLE
    persons
ADD
    COLUMN age int NOT NULL;

ALTER TABLE
    persons
ADD
    COLUMN email varchar(100) UNIQUE;

--077 Modify Table Structures, Add/Modify Columns
ALTER TABLE
    -- rename table
    users RENAME TO persons;

ALTER TABLE
    -- rename column
    persons RENAME COLUMN age TO person_age;

ALTER TABLE
    -- drop a column
    persons DROP COLUMN person_age;

ALTER TABLE
    -- add a column
    persons
ADD
    COLUMN age VARCHAR(10);

ALTER TABLE
    -- convert column type
    persons
ALTER COLUMN
    age TYPE int USING age :: integer;

ALTER TABLE
    persons
ADD
    COLUMN is_enable VARCHAR(1);

-- set default value
ALTER TABLE
    persons
ALTER COLUMN
    is_enable
SET
    DEFAULT 'Y';

-- 078 Add constraints to columns
ALTER TABLE
    web_links
ADD
    -- unique value
    CONSTRAINT unique_web_url UNIQUE (link_url);

-- accept only defined values
ALTER TABLE
    web_links
ADD
    CHECK (is_enable IN ('Y', 'N'));