DROP TABLE IF EXISTS lc_queue CASCADE;


DROP TABLE IF EXISTS lc_employee CASCADE;


DROP TABLE IF EXISTS lc_department CASCADE;


DROP TABLE IF EXISTS lc_logs CASCADE;


DROP TABLE IF EXISTS lc_scores CASCADE;


DROP TABLE IF EXISTS lc_weather CASCADE;


DROP TABLE IF EXISTS monthly_sales CASCADE;


DROP TABLE IF EXISTS orders CASCADE;


DROP TABLE IF EXISTS employees CASCADE;


-- =====================================================================
-- EMPLOYEES
-- =====================================================================
CREATE TABLE
  employees (
    emp_id INT PRIMARY KEY,
    NAME VARCHAR(30),
    department VARCHAR(20),
    salary INT,
    join_date DATE
  );


INSERT INTO
  employees (emp_id, NAME, department, salary, join_date)
VALUES
  (1, 'Rahul', 'IT', 60000, '2019-03-10'),
  (2, 'Priya', 'IT', 75000, '2018-06-01'),
  (3, 'Raj', 'IT', 80000, '2017-01-15'),
  (4, 'Sneha', 'IT', 75000, '2021-09-20'),
  (5, 'Amit', 'HR', 45000, '2020-02-11'),
  (6, 'Simran', 'HR', 50000, '2019-11-05'),
  (7, 'Neha', 'Sales', 55000, '2022-04-18'),
  (8, 'Karan', 'Sales', 65000, '2018-08-23'),
  (9, 'Vikram', 'Sales', 65000, '2016-12-01'),
  (10, 'Anjali', 'Finance', 70000, '2015-07-07');


-- =====================================================================
-- ORDERS
-- =====================================================================
;


CREATE TABLE
  orders (
    order_id INT PRIMARY KEY,
    customer VARCHAR(20),
    order_date DATE,
    amount INT
  );


INSERT INTO
  orders (order_id, customer, order_date, amount)
VALUES
  (1, 'Aman', '2025-01-05', 500),
  (2, 'Bela', '2025-01-10', 1200),
  (3, 'Aman', '2025-02-02', 800),
  (4, 'Chirag', '2025-02-15', 300),
  (5, 'Bela', '2025-03-01', 450),
  (6, 'Aman', '2025-03-12', 2000),
  (7, 'Chirag', '2025-03-20', 700),
  (8, 'Bela', '2025-04-02', 900),
  (9, 'Aman', '2025-04-18', 600),
  (10, 'Chirag', '2025-04-25', 1500);


-- =====================================================================
-- MONTHLY SALES
-- =====================================================================
CREATE TABLE
  monthly_sales (MONTH DATE, region VARCHAR(10), revenue INT);


INSERT INTO
  monthly_sales (MONTH, region, revenue)
VALUES
  ('2025-01-01', 'North', 12000),
  ('2025-02-01', 'North', 15000),
  ('2025-03-01', 'North', 11000),
  ('2025-04-01', 'North', 18000),
  ('2025-05-01', 'North', 21000),
  ('2025-06-01', 'North', 19000),
  ('2025-01-01', 'South', 9000),
  ('2025-02-01', 'South', 9500),
  ('2025-03-01', 'South', 13000),
  ('2025-04-01', 'South', 12500),
  ('2025-05-01', 'South', 15000),
  ('2025-06-01', 'South', 17000);


-- =====================================================================
-- LEETCODE PRACTICE TABLES
-- =====================================================================
-- =====================================================================
-- LeetCode 197 - Rising Temperature
-- Original table: Weather
-- =====================================================================
CREATE TABLE
  lc_weather (id INT, recordDate DATE, temperature INT);


INSERT INTO
  lc_weather (id, recordDate, temperature)
VALUES
  (1, '2025-01-01', 10),
  (2, '2025-01-02', 25),
  (3, '2025-01-03', 20),
  (4, '2025-01-04', 30);


-- =====================================================================
-- LeetCode 178 - Rank Scores
-- Original table: Scores
-- =====================================================================
CREATE TABLE
  lc_scores (id INT, score DECIMAL(4, 2));


INSERT INTO
  lc_scores (id, score)
VALUES
  (1, 3.50),
  (2, 3.65),
  (3, 4.00),
  (4, 3.85),
  (5, 4.00),
  (6, 3.65);


-- =====================================================================
-- LeetCode 180 - Consecutive Numbers
-- Original table: Logs
-- =====================================================================
CREATE TABLE
  lc_logs (id INT, num INT);


INSERT INTO
  lc_logs (id, num)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 2),
  (5, 1),
  (6, 2),
  (7, 2);


-- =====================================================================
-- LeetCode 185 - Department Top Three Salaries
-- Original tables:
-- Employee
-- Department
-- =====================================================================
CREATE TABLE
  lc_department (id INT, NAME VARCHAR(20));


INSERT INTO
  lc_department (id, NAME)
VALUES
  (1, 'IT'),
  (2, 'Sales');


CREATE TABLE
  lc_employee (
    id INT,
    NAME VARCHAR(20),
    salary INT,
    departmentId INT
  );


INSERT INTO
  lc_employee (id, NAME, salary, departmentId)
VALUES
  (1, 'Jai', 85000, 1),
  (2, 'Hema', 80000, 2),
  (3, 'Sam', 60000, 2),
  (4, 'Manav', 90000, 1),
  (5, 'Jiya', 69000, 1),
  (6, 'Rani', 85000, 1),
  (7, 'Vijay', 70000, 1);


