/* ---------------------------------------------------
 * 102. Introduction to constraints
 * --------------------------------------------------- */
-- Types of constraints:
-- NOT NULL    Field must have values
-- UNIQUE      Only unique values are allowed
-- DEFAULT     Ability to set DEFAULT values
-- PRIMARY KEY Uniquely identifies each row
-- FOREIGN KEY Constrains data based on columns in other tables
-- CHECK       Check all values beet specific criterias
/* ---------------------------------------------------
 * 103. NOT NULL constraint
 * --------------------------------------------------- */
CREATE TABLE table_nn(id SERIAL PRIMARY KEY, tag TEXT NOT NULL);

-- Adding NOT NULL constraint to an existing table
CREATE TABLE table_nn2(id SERIAL PRIMARY KEY, tag2 TEXT);

ALTER TABLE
    table_nn2
ALTER COLUMN
    tag2
SET
    NOT NULL;

/* ---------------------------------------------------
 * 104. UNIQUE constraint
 * --------------------------------------------------- */
CREATE TABLE table_emails(id serial PRIMARY KEY, emails text UNIQUE);

INSERT INTO
    table_emails (emails)
VALUES
    ('A@B.COM');

-- Create UNIQUE key on multiple columns
-- note: the concatenation of the columns need to be unique
CREATE TABLE unique_brands (
    id SERIAL PRIMARY KEY,
    brand_name varchar(10),
    product_name text
);

ALTER TABLE
    unique_brands
ADD
    CONSTRAINT my_unique_brand UNIQUE(brand_name, product_name);

INSERT INTO
    unique_brands (brand_name, product_name)
VALUES
    ('ACER', 'keyboard');

INSERT INTO
    unique_brands (brand_name, product_name)
VALUES
    ('ACER', 'mouse');

INSERT INTO
    unique_brands (brand_name, product_name)
VALUES
    ('ASUS', 'keyboard');

/* ---------------------------------------------------
 * 105. DEFAULT constraint
 * --------------------------------------------------- */
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    firstname VARCHAR(50),
    last_name VARCHAR(50),
    is_enable VARCHAR(2) DEFAULT 'Y'
);

-- Set default to an existing table
ALTER TABLE
    employees
ALTER COLUMN
    is_enable
SET
    DEFAULT 'N';

--Drop a default value
ALTER TABLE
    employees
ALTER COLUMN
    is_enable DROP DEFAULT;

/* ---------------------------------------------------
 * 106. PRIMARY KEY Constraints
 * --------------------------------------------------- */
CREATE TABLE table_items (
    item_id INTEGER PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL
);

-- Drop a primary key
ALTER TABLE
    table_items DROP CONSTRAINT table_items_pkey;

-- Add Primary Key
ALTER TABLE
    table_items
ADD
    PRIMARY KEY(item_id);

-- Add Primary Key on multiple column
-- note: the concatenation need to be unique
ALTER TABLE
    table_items
ADD
    PRIMARY KEY(item_id, item_name);

INSERT INTO
    table_items (item_id, item_name)
VALUES
    (1, 'A');

INSERT INTO
    table_items (item_id, item_name)
VALUES
    (1, 'B');

/* ---------------------------------------------------
 * 107. PRIMARY KEY Constraints on multiple columns
 * --------------------------------------------------- */
CREATE TABLE t_grades (
    course_id VARCHAR(100) NOT NULL,
    student_id VARCHAR(100) NOT NULL,
    grade int NOT NULL,
    PRIMARY KEY (course_id, student_id)
);

INSERT INTO
    t_grades (course_id, student_id, grade)
VALUES
    ('MATH', 'S1', 50),
    ('MATH', 'S2', 50),
    ('CHEMISTRY', 'S1', 70),
    ('ENGLISH', 'S2', 70),
    ('PHYSICS', 'S1', 80);

-- Add Composite Primary Key to an existing table
ALTER TABLE
    t_grades DROP CONSTRAINT t_grades_pkey;

ALTER TABLE
    t_grades
ADD
    CONSTRAINT t_grades_course_id_session_id_pkey PRIMARY KEY (course_id, student_id);

/* ---------------------------------------------------
 * 108. FOREIGN KEY Constraints
 * --------------------------------------------------- */
/* ---------------------------------------------------
 * 109. Tables without foreign key constraints
 * --------------------------------------------------- */
/* ---------------------------------------------------
 * 110. Creating foreign key constraints
 * --------------------------------------------------- */
CREATE TABLE t_suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL
);

CREATE TABLE t_products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    supplier_id INT NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES t_suppliers (supplier_id)
);

/* ---------------------------------------------------
 * 111. Foreign keys maintains referential data integrity
 * --------------------------------------------------- */
INSERT INTO
    t_suppliers(supplier_id, supplier_name)
VALUES
    (1, 'SUPPLIER 1'),
    (2, 'SUPPLIER 2');

INSERT INTO
    t_products (product_id, product_name, supplier_id)
VALUES
    (1, 'PEN', 1),
    (2, 'PAPER', 2);

/* ---------------------------------------------------
 * 112. Drop a constraint
 * --------------------------------------------------- */
ALTER TABLE
    t_products DROP CONSTRAINT t_products_supplier_id_fkey;

/* ---------------------------------------------------
 * 113. Add or update foreign key constraint on existing table
 * --------------------------------------------------- */
ALTER TABLE
    t_products
ADD
    CONSTRAINT t_products_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES t_suppliers (supplier_id);

/* ---------------------------------------------------
 * 114. CHECK constraint - An Introduction
 * --------------------------------------------------- */
/* ---------------------------------------------------
 * 115. CHECK constraint - Add to new table
 * --------------------------------------------------- */
CREATE TABLE staff (
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    lastname VARCHAR(50),
    birth_date DATE CHECK (birth_date > '1900-01-01'),
    joined_date DATE CHECK (joined_date > birth_date),
    salary numeric CHECK (salary > 0)
);

/* ---------------------------------------------------
 * 116. CHECK constraint - Add, Rename, Drop on existing table
 * --------------------------------------------------- */
CREATE TABLE prices (
    price_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    price NUMERIC NOT NULL,
    discount numeric NOT NULL,
    valid_from DATE NOT NULL
);

ALTER TABLE
    prices
ADD
    CONSTRAINT price_check CHECK (
        price > 0
        AND discount >= 0
        AND price > discount
    );

-- Rename constraint
ALTER TABLE
    prices RENAME CONSTRAINT price_check TO price_discount_check;

-- Drop a constraint
ALTER TABLE
    prices DROP CONSTRAINT price_discount_check;