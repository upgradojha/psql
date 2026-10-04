# PostgreSQL DDL — Quick Revision Notes

## 1. CREATE TABLE

CREATE TABLE table_name (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(10,2)
);

Remember:
SERIAL = auto-generated integer
PRIMARY KEY = unique + NOT NULL
NOT NULL = value required


## 2. CHECK CONSTRAINT

Wrong:
price NUMERIC > 0

Correct:
price NUMERIC(10,2) CHECK (price > 0)

CHECK is a constraint, not a datatype.

Examples:
CHECK (salary > 0)
CHECK (age >= 18)


## 3. FOREIGN KEY

Pattern:

FOREIGN KEY (column_name)
REFERENCES parent_table(parent_column)

Example:

FOREIGN KEY (department_id)
REFERENCES departments(department_id)


## 4. ON DELETE SET NULL

Example:

FOREIGN KEY (department_id)
REFERENCES departments(department_id)
ON DELETE SET NULL

Important:
The FK column must allow NULL.

Wrong:

department_id INTEGER NOT NULL
ON DELETE SET NULL

Because PostgreSQL cannot set NOT NULL column to NULL.


## 5. ON DELETE CASCADE

Example:

FOREIGN KEY (customer_id)
REFERENCES customers(customer_id)
ON DELETE CASCADE

Parent deleted → related child rows are deleted.


## 6. ALTER TABLE — ADD COLUMN

ALTER TABLE employees
ADD COLUMN email VARCHAR(100);


## 7. RENAME COLUMN

Pattern:

ALTER TABLE table_name
RENAME old_column TO new_column;

Example:

ALTER TABLE employees
RENAME email TO email_address;


## 8. CHANGE COLUMN TYPE

Very important.

Wrong:
ALTER COLUMN email VARCHAR(150)

Wrong:
ALTER COLUMN email VARCHAR(100) TO VARCHAR(150)

Correct:

ALTER TABLE employees
ALTER COLUMN email_address TYPE VARCHAR(150);


## 9. ADD UNIQUE CONSTRAINT

Pattern:

ALTER TABLE table_name
ADD CONSTRAINT constraint_name
UNIQUE (column_name);

Example:

ALTER TABLE employees
ADD CONSTRAINT uniq_emp_email
UNIQUE (email_address);

Remember:
UNIQUE is a constraint, NOT a datatype.

Wrong:
ALTER COLUMN email_address TYPE UNIQUE


## 10. SET NOT NULL

Pattern:

ALTER TABLE table_name
ALTER COLUMN column_name
SET NOT NULL;

Example:

ALTER TABLE employees
ALTER COLUMN name
SET NOT NULL;

NOT:

ADD CONSTRAINT ... NOT NULL


## 11. DEFAULT

Set default:

ALTER TABLE employees
ALTER COLUMN status
SET DEFAULT 'active';

Remove default:

ALTER TABLE employees
ALTER COLUMN status
DROP DEFAULT;

Remember:
DEFAULT → SET DEFAULT
Remove DEFAULT → DROP DEFAULT


## 12. RENAME TABLE

Pattern:

ALTER TABLE old_table
RENAME TO new_table;

Example:

ALTER TABLE employees
RENAME TO company_employees;

Remember:
RENAME TO


## 13. DROP COLUMN

Pattern:

ALTER TABLE table_name
DROP COLUMN column_name;

Example:

ALTER TABLE company_employees
DROP COLUMN phone;


## 14. DROP CONSTRAINT

Pattern:

ALTER TABLE table_name
DROP CONSTRAINT constraint_name;

Example:

ALTER TABLE company_employees
DROP CONSTRAINT salary_contrain;

Important:
DROP CONSTRAINT comes directly after ALTER TABLE.

Wrong:

ALTER TABLE company_employees
ALTER COLUMN
DROP CONSTRAINT salary_contrain;


## 15. TRUNCATE

TRUNCATE TABLE test_data;

Removes:
→ all rows

Keeps:
→ table
→ columns
→ structure


## 16. DROP TABLE

DROP TABLE test_data;

Removes:
→ table
→ data
→ structure


## 17. TRUNCATE vs DROP

TRUNCATE:
table remains

DROP:
table disappears


## 18. DROP SCHEMA

Correct PostgreSQL default schema:

DROP SCHEMA public CASCADE;

CREATE SCHEMA public;

Be careful:
CASCADE can remove objects inside the schema.


## 19. Constraint Naming

Recommended:

CONSTRAINT fk_department
FOREIGN KEY (department_id)
REFERENCES departments(department_id)

CONSTRAINT salary_check
CHECK (salary > 0)

CONSTRAINT uniq_emp_email
UNIQUE (email)


## 20. Common Syntax Mistakes

### Changing datatype

Use:

ALTER COLUMN column_name TYPE datatype

NOT:

ALTER COLUMN column_name datatype


### Setting default

Use:

ALTER COLUMN column_name SET DEFAULT value

NOT:

ALTER COLUMN column_name DEFAULT value


### Removing default

Use:

ALTER COLUMN column_name DROP DEFAULT


### NOT NULL

Use:

ALTER COLUMN column_name SET NOT NULL


### Removing constraint

Use:

DROP CONSTRAINT constraint_name


### Renaming table

Use:

RENAME TO new_name


### Foreign key

Use:

FOREIGN KEY (column_name)

NOT:

FOREIGN KEY column_name


## 21. ALTER TABLE Mental Pattern

ADD column:
ALTER TABLE ... ADD COLUMN ...

CHANGE type:
ALTER TABLE ... ALTER COLUMN ... TYPE ...

SET default:
ALTER TABLE ... ALTER COLUMN ... SET DEFAULT ...

REMOVE default:
ALTER TABLE ... ALTER COLUMN ... DROP DEFAULT

SET NOT NULL:
ALTER TABLE ... ALTER COLUMN ... SET NOT NULL

DROP column:
ALTER TABLE ... DROP COLUMN ...

ADD constraint:
ALTER TABLE ... ADD CONSTRAINT ...

DROP constraint:
ALTER TABLE ... DROP CONSTRAINT ...

RENAME column:
ALTER TABLE ... RENAME old TO new

RENAME table:
ALTER TABLE ... RENAME TO new


## 22. Most Important Things to Remember

TYPE → datatype change

SET DEFAULT → add default

DROP DEFAULT → remove default

SET NOT NULL → make required

ADD CONSTRAINT → create constraint

DROP CONSTRAINT → remove constraint

DROP COLUMN → remove column

RENAME TO → rename table

RENAME old TO new → rename column

CHECK (...) → validation rule

FOREIGN KEY (...) → relationship

ON DELETE SET NULL → child FK becomes NULL

ON DELETE CASCADE → child row gets deleted


# Quick Mental Checklist

When writing ALTER TABLE, ask:

1. Am I adding something?
   → ADD

2. Am I changing datatype?
   → ALTER COLUMN ... TYPE

3. Am I setting a default?
   → SET DEFAULT

4. Am I removing a default?
   → DROP DEFAULT

5. Am I making column required?
   → SET NOT NULL

6. Am I adding UNIQUE/CHECK/FK?
   → ADD CONSTRAINT

7. Am I removing a constraint?
   → DROP CONSTRAINT

8. Am I removing a column?
   → DROP COLUMN

9. Am I renaming a column?
   → RENAME old TO new

10. Am I renaming a table?
    → RENAME TO new
