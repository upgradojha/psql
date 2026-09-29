-- ============================================================
-- PostgreSQL SET OPERATIONS PRACTICE DATABASE
-- ============================================================
-- Topic:
--   UNION
--   UNION ALL
--   INTERSECT
--   EXCEPT
--
-- Designed for PostgreSQL / pgAdmin 4
--
-- IMPORTANT:
-- 1. Run the database-creation command first.
-- 2. Then connect to the created database:
--      set_operations_practice
-- 3. Run the rest of this file.
--
-- In pgAdmin, CREATE DATABASE is normally executed separately
-- because pgAdmin's Query Tool does not handle psql \connect commands.
-- ============================================================


-- ============================================================
-- SECTION 1: DATABASE
-- ============================================================

-- Run this separately while connected to the default "postgres" DB:
CREATE DATABASE set_operations_practice;


-- ============================================================
-- SECTION 2: OPTIONAL CLEANUP
-- Run this after connecting to set_operations_practice
-- ============================================================

DROP TABLE IF EXISTS students_2025;
DROP TABLE IF EXISTS students_2026;
DROP TABLE IF EXISTS python_students;
DROP TABLE IF EXISTS web_students;
DROP TABLE IF EXISTS delhi_employees;
DROP TABLE IF EXISTS noida_employees;


-- ============================================================
-- SECTION 3: STUDENT TABLES
-- Useful for UNION, UNION ALL, INTERSECT and EXCEPT
-- ============================================================

CREATE TABLE students_2025 (
    student_id      INT PRIMARY KEY,
    student_name    VARCHAR(50) NOT NULL,
    department      VARCHAR(30) NOT NULL,
    city            VARCHAR(30) NOT NULL
);

CREATE TABLE students_2026 (
    student_id      INT PRIMARY KEY,
    student_name    VARCHAR(50) NOT NULL,
    department      VARCHAR(30) NOT NULL,
    city            VARCHAR(30) NOT NULL
);

INSERT INTO students_2025 (student_id, student_name, department, city)
VALUES
    (101, 'Aarav',   'CSE', 'Delhi'),
    (102, 'Priya',   'CSE', 'Noida'),
    (103, 'Rohan',   'ECE', 'Delhi'),
    (104, 'Neha',    'IT',  'Ghaziabad'),
    (105, 'Kunal',   'CSE', 'Delhi'),
    (106, 'Ananya',  'IT',  'Noida'),
    (107, 'Rahul',   'ECE', 'Meerut'),
    (108, 'Isha',    'CSE', 'Delhi'),
    (109, 'Vivek',   'IT',  'Delhi'),
    (110, 'Sneha',   'CSE', 'Noida');

INSERT INTO students_2026 (student_id, student_name, department, city)
VALUES
    (108, 'Isha',    'CSE', 'Delhi'),
    (109, 'Vivek',   'IT',  'Delhi'),
    (110, 'Sneha',   'CSE', 'Noida'),
    (111, 'Arjun',   'CSE', 'Delhi'),
    (112, 'Simran',  'ECE', 'Noida'),
    (113, 'Aditya',  'IT',  'Delhi'),
    (114, 'Mehul',   'CSE', 'Ghaziabad'),
    (115, 'Pooja',   'ECE', 'Meerut'),
    (116, 'Nitin',   'IT',  'Noida'),
    (117, 'Kavya',   'CSE', 'Delhi');


-- ============================================================
-- SECTION 4: SKILL / CLUB TABLES
-- Useful for INTERSECT and EXCEPT
-- ============================================================

CREATE TABLE python_students (
    student_id      INT PRIMARY KEY,
    student_name    VARCHAR(50) NOT NULL,
    level           VARCHAR(20) NOT NULL
);

CREATE TABLE web_students (
    student_id      INT PRIMARY KEY,
    student_name    VARCHAR(50) NOT NULL,
    level           VARCHAR(20) NOT NULL
);

INSERT INTO python_students (student_id, student_name, level)
VALUES
    (201, 'Aman',    'Beginner'),
    (202, 'Bhavna',  'Intermediate'),
    (203, 'Chetan',  'Advanced'),
    (204, 'Divya',   'Intermediate'),
    (205, 'Farhan',  'Beginner'),
    (206, 'Garima',  'Advanced'),
    (207, 'Harsh',   'Intermediate'),
    (208, 'Jiya',    'Beginner');

INSERT INTO web_students (student_id, student_name, level)
VALUES
    (203, 'Chetan',  'Advanced'),
    (204, 'Divya',   'Intermediate'),
    (207, 'Harsh',   'Intermediate'),
    (209, 'Kriti',   'Beginner'),
    (210, 'Lakshya', 'Advanced'),
    (211, 'Mansi',   'Intermediate'),
    (212, 'Naman',   'Beginner');


