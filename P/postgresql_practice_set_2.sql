-- ============================================================
-- PostgreSQL SQL PRACTICE SET 2
-- Difficulty: Medium -> Hard
-- Purpose: Practice current concepts + prepare for concepts
--          that you will learn later.
--
-- IMPORTANT:
-- 1. Run the CREATE TABLE statements first.
-- 2. Run the INSERT statements next.
-- 3. Solve ONLY the commented questions.
-- 4. No solutions are included.
-- 5. Questions gradually introduce future concepts such as:
--    GROUP BY, aggregate functions, HAVING, JOIN, subqueries,
--    CASE, string/date functions, CTEs, window functions, etc.
-- ============================================================
-- ============================================================
-- 1. STUDENTS TABLE
-- ============================================================
DROP TABLE IF EXISTS enrollments;

DROP TABLE IF EXISTS courses;

DROP TABLE IF EXISTS students;

CREATE TABLE students (
	student_id INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	city VARCHAR(50),
	age INT,
	marks INT,
	course_id INT,
	admission_year INT
);

INSERT INTO
	students (student_id, name, city, age, marks, course_id, admission_year)
VALUES
	(101, 'Aman', 'Delhi', 20, 85, 201, 2024),
	(102, 'Riya', 'Noida', 21, 72, 201, 2023),
	(103, 'Rahul', 'Ghaziabad', 20, 91, 202, 2024),
	(104, 'Priya', 'Delhi', 22, 68, 201, 2023),
	(105, 'Karan', 'Meerut', 21, 79, 203, 2024),
	(106, 'Sneha', 'Noida', 20, 95, 201, 2024),
	(107, 'Aditya', 'Ghaziabad', 22, 63, 203, 2023),
	(108, 'Neha', 'Delhi', 21, 88, 202, 2024),
	(109, 'Rohit', 'Meerut', 20, 74, 201, 2024),
	(110, 'Pooja', 'Noida', 22, 82, 203, 2023),
	(111, 'Vikas', 'Delhi', 21, 59, 202, 2023),
	(112, 'Anjali', 'Ghaziabad', 20, 93, 201, 2024),
	(113, 'Mohit', 'Delhi', 23, 77, 203, 2023),
	(114, 'Simran', 'Noida', 20, 86, 202, 2024),
	(115, 'Nitin', 'Meerut', 22, 69, 203, 2023);

-- ============================================================
-- 2. COURSES TABLE
-- ============================================================
CREATE TABLE courses (
	course_id INT PRIMARY KEY,
	course_name VARCHAR(50) NOT NULL,
	department VARCHAR(50),
	duration_years INT,
	fees INT
);

INSERT INTO
	courses (course_id, course_name, department, duration_years, fees)
VALUES
	(201, 'Computer Science', 'CSE', 4, 85000),
	(202, 'Electronics', 'ECE', 4, 78000),
	(203, 'Information Tech', 'IT', 4, 80000),
	(204, 'Mechanical', 'ME', 4, 70000);

-- ============================================================
-- 3. ENROLLMENTS TABLE
-- ============================================================
CREATE TABLE enrollments (
	enrollment_id INT PRIMARY KEY,
	student_id INT,
	semester INT,
	subject VARCHAR(50),
	subject_marks INT
);

INSERT INTO
	enrollments (enrollment_id, student_id, semester, subject, subject_marks)
VALUES
	(1, 101, 1, 'DBMS', 88),
	(2, 101, 1, 'Python', 91),
	(3, 101, 2, 'Web Tech', 84),
	(4, 102, 1, 'DBMS', 75),
	(5, 102, 1, 'Python', 69),
	(6, 103, 1, 'DBMS', 94),
	(7, 103, 1, 'Python', 89),
	(8, 103, 2, 'Web Tech', 92),
	(9, 104, 1, 'DBMS', 67),
	(10, 104, 1, 'Python', 72),
	(11, 105, 1, 'DBMS', 81),
	(12, 105, 1, 'Python', 77),
	(13, 106, 1, 'DBMS', 97),
	(14, 106, 1, 'Python', 95),
	(15, 106, 2, 'Web Tech', 96),
	(16, 107, 1, 'DBMS', 61),
	(17, 107, 1, 'Python', 65),
	(18, 108, 1, 'DBMS', 90),
	(19, 108, 1, 'Python', 87),
	(20, 109, 1, 'DBMS', 76),
	(21, 109, 1, 'Python', 73),
	(22, 110, 1, 'DBMS', 84),
	(23, 110, 1, 'Python', 80),
	(24, 111, 1, 'DBMS', 58),
	(25, 111, 1, 'Python', 63),
	(26, 112, 1, 'DBMS', 95),
	(27, 112, 1, 'Python', 94),
	(28, 112, 2, 'Web Tech', 91),
	(29, 113, 1, 'DBMS', 79),
	(30, 113, 1, 'Python', 76),
	(31, 114, 1, 'DBMS', 89),
	(32, 114, 1, 'Python', 88),
	(33, 115, 1, 'DBMS', 70),
	(34, 115, 1, 'Python', 68);

