SELECT *
FROM students;


SELECT *
FROM students
WHERE name LIKE '%A%';


SELECT *
FROM students
WHERE age BETWEEN 21 AND 25 ;


SELECT MAX(marks)
FROM students;