-- ============================================================
-- SECTION 5: LOCATION-BASED EMPLOYEE TABLES
-- Useful for realistic UNION / EXCEPT practice
-- ============================================================

CREATE TABLE delhi_employees (
    employee_id     INT PRIMARY KEY,
    employee_name   VARCHAR(50) NOT NULL,
    department      VARCHAR(30) NOT NULL
);

CREATE TABLE noida_employees (
    employee_id     INT PRIMARY KEY,
    employee_name   VARCHAR(50) NOT NULL,
    department      VARCHAR(30) NOT NULL
);

INSERT INTO delhi_employees (employee_id, employee_name, department)
VALUES
    (301, 'Raj',      'Sales'),
    (302, 'Sakshi',   'HR'),
    (303, 'Tarun',    'IT'),
    (304, 'Varun',    'Finance'),
    (305, 'Yash',     'Sales'),
    (306, 'Zoya',     'IT');

INSERT INTO noida_employees (employee_id, employee_name, department)
VALUES
    (303, 'Tarun',    'IT'),
    (305, 'Yash',     'Sales'),
    (307, 'Aditi',    'HR'),
    (308, 'Manav',    'Finance'),
    (309, 'Ritika',   'Sales'),
    (310, 'Saurabh',  'IT');


-- ============================================================
-- SECTION 6: BASIC DATA CHECKS
-- ============================================================

SELECT * FROM students_2025;
SELECT * FROM students_2026;

SELECT * FROM python_students;
SELECT * FROM web_students;

SELECT * FROM delhi_employees;
SELECT * FROM noida_employees;


-- ============================================================
-- SECTION 7: SET OPERATIONS — QUICK REFERENCE
-- ============================================================

-- UNION
-- Combines results and removes duplicate rows.
--
-- SELECT column1, column2
-- FROM table1
-- UNION
-- SELECT column1, column2
-- FROM table2;


-- UNION ALL
-- Combines results and keeps duplicate rows.
--
-- SELECT column1, column2
-- FROM table1
-- UNION ALL
-- SELECT column1, column2
-- FROM table2;


-- INTERSECT
-- Returns rows that exist in both result sets.
--
-- SELECT column1, column2
-- FROM table1
-- INTERSECT
-- SELECT column1, column2
-- FROM table2;


-- EXCEPT
-- Returns rows from the first query that do not exist
-- in the second query.
--
-- SELECT column1, column2
-- FROM table1
-- EXCEPT
-- SELECT column1, column2
-- FROM table2;


-- ============================================================
-- SECTION 8: WORKED EXAMPLES
-- ============================================================

-- Example 1:
-- Get all unique students appearing in either 2025 or 2026.
SELECT student_id, student_name
FROM students_2025
UNION
SELECT student_id, student_name
FROM students_2026
ORDER BY student_id;


-- Example 2:
-- Get every student record from both years, including duplicates.
SELECT student_id, student_name
FROM students_2025
UNION ALL
SELECT student_id, student_name
FROM students_2026
ORDER BY student_id;


-- Example 3:
-- Find students who appear in BOTH 2025 and 2026.
SELECT student_id, student_name
FROM students_2025
INTERSECT
SELECT student_id, student_name
FROM students_2026
ORDER BY student_id;


-- Example 4:
-- Find students who were in 2025 but are NOT in 2026.
SELECT student_id, student_name
FROM students_2025
EXCEPT
SELECT student_id, student_name
FROM students_2026
ORDER BY student_id;


-- Example 5:
-- Find students who are in Python AND Web Development.
SELECT student_id, student_name
FROM python_students
INTERSECT
SELECT student_id, student_name
FROM web_students
ORDER BY student_id;


-- Example 6:
-- Find students who know Python but are not in the Web Development group.
SELECT student_id, student_name
FROM python_students
EXCEPT
SELECT student_id, student_name
FROM web_students
ORDER BY student_id;


-- Example 7:
-- Find all employees working in either Delhi or Noida.
SELECT employee_id, employee_name, department
FROM delhi_employees
UNION
SELECT employee_id, employee_name, department
FROM noida_employees
ORDER BY employee_id;


-- Example 8:
-- Find employees who appear in BOTH location lists.
SELECT employee_id, employee_name, department
FROM delhi_employees
INTERSECT
SELECT employee_id, employee_name, department
FROM noida_employees
ORDER BY employee_id;


-- ============================================================
-- SECTION 9: PRACTICE QUESTIONS — LEVEL 1
-- Start here.
-- Do NOT look at the worked examples while solving.
-- ============================================================