SELECT
	*
FROM
	students;

-- ============================================================
-- PRACTICE QUESTIONS
-- ============================================================
/*
Q1. Display the name, city, marks, and admission_year of all
students who scored more than 80 marks and were admitted
in 2024.

Concepts:
WHERE + AND
*/
SELECT
	name,
	city,
	marks,
	admission_year
FROM
	students
WHERE
	marks > 80
	AND admission_year = 2024;

/*
Q2. Display the top 5 students based on marks.

If two students have the same marks, sort those students
alphabetically by name.

Concepts:
ORDER BY column1 ASC, column2 DESC + LIMIT

*/
SELECT
	*
FROM
	students
ORDER BY
	marks DESC,
	name ASC
LIMIT
	5;

/*
Q3. Display all students whose name contains the letter 'a'
and whose marks are between 70 and 90.

Concepts:
LIKE + BETWEEN + AND
*/
SELECT
	*
FROM
	students
WHERE
	name LIKE '%a%'
	AND marks BETWEEN 70 AND 90;

/*
Q4. Display students who are NOT from Delhi or Noida,
have marks greater than 70, and are older than 20.

Sort them from highest marks to lowest.

Concepts: <> USED TO CHECK ONLY SINGLE VALUES
NOT IN + AND + ORDER BY
*/
SELECT
	*
FROM
	students
WHERE
	city NOT IN ('Delhi', 'Noida')
	AND marks > 70
	AND age > 20
ORDER BY
	marks DESC;

/*
Q5. Display the distinct cities from which students come.

Sort the cities alphabetically.

Future concept:
DISTINCT
*/
SELECT DISTINCT
	city
FROM
	students
ORDER BY
	city;

/*
Q6. Count how many students are present in the table.

Future concept:
COUNT()
*/
SELECT
	COUNT(*) AS total_students
FROM
	students;

/*
Q7. Find the highest, lowest, and average marks of all students.

Future concepts:
MAX() + MIN() + AVG()
*/
SELECT
	MAX(marks) AS maximum_marks,
	MIN(marks) AS minimum_marks,
	AVG(marks) AS average_marks
FROM
	students;

/*
Q8. Find the average marks for each course_id.

Display:
course_id
average_marks

Sort the result from highest average marks to lowest.

Future concepts:
GROUP BY + AVG()
*/
SELECT
	*
FROM
	students AS s
	NATURAL JOIN courses AS c;

SELECT
	c.course_id,
	AVG(s.marks)
FROM
	students AS s
	NATURAL JOIN courses AS c
GROUP BY
	c.course_id;

/*
Q9. Find how many students belong to each city.
Display: city
student_count
Sort from the city with the most students to the city
with the fewest students.

Future concepts:
GROUP BY + COUNT() + ORDER BY
*/
SELECT
	city,
	COUNT(city) AS student_count
FROM
	students
GROUP BY
	city;

/*
Q10. Display only those cities that have at least 3 students.

Future concept:
GROUP BY + HAVING
*/
SELECT
	city
FROM
	students
GROUP BY
	city
HAVING
	COUNT(city) > 3;

/*
Q11. Display each course_id along with:
- number of students
- average marks
- highest marks
- lowest marks

Sort by average marks from highest to lowest.

Future concepts:
GROUP BY + COUNT() + AVG() + MAX() + MIN()
*/


SELECT
	course_id,
	COUNT(*) AS number_of_student,
	AVG(marks) AS average_marks,
	MAX(marks) AS highest_marks,
	MIN(marks) AS lowest_marks
FROM
	students
GROUP BY
	course_id
ORDER BY
	average_marks DESC;



/*
Q12. Display student name, course_name, department, and fees
for every student.

You must combine the students and courses tables.

Future concept:
INNER JOIN
*/
SELECT
	s.name,
	c.course_name,
	c.department,
	c.fees
FROM
	students AS s
	INNER JOIN courses AS c ON s.course_id = c.course_id;

