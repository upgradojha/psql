SELECT
  *
FROM
  employees;


SELECT
  MAX(salary)
FROM
  employees
WHERE
  salary<(
    SELECT
      MAX(salary)
    FROM
      employees
  );


SELECT
  NAME,
  department,
  salary
FROM
  employees
WHERE
  salary>=(
    SELECT
      AVG(salary)
    FROM
      employees
  );


SELECT
  NAME,
  department,
  salary
FROM
  employees
WHERE
  salary=(
    SELECT
      MAX(salary)
    FROM
      employees
  );


SELECT
  product_id,
  product_name,
  category
FROM
  products
WHERE
  price>=(
    SELECT
      AVG(price)
    FROM
      products
  );


SELECT
  *
FROM
  employees;


SELECT
  *
FROM
  orders;


-- Customer who never placed an order
SELECT
  *
FROM
  customers
WHERE
  customer_id NOT IN (
    SELECT
      customer_id
    FROM
      orders
  );


-- Product which have never been ordered
SELECT
  *
FROM
  products
WHERE
  product_id NOT IN (
    SELECT
      product_id
    FROM
      orders
  );


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
  products;


-- Name of the customer who have purchased atlest one electrincs item
SELECT
  *
FROM
  customers
WHERE
  customer_id IN ( -- always us IN if multiple values retured
    SELECT
      customer_id
    FROM
      orders
    WHERE
      product_id IN (
        SELECT
          product_id
        FROM
          products
        WHERE
          category='Electronics'
      )
  );


SELECT
  *
FROM
  orders;


SELECT
  *
FROM
  products;


SELECT
  *
FROM
  customers;


SELECT
  *
FROM
  customers AS c
  JOIN orders AS o ON o.customer_id=c.customer_id
WHERE
  o.product_id IN (
    SELECT
      product_id
    FROM
      products
    WHERE
      category='Electronics'
  );


-- department whose average salary is more than 65000 using a suquery in FROM
SELECT
  *
FROM
  (
    SELECT
      department
    FROM
      employees
    GROUP BY
      department
    HAVING
      AVG(salary)>60000
  );


SELECT
  *
FROM
  employees;


SELECT
  *
FROM
  employees
WHERE
  department IN (
    SELECT
      department
    FROM
      employees
    GROUP BY
      department
    HAVING
      AVG(salary)>60000
  );


-- Selecting every employees 'Above Average' or 'Below Average' when salary compared to the company average
SELECT
  *
FROM
  employees;


SELECT
  *,
  CASE
    WHEN salary>(
      SELECT
        AVG(salary)
      FROM
        employees
    ) THEN 'Above average'
    ELSE 'Below average'
  END AS cmpr_salary
FROM
  employees;


-- 627. Swap Sex of Employees
UPDATE Salary
SET
  sex=CASE
    WHEN sex='f' THEN 'm'
    ELSE 'f'
  END
