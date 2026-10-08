-- WITH
--   cte_name AS (
--     SELECT
--     FROM
--     WHERE
--   )
-- SELECT
-- FROM cte_name;
;


SELECT
  *
FROM
  employees;


SELECT
  *
FROM
  departments;


SELECT
  *
FROM
  customers;


SELECT
  *
FROM
  orders;


SELECT
  *
FROM
  lc_followers;


SELECT
  *
FROM
  lc_teacher;


SELECT
  *
FROM
  lc_employee;


SELECT
  *
FROM
  lc_department;


SELECT
  *
FROM
  lc_dept_employee;


-- Selecting the employees where salary is greater than 60000
WITH
  high_salary_tbl AS (
    SELECT
      *
    FROM
      employees
    WHERE
      salary>60000
  )
SELECT
  *
FROM
  high_salary_tbl;


-- CTE WITH GROUP BY
SELECT
  *
FROM
  employees;


-- depart total staff counts
WITH
  emp_num AS (
    SELECT
      department,
      COUNT(*) AS total_satff
    FROM
      employees
    GROUP BY
      department
  )
SELECT
  *
FROM
  emp_num;


-- Mulitple CTE
SELECT
  *
FROM
  orders;


WITH
  delever AS (
    SELECT
      NAME SUM(amount) AS total
    FROM
      orders
    WHERE
      status='Delivered'
    GROUP BY
      NAME
  )
SELECT
  c.name,
  o.amount
FROM
  customers AS c
  JOIN department AS o ON o.customer_id=c.customer_id;