-- Q1. Find the unique student IDs that appear in either students_2025
--     or students_2026.


SELECT student_id
FROM students_2025

UNION

SELECT student_id
FROM students_2026
ORDER BY student_id;
-- select *
-- from students_2025
-- union
-- select *
-- from students_2026
-- order by student_name desc;

    
-- Q2. Find the names of all students who appear in either year.
--     Duplicate names should appear only once.


-- select *
-- from students_2025
-- union all
-- select *
-- from students_2026
-- order by student_name desc;


SELECT student_name
FROM students_2025

UNION

SELECT student_name
FROM students_2026
ORDER BY student_name DESC;


-- Q3. Find all student records from both 2025 and 2026.
--     Keep duplicates.


select *
from students_2025

union all 

select *
from students_2026;

-- Q4. Find the students who were present in BOTH 2025 and 2026.
select *
from students_2025
intersect 
select *
from students_2026;

-- Q5. Find students who were in 2025 but not in 2026.
select * 
from students_2025
except
select *
from students_2026;


-- Q6. Find students who were in 2026 but not in 2025.


select *
from students_2026
except 
select *
from students_2025;

-- Q7. Find students who are enrolled in BOTH Python and Web Development.
select *
from python_students
intersect 
select *
from web_students;




-- Q8. Find students who are enrolled in Python but NOT Web Development.

select *
from python_students
except 
select *
from web_students;


-- Q9. Find students who are enrolled in Web Development but NOT Python.

select *
from web_students

except 

select * 
from python_students;


-- Q10. Find employees who work in either Delhi or Noida.
select *
from delhi_employees
union 
select *
from noida_employees;



-- ============================================================
-- SECTION 10: PRACTICE QUESTIONS — LEVEL 2
-- Think about which set operation is appropriate.
-- ============================================================

-- Q11. Find the number of unique students across both 2025 and 2026.


select count(*) as total_unique_students
from (
    select student_id
    from students_2025
        union 
    select student_id
    from students_2026
) as total_count;

-- select count(*) as total_no_of_uniques_students
-- from students_2025
-- union 
-- select count(*)
-- from students_2026;





-- Q12. Find the number of students that appear in both years.

select count(*) as students_appear_in_both_year
from (
    select student_id
    from students_2025
    intersect
    select student_id
    from students_2026
) as common_students;






-- Q13. Find the names of students who existed only in the 2025 list.


select student_name as students_who_existed_only_in_the_2025
from students_2025
except
select student_name
from students_2026;



-- Q14. Find the names of students who joined only in the 2026 list.
select student_name as students_who_existed_only_in_the_2026
from students_2026 
except
select student_name
from students_2025;


-- Q15. Find all unique cities represented by students in 2025 or 2026.
--      Hint: Your two SELECT statements must return compatible columns.

select city as uniques_cities
from students_2025
union 
select city
from students_2026;



-- Q16. Find all cities represented in BOTH student-year tables.

select city as all_cities
from students_2025
intersect
select city
from students_2026;



-- Q17. Find cities that appear in students_2025 but not students_2026.

select city as city_of_2025_only
from students_2025
except
select city
from students_2026;



-- Q18. Find all unique departments represented in either 2025 or 2026.

select department
from students_2025
union 
select department
from students_2026;



-- Q19. Find departments that appear in BOTH years.

select department
from students_2025
intersect 
select department
from students_2026;


-- Q20. Find employees who are present in both Delhi and Noida lists.
select *
from delhi_employees
intersect
select *
from noida_employees;

-- Q21. Find employees who are only in the Delhi list.

select *
from delhi_employees
except
select *
from noida_employees;


-- Q22. Find employees who are only in the Noida list.

select *
from noida_employees
except
select *
from delhi_employees;


-- Q23. Find unique departments represented by employees in Delhi or Noida.


select department
from delhi_employees
union 
select department
from noida_employees;


-- Q24. Find departments represented in BOTH Delhi and Noida.

select department
from delhi_employees
intersect
select department
from noida_employees;


-- ============================================================
-- SECTION 11: PRACTICE QUESTIONS — LEVEL 3
-- More realistic / interview-style questions.
-- ============================================================

-- Q25. Display all unique students across the two years with:
--      student_id, student_name, department.
--      Sort by student_id.


select student_id, student_name, department
from students_2025
union
select student_id, student_name, department
from students_2026
order by student_id asc;

-- Q26. Display students who appear in BOTH years along with their
--      department and city.



SELECT student_id, student_name, department, city
FROM students_2025

INTERSECT

SELECT student_id, student_name, department, city
FROM students_2026;

-- Q27. Find the students who were in 2025 but disappeared in 2026.
--      Display only student_id and student_name.


