DROP TABLE IF EXISTS payments;

DROP TABLE IF EXISTS orders;

DROP TABLE IF EXISTS employees;

DROP TABLE IF EXISTS departments;

DROP TABLE IF EXISTS customers;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments VALUES
    (10, 'Engineering', 'Delhi'),
    (20, 'Sales', 'Noida'),
    (30, 'HR', 'Delhi'),
    (40, 'Finance', 'Gurgaon'),
    (50, 'Marketing', 'Noida');

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    department_id INT,
    salary NUMERIC(10,2),
    hire_date DATE,
    city VARCHAR(50),
    manager_id INT
);

INSERT INTO employees VALUES
    (101,'Aman','Sharma',10,85000,'2022-01-15','Delhi',NULL),
    (102,'Riya','Verma',10,72000,'2023-03-12','Noida',101),
    (103,'Rahul','Singh',20,91000,'2021-07-20','Ghaziabad',NULL),
    (104,'Priya','Gupta',20,68000,'2024-02-10','Delhi',103),
    (105,'Karan','Yadav',30,79000,'2022-11-05','Meerut',NULL),
    (106,'Sneha','Mishra',10,95000,'2021-04-18','Noida',101),
    (107,'Aditya','Jain',30,63000,'2024-01-25','Ghaziabad',105),
    (108,'Neha','Tiwari',20,88000,'2022-08-14','Delhi',103),
    (109,'Rohit','Kumar',10,74000,'2023-06-09','Meerut',101),
    (110,'Pooja','Mehta',40,82000,'2021-09-30','Noida',NULL),
    (111,'Vikas','Roy',40,59000,'2024-05-11','Delhi',110),
    (112,'Anjali','Patel',10,93000,'2022-12-17','Ghaziabad',101),
    (113,'Mohit','Saxena',50,77000,'2023-10-01','Delhi',NULL),
    (114,'Simran','Kaur',50,86000,'2022-05-23','Noida',113),
    (115,'Nitin','Bansal',40,69000,'2024-03-16','Meerut',110),
    (116,'Arjun','Malhotra',50,76000,'2023-11-07','Delhi',113);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(60),
    city VARCHAR(50),
    signup_date DATE
);

INSERT INTO customers VALUES
    (1,'Amit Traders','Delhi','2023-01-10'),
    (2,'Bright Solutions','Noida','2023-03-15'),
    (3,'City Mart','Ghaziabad','2023-05-20'),
    (4,'Delta Foods','Delhi','2023-07-11'),
    (5,'Elite Retail','Meerut','2024-01-05'),
    (6,'Future Tech','Noida','2024-02-19'),
    (7,'Green Store','Delhi','2024-04-22'),
    (8,'Horizon Ltd','Gurgaon','2024-06-10');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    order_date DATE,
    amount NUMERIC(10,2),
    status VARCHAR(20)
);

INSERT INTO orders VALUES
    (1001,1,103,'2024-01-05',45000,'Completed'),
    (1002,2,104,'2024-01-12',28000,'Completed'),
    (1003,3,103,'2024-01-20',52000,'Completed'),
    (1004,4,108,'2024-02-03',31000,'Pending'),
    (1005,5,109,'2024-02-15',18000,'Completed'),
    (1006,6,104,'2024-02-21',67000,'Completed'),
    (1007,1,103,'2024-03-02',39000,'Completed'),
    (1008,7,108,'2024-03-11',22000,'Cancelled'),
    (1009,2,104,'2024-03-18',47000,'Completed'),
    (1010,8,113,'2024-04-02',73000,'Completed'),
    (1011,3,103,'2024-04-09',34000,'Completed'),
    (1012,4,108,'2024-04-21',29000,'Completed'),
    (1013,5,109,'2024-05-06',41000,'Pending'),
    (1014,6,114,'2024-05-15',56000,'Completed'),
    (1015,7,108,'2024-05-23',25000,'Completed'),
    (1016,8,113,'2024-06-03',62000,'Completed'),
    (1017,1,103,'2024-06-14',48000,'Completed'),
    (1018,2,104,'2024-06-25',33000,'Cancelled'),
    (1019,3,103,'2024-07-04',59000,'Completed'),
    (1020,6,114,'2024-07-19',71000,'Completed');

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(30),
    payment_amount NUMERIC(10,2)
);

INSERT INTO payments VALUES
    (1,1001,'2024-01-06','UPI',45000),
    (2,1002,'2024-01-13','Card',28000),
    (3,1003,'2024-01-21','UPI',52000),
    (4,1005,'2024-02-16','Cash',18000),
    (5,1006,'2024-02-22','Card',67000),
    (6,1007,'2024-03-03','UPI',39000),
    (7,1009,'2024-03-19','Card',47000),
    (8,1010,'2024-04-03','UPI',73000),
    (9,1011,'2024-04-10','Cash',34000),
    (10,1012,'2024-04-22','UPI',29000),
    (11,1014,'2024-05-16','Card',56000),
    (12,1015,'2024-05-24','UPI',25000),
    (13,1016,'2024-06-04','Card',62000),
    (14,1017,'2024-06-15','UPI',48000),
    (15,1019,'2024-07-05','Card',59000),
    (16,1020,'2024-07-20','UPI',71000);

