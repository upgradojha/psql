CREATE TABLE departments (
    dept_id    INT PRIMARY KEY,
    dept_name  VARCHAR(30) NOT NULL,
    location   VARCHAR(30)
);
INSERT INTO departments VALUES
 (1, 'Sales', 'Mumbai'), (2, 'IT', 'Bengaluru'), (3, 'HR', 'Delhi'),
 (4, 'Finance', 'Pune'), (5, 'Operations', 'Hyderabad');     -- Operations has no staff
 
CREATE TABLE employees (
    emp_id        INT PRIMARY KEY,
    name          VARCHAR(50) NOT NULL,
    dept_id       INT NULL,
    manager_id    INT NULL,
    city          VARCHAR(30),
    salary        DECIMAL(10,2),
    joining_date  DATE,
    FOREIGN KEY (dept_id)    REFERENCES departments (dept_id),
    FOREIGN KEY (manager_id) REFERENCES employees (emp_id)
);
INSERT INTO employees VALUES
 (1,  'Anil Mehta',     NULL, NULL, 'Mumbai',    250000, '2012-04-01'),   -- CEO, no department
 (2,  'Vikram Singh',   1,    1,    'Delhi',     120000, '2015-06-15'),
 (3,  'Priya Verma',    2,    1,    'Bengaluru', 130000, '2016-01-11'),
 (4,  'Ananya Iyer',    3,    1,    'Chennai',    90000, '2017-09-01'),
 (5,  'Meera Kapoor',   4,    1,    'Pune',      110000, '2016-08-20'),
 (6,  'Aarav Sharma',   1,    2,    'Delhi',      45000, '2021-04-12'),
 (7,  'Karan Malhotra', 1,    2,    'Delhi',     125000, '2019-03-05'),
 (8,  'Arjun Nair',     1,    2,    'Pune',       41000, '2024-02-05'),
 (9,  'Rohan Gupta',    2,    3,    'Bengaluru',  95000, '2018-03-15'),
 (10, 'Aditya Joshi',   2,    3,    'Pune',       72000, '2023-01-16'),
 (11, 'Isha Banerjee',  2,    3,    'Kolkata',    64000, '2022-10-10'),
 (12, 'Divya Pillai',   3,    4,    'Bengaluru',  40000, '2025-01-07'),
 (13, 'Sneha Reddy',    4,    5,    'Hyderabad',  52000, '2022-06-18'),
 (14, 'Kavya Nair',     4,    5,    'Kochi',     115000, '2023-08-21');
 
CREATE TABLE customers (
    customer_id  INT PRIMARY KEY,
    name         VARCHAR(50) NOT NULL,
    city         VARCHAR(30),
    signup_date  DATE
);
INSERT INTO customers VALUES
 (101, 'Rahul Khanna', 'Delhi',     '2024-01-10'),
 (102, 'Sana Sheikh',  'Mumbai',    '2024-02-14'),
 (103, 'Deepak Rao',   'Bengaluru', '2024-03-03'),
 (104, 'Pooja Das',    'Kolkata',   '2024-05-20'),
 (105, 'Nikhil Jain',  'Delhi',     '2024-07-07'),
 (106, 'Fatima Khan',  'Hyderabad', '2025-01-15'),   -- never ordered
 (107, 'Gaurav Patel', 'Ahmedabad', '2025-03-30');   -- never ordered
 
CREATE TABLE products (
    product_id    INT PRIMARY KEY,
    product_name  VARCHAR(50) NOT NULL,
    category      VARCHAR(20),
    price         DECIMAL(8,2)
);
INSERT INTO products VALUES
 (1, 'Wireless Mouse',     'Electronics',  599),
 (2, 'Bluetooth Earbuds',  'Electronics', 1499),
 (3, 'USB-C Cable',        'Electronics',  299),
 (4, 'Basmati Rice 5kg',   'Grocery',      749),
 (5, 'Green Tea 100 bags', 'Grocery',      399),
 (6, 'Cotton Kurta',       'Fashion',     1299),
 (7, 'Denim Jeans',        'Fashion',     1799),
 (8, 'Yoga Mat',           'Fitness',      899);   -- never ordered
 
