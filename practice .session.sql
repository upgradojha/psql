-- PostgreSQL — DDL Practice
-- For deleting all the previous table use this query
DROP SCHEMA pubic CASCADE;


CREATE SCHEMA pubic;


-- Write the SQL yourself. I will check your query. PostgreSQL only.
-- ==================================================
-- LEVEL 1 — CREATE TABLE
-- ==================================================
-- Q1. students
-- - student_id → integer, primary key
-- - name → VARCHAR(50), NOT NULL
-- - email → VARCHAR(100)
-- - age → integer
CREATE TABLE
  students (
    student_id SERIAL PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    age INTEGER
  );


-- Q2. courses
-- - course_id → auto-generated primary key
-- - course_name → VARCHAR(100), NOT NULL
-- - credits → integer
CREATE TABLE
  courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INTEGER
  )
  -- Q3. users
  -- - user_id → auto-generated primary key
  -- - username → VARCHAR(50), NOT NULL
  -- - status → VARCHAR(20), default 'active'
  -- - created_at → TIMESTAMP, default current timestamp
CREATE TABLE
  users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    status VARCHAR(20) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );


-- ==================================================
-- LEVEL 2 — CONSTRAINTS
-- ==================================================
-- Q4. customers
-- - customer_id → auto-generated primary key
-- - name → VARCHAR(100), NOT NULL
-- - email → VARCHAR(100), UNIQUE
-- - phone → VARCHAR(15)
CREATE TABLE
  customers (
    customer_id SERIAL PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
  );


-- Q5. products
-- - product_id → auto-generated primary key
-- - product_name → VARCHAR(100), NOT NULL
-- - price → NUMERIC(10,2)
-- - price > 0
CREATE TABLE
  products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price NUMERIC(10, 2) CHECK (price>0)
  )
  -- Q6. employees
  -- - employee_id → auto-generated primary key
  -- - name → VARCHAR(100), NOT NULL
  -- - salary → NUMERIC(10,2)
  -- - age → integer
  -- - salary > 0
  -- - age >= 18
CREATE TABLE
  employees (
    employee_id SERIAL PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    salary NUMERIC(10, 2) CHECK (salary>0),
    age INTEGER CHECK (age>18)
  );


-- ==================================================
-- LEVEL 3 — FOREIGN KEYS
-- ==================================================
-- Q7. departments
-- - department_id → auto-generated primary key
-- - department_name → VARCHAR(50), NOT NULL
CREATE TABLE
  departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
  );


-- Q8. employees
-- - employee_id → auto-generated primary key
-- - name → VARCHAR(100), NOT NULL
-- - department_id → integer
-- - FK → departments(department_id)
-- - ON DELETE SET NULL
ALTER TABLE employees
ADD COLUMN department_id INT,
ADD CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE SET NULL;


-- ALREADY CREATED
-- CREATE TABLE employees (
--     employee_id SERIAL PRIMARY KEY,
--    name VARCHAR(100) NOT NULL,
--    department_id integer,
--    CONSTRAINT emp_dept_const
--    FOREIGN KEY(department_id)
--    references departments(department_id)
--    on DELETE SET NULL
-- );
-- Q9. orders
-- - order_id → auto-generated primary key
-- - customer_id → integer
-- - order_date → date
-- - FK → customers(customer_id)
-- - ON DELETE CASCADE
CREATE TABLE
  orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    order_date date,
    CONSTRAINT fk_customers FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON DELETE CASCADE
  );


-- ==================================================
-- LEVEL 4 — ALTER TABLE
-- ==================================================
-- Q10. Add to employees:
-- - email → VARCHAR(100)
ALTER TABLE employees
ADD COLUMN email VARCHAR(100);


-- Q11. Rename:
-- - email → email_address
ALTER TABLE employees
RENAME email TO email_address;


-- Q12. Change:
-- - email_address VARCHAR(100) → VARCHAR(150)
ALTER TABLE employees
ALTER COLUMN email_address
TYPE VARCHAR(150)
-- Q13. Make email_address UNIQUE.
ALTER TABLE employees
ADD CONSTRAINT uniq_emp_email UNIQUE (email_address);


-- Q14. Make employees.name NOT NULL.
ALTER TABLE employees
ALTER COLUMN NAME
SET NOT NULL;


-- Q15. Add CHECK:
-- - salary > 0
ALTER TABLE employees
ADD CONSTRAINT salary_contrain CHECK (salary>0);


-- ==================================================
-- LEVEL 5 — ALTER TABLE ADVANCED
-- ==================================================
-- Q16. Set employees.status default to 'active'.
ALTER TABLE employees
ADD COLUMN status VARCHAR(20);


ALTER TABLE employees
ALTER COLUMN status
SET DEFAULT 'active';


-- Q17. Remove employees.status default.
ALTER TABLE employees
ALTER COLUMN status
DROP DEFAULT;


-- Q18. Rename:
-- - employees → company_employees
ALTER TABLE employees
RENAME TO company_employees;


-- Q19. Drop:
-- - phone from company_employees
ALTER TABLE company_employees
ADD COLUMN phone VARCHAR(50);


ALTER TABLE company_employees
DROP COLUMN phone;


-- Q20. Drop the salary CHECK constraint.
ALTER TABLE company_employees
DROP CONSTRAINT salary_contrain;


-- ==================================================
-- LEVEL 6 — DROP / TRUNCATE
-- ==================================================
-- Q21. Create test_data, then TRUNCATE it.
CREATE TABLE
  test_data (id SERIAL PRIMARY KEY, NAME VARCHAR(50) NOT NULL);


TRUNCATE TABLE test_data;


-- Q22. Create a table with 3 columns, then DROP one column.
CREATE TABLE
  test_data2 (
    id SERIAL PRIMARY KEY,
    NAME VARCHAR(50),
    email VARCHAR(60) UNIQUE
  );


ALTER TABLE test_data2
DROP COLUMN email;


-- Q23. DROP the test_data table.
DROP TABLE test_data;


-- ==================================================
-- LEVEL 7 — FINAL CHALLENGE
-- ==================================================
-- Create:
-- departments
-- employees
-- projects
-- employee_projects
-- departments:
CREATE TABLE
  departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    LOCATION VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );


-- - department_id → auto-generated PK
-- - department_name → VARCHAR(50), NOT NULL
-- - location → VARCHAR(50)
-- - created_at → TIMESTAMP, default current timestamp
-- employees:
CREATE TABLE
  employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    salary NUMERIC(10, 2),
    department_id INTEGER,
    CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE SET NULL
  );


-- - employee_id → auto-generated PK
-- - first_name → VARCHAR(50), NOT NULL
-- - last_name → VARCHAR(50)
-- - email → VARCHAR(100), UNIQUE
-- - salary → NUMERIC(10,2)
-- - department_id → FK → departments
-- - ON DELETE SET NULL
-- projects:
-- - project_id → auto-generated PK
-- - project_name → VARCHAR(100), NOT NULL
-- - budget → NUMERIC(10,2)
-- - start_date → date
-- - end_date → date
-- employee_projects:
-- - employee_id → FK → employees
-- - project_id → FK → projects
-- - assigned_date → date
-- - employee_id + project_id → composite PK
-- PRACTICE ORDER:
-- Q1 → send query → I check → Q2 → repeat.
-- After DDL:
-- DML → INSERT → UPDATE → DELETE → Transactions → DQL.
