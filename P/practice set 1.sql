CREATE TABLE college_students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    age INT,
    marks INT,
    course VARCHAR(50)
);


INSERT INTO college_students (student_id, name, city, age, marks, course)
VALUES
(101, 'Aman', 'Delhi', 20, 85, 'CSE'),
(102, 'Riya', 'Noida', 21, 72, 'CSE'),
(103, 'Rahul', 'Ghaziabad', 20, 91, 'ECE'),
(104, 'Priya', 'Delhi', 22, 68, 'CSE'),
(105, 'Karan', 'Meerut', 21, 79, 'IT'),
(106, 'Sneha', 'Noida', 20, 95, 'CSE'),
(107, 'Aditya', 'Ghaziabad', 22, 63, 'IT'),
(108, 'Neha', 'Delhi', 21, 88, 'ECE'),
(109, 'Rohit', 'Meerut', 20, 74, 'CSE'),
(110, 'Pooja', 'Noida', 22, 82, 'IT'),
(111, 'Vikas', 'Delhi', 21, 59, 'ECE'),
(112, 'Anjali', 'Ghaziabad', 20, 93, 'CSE');

SELECT * 
FROM college_student


-- Q1. Display the name, city, and marks of all students.
SELECT name , city , marks
FROM college_student;

-- Display all students who scored more than 80 marks
SELECT * 
FROM college_student
WHERE marks > 80;

--  Display all students who belongs to CSE course
SELECT * 
FROM college_student
WHERE course = 'CSE';


-- Display all students whose marks are between 70 and 90.
SELECT * 
FROM college_student
WHERE marks BETWEEN 70 AND 90;


-- Display all students who are from either Delhi or Noida.
SELECT * 
FROM college_student
WHERE city IN ('Delhi', 'Noida');

-- Display all students who are 20 years old AND have scored more than 80 marks.
SELECT * 
FROM college_student
WHERE age =20 AND marks > 80;


-- Display all students sorted by their marks from highest to lowest.
SELECT * 
FROM college_student
ORDER BY marks DESC;

-- Display only the name and marks of the students, sorted by marks from lowest to highest. 
SELECT name, marks
FROM college_student
ORDER BY marks ASC;

-- Display all the students from the table who are not from delhi
SELECT *
FROM college_student
WHERE city NOT IN ('Delhi'); -- <> used in postgresSQL

SELECT *
FROM college_student
WHERE city <> 'Delhi';

-- Display the top three students based on marks. 
SELECT *
FROM college_student
ORDER BY marks DESC
LIMIT 3;

-- All the students whose names start with the letter A.
SELECT *
FROM college_student
WHERE name LIKE 'A%';

-- All the students whose names end with the letter "a" 
SELECT *
FROM college_student
WHERE name LIKE '%a'

-- Display all students whose name contains the letter I anywhere in the name
SELECT *
FROM college_student
WHERE name LIKE '%i%';

-- All students are marked > 80 and sort the result by marks from highest to lowest.
SELECT * 
FROM college_student
WHERE marks > 80 
ORDER BY marks DESC;

-- Display the top 2 students from Delhi based on their marks. 
SELECT *
FROM college_student
WHERE city = 'Delhi'
ORDER BY marks DESC
LIMIT 2;


-- Display students who are from Delhi and have marks greater than 75, sorted by marks from highest to lowest.
SELECT *
FROM college_student
WHERE city = 'Delhi' AND marks > 75
ORDER BY marks DESC;

-- Display students whose marks are either below 70 or above 90.
SELECT *
FROM college_student
WHERE marks < 70 OR marks > 90;

-- Display the names, cities, and marks of students who are 
-- either from Delhi or Noida, have marks greater than 75, 
-- and sort them by marks from highest to lowest.

SELECT name, city, marks
FROM college_student
WHERE city IN ('Delhi', 'Noida')
AND marks > 75
ORDER BY marks DESC;

/*
Display the top 3 students who are NOT from Delhi 
and have marks greater than or equal to 75, sorted by marks from highest to lowest.
*/

SELECT * 
FROM college_student
WHERE city <> 'Delhi' AND marks >=75 
ORDER BY marks DESC
LIMIT 3;
