select student_id, student_name
from students_2025
except
select student_id, student_name
from students_2026;

-- Q28. Find the students who appear in 2026 but did not appear in 2025.
select student_id, student_name
from students_2026
except
select student_id, student_name
from students_2025;

-- Q29. Find students who know BOTH Python and Web Development.
--      Display student_id and student_name.

select student_id, student_name
from python_students
intersect
select student_id, student_name
from web_students;




-- Q30. Find students who know Python but do not belong to the
--      Web Development list.

select *
from python_students
except
select *
from web_students;



-- Q31. Find students who know Web Development but do not belong
--      to the Python list.

select *
from web_students
except
select *
from python_students ;


-- Q32. Find employees who worked in both Delhi and Noida.
--      Display employee_id, employee_name, and department.

select employee_id, employee_name, department
from delhi_employees
intersect
select employee_id, employee_name, department
from noida_employees;





-- Q33. Find employees who are unique to Delhi.

select *
from delhi_employees
except
select * 
from noida_employees;

-- Q34. Find employees who are unique to Noida.

select *
from noida_employees
except
select *
from delhi_employees;


-- Q35. Find all unique departments across both employee locations
--      and sort them alphabetically.

select department
from delhi_employees
union
select department
from noida_employees
order by department asc;


-- Q36. Find departments that exist in Delhi but not Noida.

select department
from delhi_employees
except
select department
from noida_employees;


-- Q37. Find departments that exist in Noida but not Delhi.

select department
from noida_employees
except
select department
from delhi_employees;


-- ============================================================
-- SECTION 12: ADVANCED SET OPERATION PRACTICE
-- ============================================================

-- Q38. Find the unique set of all student names from 2025 and 2026
--      whose city is Delhi.
--
--      You should filter each table first and then combine the results.


select *
from students_2026;

select 
'2025' as SourceTable, 
student_name
from students_2025
where city = 'Delhi'
union 
select '2026' as SourceTable,
student_name
from students_2026
where city = 'Delhi';


-- Q39. Find students who were in CSE in 2025 and also appeared in
--      the 2026 student list, regardless of their 2026 department.

select *
from students_2025
where department = 'CSE'
intersect 
select *
from students_2026;


-- Q40. Find students who were in IT in 2025 but did not appear
--      in the 2026 student list.
select *
from students_2025
where department = 'IT'
except
select *
from students_2026;

-- Q41. Find students who appear in both Python and Web Development
--      and display their level.
--

select student_name, level
from python_students
intersect
select student_name, level
from web_students;

--      Think carefully about how INTERSECT behaves when you select
--      more than one column.


-- Q42. Find all unique student names from Python and Web Development,
--      but exclude students who are present in both lists.
--
--      Hint: Think about symmetric difference using set operations.


-- Q43. Find employees who are present in either Delhi or Noida,
--      but not in both.


-- Q44. Find cities from the student tables that are present in both
--      years, and return each city only once.


-- Q45. Find departments from the two student-year tables that are
--      present in 2025 but absent in 2026.


-- ============================================================
-- SECTION 13: CHALLENGE QUESTIONS
-- ============================================================

-- Q46. Using set operations only, find students who were common to
--      BOTH years and also belonged to CSE in 2025.
--
--      Avoid solving the whole problem with JOINs.


-- Q47. Find the list of names that are in exactly one of the two
--      student-year tables.


-- Q48. Find the employees who work in exactly one location.
--      A person appearing in both lists should not be returned.


-- Q49. Find all departments that occur in exactly one employee location.


-- Q50. Create a result showing:
--      '2025_ONLY' for students only in 2025
--      '2026_ONLY' for students only in 2026
--      'BOTH'      for students appearing in both.
--
--      You may use UNION / UNION ALL and additional expressions.


-- ============================================================
-- SECTION 14: SET OPERATION RULES TO REMEMBER
-- ============================================================

-- 1. Both SELECT statements must return the same number of columns.
--
-- 2. Corresponding columns should have compatible data types.
--
-- 3. Column names in the final result normally come from the FIRST SELECT.
--
-- 4. UNION removes duplicates.
--
-- 5. UNION ALL keeps duplicates.
--
-- 6. INTERSECT returns common rows.
--
-- 7. EXCEPT returns rows from the FIRST query that are missing
--    from the SECOND query.
--
-- 8. ORDER BY is normally written at the end of the complete
--    set-operation query.
--
-- 9. The order matters for EXCEPT:
--
--       A EXCEPT B
--
--    is not the same as:
--
--       B EXCEPT A
--
-- 10. Set operations compare complete rows from the SELECT output.
--     Selecting extra columns can therefore change the result.


-- ============================================================
-- END OF FILE
-- ============================================================