CREATE TABLE orders (
    order_id     INT PRIMARY KEY,
    customer_id  INT NOT NULL,
    order_date   DATE,
    status       VARCHAR(12),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);
INSERT INTO orders VALUES
 (1001, 101, '2025-01-05', 'Delivered'),
 (1002, 102, '2025-01-18', 'Delivered'),
 (1003, 101, '2025-02-02', 'Delivered'),
 (1004, 103, '2025-02-20', 'Cancelled'),
 (1005, 104, '2025-03-11', 'Delivered'),
 (1006, 105, '2025-03-25', 'Shipped'),
 (1007, 102, '2025-04-08', 'Delivered'),
 (1008, 101, '2025-04-30', 'Delivered'),
 (1009, 103, '2025-05-16', 'Delivered'),
 (1010, 105, '2025-06-01', 'Pending');
 
CREATE TABLE order_items (
    order_id    INT,
    product_id  INT,
    quantity    INT,
    unit_price  DECIMAL(8,2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id)   REFERENCES orders (order_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);
INSERT INTO order_items VALUES
 (1001, 1, 2,  599), (1001, 3, 1,  299),
 (1002, 6, 1, 1299), (1002, 5, 2,  399),
 (1003, 2, 1, 1499),
 (1004, 7, 1, 1799),
 (1005, 4, 2,  749), (1005, 5, 1,  399),
 (1006, 1, 1,  599), (1006, 2, 1, 1499),
 (1007, 7, 2, 1799),
 (1008, 3, 3,  299), (1008, 6, 1, 1299),
 (1009, 4, 1,  749),
 (1010, 2, 2, 1499);
 
-- Tiny tables for the CROSS JOIN demo
CREATE TABLE tshirt_sizes   (size   VARCHAR(5));
CREATE TABLE tshirt_colours (colour VARCHAR(10));
INSERT INTO tshirt_sizes   VALUES ('S'), ('M'), ('L');
INSERT INTO tshirt_colours VALUES ('Black'), ('White');
 


-- SHOWING ALL THE PRODUCTS IN ELECTRONICS WITH CHEAPEST FIRST
SELECT *
FROM products
WHERE category = 'Electronics'
ORDER BY price ASC;

-- Customers details whose city is delhi and signup date is 2024


SELECT 
    customer_id,
    name,
    city,
    signup_date
FROM customers
WHERE city = 'Delhi' 
    AND EXTRACT(YEAR FROM signup_date)::NUMERIC = 2024;

-- Top 3 most expensive products

SELECT *
FROM products
ORDER BY price DESC
LIMIT 3;


-- SELECTING ALL ORDERS THAT ARE NOT DELIVERED

SELECT *
FROM orders
WHERE status <> 'Delivered' 
ORDER BY order_date ASC;



-- how many total customeres we have
SELECT COUNT(*) AS total_customers
FROM customers;


-- how many customers how have placed any order
select *
from orders;

SELECT COUNT(*) AS placed_orders_but_not_cancelled
FROM orders
WHERE status <> 'Cancelled';



-- selecting distinc customers who have placed atleast on order
SELECT * FROM customers, orders;


SELECT 
    COUNT(DISTINCT customer_id) AS total_customer_count
FROM orders;


SELECT COUNT(DISTINCT c.customer_id) AS total_customer_count
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.status IS NOT NULL;



SELECT COUNT(DISTINCT c.customer_id) AS total_customer_count
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id;
    -- WHERE o.status IS NOT NULL;


-- SELECT company's monthly salary bill
SELECT *
FROM employees;

SELECT SUM(salary) AS monthly_salary_bill
FROM employees;


-- companies salary rounded to neares rupees
SELECT '₹ ' || ROUND(AVG(salary), 0) AS avg_rounded_salary_bill
FROM employees;

-- selection maxium and minimum salary in one query
SELECT 
    MAX(salary) AS max_salary,
    MIN(salary) AS min_salary
FROM employees;

-- Employees with assigned department

SELECT COUNT(*) AS total_employees, 
    COUNT(dept_id) AS emp_with_dept_assing
FROM employees
--WHERE dept_id IS NOT NULL; -- (count don't couts NULL values) 
                        -- when use COUNT(*) THEN WHERE used

-- HOW many diffrerent city our employees live in
SELECT COUNT( DISTINCT city)
FROM employees;

SELECT 
    city, 
    count(city)
FROM employees
GROUP BY city;

-- Finding the total revenuew from all order_iteam
SELECT 
    sum(unit_price*quantity) AS total_revenues
FROM order_items;

-- Count who earn more than salary is more than 1,00,000 and ther AVG(salary) aslo
SELECT COUNT(*), ROUND(AVG(salary), 0)
FROM employees
WHERE salary > 100000


-- dept wise employees count
SELECT dept_id, COUNT(dept_id) emp_in_each_dept
FROM employees
            -- WHERE dept_id IS NOT NULL filter out dept_id which are null
GROUP BY dept_id;



-- SHOW the Average salary of each department make sure to keep the Highest average Salary first

SELECT 
    dept_id, 
    ROUND(AVG(salary), 0) AS avg_salary
FROM employees
GROUP BY dept_id
ORDER BY avg_salary DESC;


-- SELECT month_name and each month number of order placed of that month

SELECT *
FROM orders;

SELECT 
    TO_CHAR(order_date, 'Month') AS month_name,
    COUNT(*) number_of_order_placed
FROM orders
GROUP BY 
    EXTRACT(MONTH FROM order_date) , month_name
ORDER BY 
    EXTRACT(MONTH FROM order_date) ASC;

-- Department emp count is > 3
SELECT *
FROM employees;


SELECT 
    dept_id, 
    COUNT(*) AS emp_count
FROM employees
GROUP BY dept_id
HAVING COUNT(*) > 3 ;

-- city which have more than one employees
SELECT city, COUNT(city) as city_count
FROM employees
GROUP BY city
HAVING count(city) > 1;


-- order_id total_value > 2000

SELECT order_id,
    SUM(quantity*unit_price) as order_value
FROM order_items
GROUP BY order_id
having SUM(quantity*unit_price) > 2000 ;



-- jOIN AFTER after 2020 and find dept_id >= 2

SELECT *
FROM employees;


SELECT 
    dept_id, 
    COUNT(dept_id) AS dept_count
FROM employees
WHERE 
    EXTRACT(YEAR FROM joining_date) > 2020
GROUP BY dept_id
HAVING COUNT(dept_id) >= 2 ; -- COUNT(*) could also be used in this

-- JOINS

select *
from customers, orders;


SELECT 
    o.order_id,
    o.order_date,
    c.name
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id;

-- Select name and dept name for all those employees which have a deptment
SELECT 
    e.name,
    d.dept_name
FROM employees AS e
INNER JOIN departments AS d
    ON e.dept_id = d.dept_id;

-- Show all employees with depearment name CEO must appear to
SELECT *
FROM employees, departments;

SELECT 
    e.name,
    d.dept_name
FROM employees AS e
LEFT JOIN departments AS d
    ON e.dept_id = d.dept_id;

-- Customers who have nevered orders anything from cutomers table and orders table
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id;


-- Which customers have NEVER placed an orders;
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;


-- Which product have never been sold
SELECT *
FROM products AS p
LEFT JOIN order_items AS o
    ON p.product_id = o.product_id
WHERE o.product_id IS NULL;


-- Which employees have no Employees
SELECT *
FROM departments AS d 
LEFT join employees as e
ON d.dept_id = e.dept_id
WHERE e.dept_id IS NULL;


-- using RIGHT JOIN show every employee from deptarment 
SELECT *
FROM departments AS d 
RIGHT JOIN employees AS e
    ON e.dept_id = d.dept_id;


-- Selection all employees with their manager's name

SELECT 
    e.name AS employee_name, 
    m.name AS manager_name
FROM employees e
join employees m
    ON e.manager_id = m.emp_id