SELECT * FROM payments;

-- ============================================================ --;

-- QUESTIONS 1-40

-- Q1. Display every employee's full name by combining first_name and last_name into one column.
SELECT concat(first_name, ' ', last_name) AS full_name
FROM employees;


-- Q2. Display employee names in lowercase and uppercase.
SELECT LOWER(first_name) AS lower_first_name, UPPER(first_name) AS upper_first_name
FROM employees;


-- Q3. Display each employee's full name and the number of characters in that full name.
SELECT CONCAT(first_name, ' ' , last_name) AS full_name, LENGTH(CONCAT(first_name, last_name)) AS full_name_length
FROM employees;


-- Q4. Display employees whose first name starts with 'A' and whose last name contains the letter 'a'.
SELECT *
FROM employees
WHERE first_name LIKE 'A%' AND last_name LIKE '%a';


-- Q5. Display each department name together with its location, but show the result as one formatted text value.
SELECT concat(department_name, ' ' , location)
FROM departments;


-- Q6. Display all distinct cities from employees and customers together in one result.
SELECT city
FROM employees
UNION
SELECT city
FROM customers;


-- Q7. Display all employee cities and customer cities, including duplicate city values.
SELECT e.city
FROM employees as e
UNION all
SELECT c.city 
FROM customers as c ;

-- Q8. Display departments that currently have no employee.
select d.department_name 
from departments as d
left join employees as e
    on d.department_id = e.department_id;



-- Q9. Display every employee with their department name.
select concat(e.first_name, ' ',e.last_name) , d.department_name 
from departments as d
join employees as e
    on d.department_id = e.department_id;



-- Q10. Display every department and the number of employees in it, including departments with zero employees.
select d.department_name, count(e.employee_id)
from departments as d
left join employees as e
    on d.department_id = e.department_id
group by d.department_id;


-- Q11. Find the average salary for each department and display only departments whose average salary is above 75000.

select d.department_name, round(avg(e.salary), 2)
from departments as d
left join employees as e
    ON d.department_id = e.department_id
group by d.department_id
having avg(e.salary) >75000;



-- Q12. Find the employee with the highest salary in each department.

select * from employees;

select 
    e1.department_id,
    e1.first_name,
    e1.salary
from employees as e1
where e1.salary = (
select max(e2.salary)
from employees as e2
    where e2.department_id = e1.department_id
-- group by e2.department_id (not necessary because it only select only one group at a time)
);


-- Q13. Display employees whose salary is greater than the average salary of all employees.

-- first find the avg salary and compare the other salary to that and provide * all the information 

select *
from employees
where salary > (
select avg(salary)
from employees
);



-- Q14. Display employees who earn more than the average salary of their own department.

select *
from employees e1
where salary > (
select avg(salary)
from employees e2
where e2.department_Id = e1.department_id

)

-- Q15. Display customers who have never placed an order.

select *
from customers , orders;




-- Q16. Display customers whose total completed order amount is greater than 80000.
-- Q17. Display each completed order with customer name, employee full name, department name, and order amount.
-- Q18. Calculate total completed sales for each employee and display employees from highest total sales to lowest.
-- Q19. Find the department with the highest total employee salary.
-- Q20. Display each order with a new text column: 'High' if amount >= 60000, 'Medium' if amount >= 30000, 'Low' otherwise.
-- Q21. Display order_id, order_date, and the year and month extracted from order_date.
-- Q22. Display all completed orders placed during March 2024.
-- Q23. Find the number of completed orders for each month. Display month and order_count.
-- Q24. Find customers who placed more than one completed order.
-- Q25. Find the second-highest employee salary. Do not use LIMIT 2 and manually select a row.
-- Q26. Find employees who have the same salary as at least one other employee.
-- Q27. Display employees whose salary is between the minimum and maximum salary of the Sales department.
-- Q28. Display completed orders whose amount is greater than the average completed order amount.
-- Q29. Find the customer with the highest total completed order value.
-- Q30. Create a report containing every employee and their manager's full name.
-- Q31. Find employees who were hired before their manager.
-- Q32. Find the difference between each department's highest salary and lowest salary.
-- Q33. Find the percentage of completed orders among all orders.
-- Q34. Find payment methods and their total payment amount.
-- Q35. Find orders that have no corresponding payment record.
-- Q36. Find completed orders where the payment amount is different from the order amount.
-- Q37. Create a CTE containing only completed orders, then use it to calculate total completed sales by employee.
-- Q38. Create a CTE containing each customer's total completed spending. From that CTE, return customers whose spending is above 70000.
-- Q39. Using a CTE, calculate monthly completed sales first. Then return only months whose sales are above the average monthly sales.
-- Q40. Create a CTE for total completed sales per employee, then join with employees and departments. What we need: a) employee name, b) department, c) total sales, d) salary. Sort by total sales descending.

-- EXTRA CHALLENGES

CHALLENGE 1. Find customers who have placed an order but have never made
a payment for any of their orders.
CHALLENGE 2. Find the department whose employees have the largest salary
range (maximum salary - minimum salary).
CHALLENGE 3. Create a CTE that calculates completed sales per customer.
Then return customers whose sales are greater than the average
customer sales.