-- =====================================================================
-- LeetCode 1204 - Last Person to Fit in the Bus
-- Original table: Queue
-- =====================================================================
CREATE TABLE
  lc_queue (
    person_id INT,
    person_name VARCHAR(20),
    weight INT,
    turn INT
  );


INSERT INTO
  lc_queue (person_id, person_name, weight, turn)
VALUES
  (5, 'Alok', 250, 1),
  (4, 'Bhanu', 175, 5),
  (3, 'Chetna', 350, 2),
  (6, 'Deep', 400, 3),
  (1, 'Ekta', 500, 6),
  (2, 'Farhan', 200, 4);


-- =====================================================================
-- VERIFY TABLES
-- =====================================================================
SELECT
  table_name
FROM
  information_schema.tables
WHERE
  table_schema='public'
  AND table_name IN (
    'employees',
    'orders',
    'monthly_sales',
    'lc_weather',
    'lc_scores',
    'lc_logs',
    'lc_department',
    'lc_employee',
    'lc_queue'
  )
ORDER BY
  table_name;


-- =====================================================================
-- CHECK DATA
-- =====================================================================
SELECT
  *
FROM
  employees;


SELECT
  *
FROM
  orders;


SELECT
  *
FROM
  monthly_sales;


SELECT
  *
FROM
  lc_weather;


SELECT
  *
FROM
  lc_scores;


SELECT
  *
FROM
  lc_logs;


SELECT
  *
FROM
  lc_department;


SELECT
  *
FROM
  lc_employee;


SELECT
  *
FROM
  lc_queue;


-- show every emp name, salary and total_salary of company on every row
SELECT
  NAME,
  salary,
  SUM(salary) OVER () AS total_salary
FROM
  employees;


-- show each employee and it's average salary
SELECT
  NAME,
  salary,
  AVG(salary) OVER () AS avg_sal
FROM
  employees;


-- display employee information with there name, salary and departmet avg_salry for each employee
SELECT
  NAME,
  salary,
  SUM(salary) OVER (
    PARTITION BY
      department
  ) AS depart_avg
FROM
  employees;


-- calculating the employee (salary-dept_avg_salry)
WITH
  depart_average AS (
    SELECT
      NAME,
      salary,
      AVG(salary) OVER (
        PARTITION BY
          department
      ) AS depart_avg
    FROM
      employees
  )
SELECT
  *,
  ROUND(salary-depart_avg, 0) AS dif_salary
FROM
  depart_average;


-- understand the
-- row_number() - sequntial ranking {Roll number}
-- rank() gives same rank for same value but skip next {Race}
-- dense_rank() gives same rank but not skip the next iteration {class nth highest}
SELECT
  NAME,
  salary,
  ROW_NUMBER() OVER (
    ORDER BY
      salary DESC
  ) AS row_num,
  RANK() OVER (
    ORDER BY
      salary DESC
  ) AS rnk,
  DENSE_RANK() OVER (
    ORDER BY
      salary DESC
  ) AS DENSE_RANK
FROM
  employees;


-- ranking of each employees
SELECT
  NAME,
  department,
  salary,
  RANK() OVER (
    PARTITION BY
      department -- no comma used here
    ORDER BY
      salary DESC
  ) AS dept_rank
FROM
  employees;


-- Giving the employee row number from highest salar first
SELECT
  emp_id,
  NAME,
  department,
  salary,
  ROW_NUMBER() OVER (
    ORDER BY
      salary DESC
  ) AS salary_rank
FROM
  employees;


WITH
  ranked AS (
    SELECT
      *,
      DENSE_RANK() OVER (
        PARTITION BY
          department
        ORDER BY
          salary DESC
      ) AS employee_dens_rank
    FROM
      employees
  )
SELECT
  *
FROM
  ranked
WHERE
  employee_dens_rank<=3
ORDER BY
  employee_dens_rank ASC;


WITH
  ranked AS (
    SELECT
      NAME,
      salary,
      department,
      RANK() OVER (
        ORDER BY
          salary DESC
      ) salary_rank
    FROM
      employees
  )
SELECT
  *
FROM
  ranked
WHERE
  salary_rank=1;


-- Highest paid employees in each departmetn
WITH
  ranked AS (
    SELECT
      NAME,
      salary,
      department,
      RANK() OVER (
        PARTITION BY
          department
        ORDER BY
          salary DESC
      ) salary_rank
    FROM
      employees
  )
SELECT
  *
FROM
  ranked
WHERE
  salary_rank=1;


WITH
  ranked AS (
    SELECT
      NAME,
      salary,
      department,
      DENSE_RANK() OVER (
        PARTITION BY
          department
        ORDER BY
          salary DESC
      ) salary_rank
    FROM
      employees
  )
SELECT
  *
FROM
  ranked
WHERE
  salary_rank=2;


--
WITH
  ranked AS (
    SELECT
      NAME,
      salary,
      RANK() OVER (
        ORDER BY
          salary DESC
      ) AS RANK
    FROM
      employees
  )
SELECT
  *
FROM
  ranked
WHERE
  RANK=2;

-- Calculating the running total of the given orderTable entries
SELECT
  *,
  SUM(amount) OVER (
    ORDER BY
      order_date
  ) AS running_total
FROM
  orders;
