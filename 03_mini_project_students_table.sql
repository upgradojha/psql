SELECT VERSION();

-- DELETE DATABASE student_bd;

-- CREATE DATABASE bd_students;

-- Using a particular db
-- USE bd_students;



-- Creating a table of students
DROP TABLE students;

CREATE TABLE students(
    s_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(55),
    age INT,
    marks INT,
    course VARCHAR(50),
    city VARCHAR(100)
);

-- selecting students table entries
SELECT *
FROM students; 

-- INSERTING data into student table 
INSERT INTO students (s_id, name , email, age, marks, course, city)
VALUES
(1, 'Prashant', 'naveen@gmail.com', 21, 90, 'B.Tech', 'Ghaziabad'),
(2, 'Naveen', 'naveen@gmail.com', 20, 90, 'B.Tech', 'New Delhi');
(3, 'Amit', 'amitjilovesbikaji@gmail.com', 22, 99, 'B.Tech', 'New Delhi');



-- PRIMARY KEY
-- NOT NULL
-- UNIQUE
-- DEFAULT
-- AUTO_INCREMENT
-- FOREIGN KEY




-- Exercise 2
CREATE TABLE products(
    product_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10,2),
    category VARCHAR(50),
    stock INT,
    brand VARCHAR(50),
    is_available BOOLEAN DEFAULT TRUE
);

SELECT *
FROM products;


-- NULL is not the same as 0 or empty string



-- 13 Read - SELECT

SELECT *
FROM students;

SELECT *, name
FROM students;

SELECT name, email, age, marks
FROM students;

SELECT DISTINCT marks
FROM students;

SELECT *
FROM students 
WHERE marks < 99;

SELECT *
FROM students 
WHERE marks = 99;

-- AND OR NOT

SELECT *
FROM students 
WHERE marks = 99 AND marks > 80;

SELECT *
FROM students 
WHERE marks = 99 OR marks > 80;

-- IN {instead of using multiple OR conditions}
SELECT *
FROM students
WHERE city in ('New Delhi', 'Ghaziabad');

-- LIKE

-- Starting with A
SELECT *
FROM students
WHERE name LIKE 'A%';

-- End with a
SELECT *
FROM students
WHERE name LIKE '%a';

-- Contains ve
SELECT *
FROM students
WHERE name LIKE '%ve%';

-- 2nd Char is s
SELECT *
FROM students
WHERE name LIKE '__i%';


-- NULL check
SELECT *
FROM students
WHERE age IS NOT NULL;


SELECT *
FROM students
WHERE age IS NULL;


SELECT *
FROM students
ORDER BY marks DESC;

SELECT *
FROM students
ORDER BY marks DESC
LIMIT 2;

SELECT *
FROM students
ORDER BY age 
LIMIT 3;



-- Aliases
SELECT name as student_name
FROM students
ORDER BY age 
LIMIT 3;

-- Aggregate Function
SELECT COUNT(*)
FROM students;

-- 
SELECT AVG(marks) as avg_marks
FROM students;

SELECT MAX(marks) as max_marks
FROM students;

SELECT MIN(marks) as min_marks
FROM students;


SELECT SUM(marks) as sum_marks
FROM students;



-- 


-- UPDATE modifing Exsiting Record
-- UPDATE -> SET -> WHERE

-----------------------------------
UPDATE students
SET marks = 50
where s_id = 1;

SELECT *
FROM students;
--------------------------------------

UPDATE students
SET 
    marks = 55,
    email = 'amitjilovesbikaji@gmail.com'
WHERE s_id = 3;


SELECT *
FROM students;

----------------------

UPDATE students
SET city = 'Bihar'
WHERE s_id = 2;

UPDATE students
SET course = 'BBA'
WHERE s_id = 1;


UPDATE students
SET city = 'Delhi' --fill city as Delhi of all rows of city

SELECT *
FROM students;


-- DELETE  Remove Existing Records
-- DELETE -> FROM -> WHERE


DELETE FROM students
WHERE s_id = 14;


DELETE FROM students
WHERE is_active = False;


SELECT FROM students
WHERE age <18;

DELETE FROM students
WHERE age <18;

SELECT *
FROM students;



UPDATE students
SET email ='prashant@gmail.com'
WHERE s_id = 1;
-- 
UPDATE students
SET course ='Full Stack'
WHERE s_id = 1;




-- Altering the table name


-- ALTER -> ADD
-- ALTER -> MODIFY

ALTER table students
ADD phone VARCHAR(50);

ALTER table students
ADD phone INT;


SELECT *
FROM students;