/*
Q13. Display the names of students who are enrolled in the
Computer Science course and have marks greater than 80.

Display:
name
marks
course_name

Future concepts:
JOIN + WHERE
*/
SELECT
	s.name,
	s.marks,
	c.course_name
FROM
	students AS s
	JOIN courses AS c ON s.course_id = c.course_id
WHERE
	c.course_name = 'Computer Science'
	AND s.marks > 80;

/*
Q14. Display every student along with the number of subjects
they have records for in the enrollments table.

Students with no enrollment record should also appear.

Future concept:
LEFT JOIN + COUNT() + GROUP BY
*/
SELECT
	s.name,
	COUNT(e.subject) AS subject_enrolled
FROM
	students AS s
	LEFT JOIN enrollments AS e ON s.student_id = e.student_id
GROUP BY
	s.student_id,
	s.name

	-- because { prashant} name ke multiple students 
	-- hote hai isliye student_id bhi group me le li ha 
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	Q15. Find the average subject_marks for every subject.
	
	Display:
	subject
	average_subject_marks
	
	Sort from highest average to lowest.
	
	Future concepts:
	GROUP BY + AVG()
	*/

SELECT
	e.subject,
	AVG(s.marks) AS avg_marks
FROM
	students AS s
	INNER JOIN enrollments AS e ON s.student_id = e.student_id
GROUP BY
	e.subject
ORDER BY
	avg_marks DESC;




	
	/*
	Q16. Find students whose marks are greater than the overall
	average marks of all students.
	
	Display:
	name
	marks
	
	Sort by marks descending.
	
	Future concept:
	SUBQUERY
	*/





	
SELECT
	name,
	marks
FROM
	students
WHERE
	marks > (
		SELECT
			AVG(marks)
		FROM
			students
	)
ORDER BY
	marks DESC;








/*
Q17. Find the student(s) who have the highest marks in the
entire students table.

Do not simply use LIMIT 1.

Future concepts:
MAX() + SUBQUERY
*/



SELECT
	*
FROM
	students
WHERE
	marks = (
		SELECT
			MAX(marks)
		FROM
			students
	);
















/*
Q18. For every student, display:

name
marks
performance

Performance rules:
- marks >= 90  -> 'Excellent'
- marks >= 80  -> 'Very Good'
- marks >= 70  -> 'Good'
- marks >= 60  -> 'Average'
- otherwise    -> 'Needs Improvement'

Sort by marks descending.

Future concept:
CASE
*/

--> kabhi bhi jo row banani hai mat likhna case ke bilkul last me likhna hai

SELECT
	name,
	marks,
	CASE
		WHEN marks >= 90 THEN 'Excellent'
		WHEN marks >= 80 THEN 'Very Good'
		WHEN marks >= 70 THEN 'Good'
		WHEN marks >= 60 THEN 'Average'
		ELSE 'Needs Improvement'
	END AS performance
FROM
	students
ORDER BY
	marks ASC




-- >syntax to be keep in mind

SELECT
    column_name,
    CASE
        WHEN condition THEN 'Your String'
        ELSE 'Other String'
    END AS new_column
FROM table_name;

--> syntax new_column upper kabhi mat likhna just select ke baad













/*
Q19. Find the highest-scoring student from each course_id.

Display:
course_id
name
marks

If you have not learned window functions yet, try solving
this using a subquery first.

Future concepts:
GROUP BY + SUBQUERY
Later: WINDOW FUNCTIONS
*/

select
from students
where marks = (
select ma
)
group by









/*
Q20. Create a report showing each course with:

course_name
department
number_of_students
average_student_marks
highest_student_marks

Include courses that currently have ZERO students.

Sort the result by average_student_marks from highest to
lowest. Courses with no students should still appear.

Future concepts:
LEFT JOIN + GROUP BY + COUNT() + AVG() + MAX()
*/

SELECT
    c.course_name,
    c.department,
    COUNT(s.student_id) AS number_of_students,
    AVG(s.marks) AS average_student_marks,
    MAX(s.marks) AS highest_student_marks
FROM courses AS c
LEFT JOIN students AS s
    ON c.course_id = s.course_id
GROUP BY
    c.course_id,
    c.course_name,
    c.department
ORDER BY average_student_marks DESC;








-- ============================================================
-- OPTIONAL CHALLENGE
-- ============================================================
/*
CHALLENGE:
Find the student who has the highest average subject_marks
across all their enrollment records.

Display:
name
average_subject_marks

This requires combining students and enrollments.

Future concepts:
JOIN + GROUP BY + AVG() + ORDER BY + LIMIT

Try to solve it without looking up the exact query.
*/