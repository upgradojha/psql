/*

ORDER OF EXECUTION 

1. FROM
2. JOIN
3. ON
4. WHERE
5. GROUP BY
6. HAVING
7. SELECT
8. DISTINCT
9. ORDER BY
10. LIMIT / OFFSET

*/


-- selection of student whose marks is greater than 80 and age is greater than 24
SELECT * 
FROM Student
WHERE marks >80 AND
age > 24;


-- Marks greater that 80 or age > 24
SELECT * 
FROM Student
WHERE marks > 80 OR
age > 24;


-- selecting all the student where the marks is greater than or equal to 57
SELECT * 
FROM Student
WHERE marks >= 57;


-- Selecting al the student whre the marks is less than equal to 69
SELECT * 
FROM Student 
WHERE marks <= 69;


-- Selecting all data from column name as Student_name
SELECT name as Student_name
from Student;


-- Don't change the actual column name
-- using any other column name with * gives you all the data appended with that column data
SELECT * , name
FROM Student;

-- |marks | * | name (shows like this )
SELECT marks, * , name
FROM Student;

-- student marks will be ordered by marks in acending order
SELECT *
FROM Student 
order by marks asc;

-- Create a second highest salary 
SELECT * 
FROM Student
order by marks DESC
limit 1 offset 1;


-- Selection 3rd highest salary
-- offset 0 + offset then count till limit
SELECT * 
FROM Student 
ORDER BY marks DESC
LIMIT 1 OFFSET 3;


-- MAX(column_name) max of the max less than the highest marks
SELECT MAX(marks)
FROM Student
WHERE marks < (
SELECT MAX(marks)
FROM Student);

-- Secting student details by ascending order of name
SELECT *
FROM Student
ORDER BY name;
