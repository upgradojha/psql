-- create the scores table
create table scores (
    student varchar(50),
    subject varchar(50),
    marks integer
);

-- insert the data
insert into scores (student, subject, marks)
values
    ('Aman', 'Maths', 82),
    ('Aman', 'Science', 74),
    ('Bela', 'Maths', 91),
    ('Bela', 'Science', 88),
    ('Chirag', 'Maths', 67),
    ('Chirag', 'Science', 74),
    ('Divya', 'Maths', 91),
    ('Divya', 'Science', 59);

-- display all records
select * from scores;

SELECT SUM(CASE WHEN marks >= 85 THEN 1 ELSE 0 END)
FROM scores;

SELECT CASE WHEN marks >= 75 THEN 'Good' ELSE 'Other' END AS band,
       COUNT(*) AS cnt
FROM scores
GROUP BY band
HAVING band = 'Other';

SELECT student FROM scores
WHERE subject = 'Maths'
  AND marks > (SELECT AVG(marks) FROM scores
               WHERE subject = 'Maths');

               SELECT student FROM scores
                  WHERE marks < 70;

  SELECT student, SUM(marks) AS total
  FROM scores GROUP BY student;

   SELECT student, SUM(marks) AS total
  FROM scores GROUP BY student;

  WITH t AS (
  SELECT student, SUM(marks) AS total, AVG(marks)
  FROM scores GROUP BY student
)
SELECT COUNT(*) FROM t
WHERE total > (SELECT AVG(total) FROM t);


SELECT student,
  RANK() OVER (PARTITION BY subject ORDER BY marks DESC) AS r
FROM scores
WHERE subject = 'Maths';

SELECT student,subject,
  ROW_NUMBER() OVER (PARTITION BY subject ORDER BY marks DESC) AS rn
FROM scores;

SELECT student, subject,
  MAX(marks) OVER (PARTITION BY student) - marks AS gap
FROM scores;

SELECT student, subject,
  SUM(marks) OVER (PARTITION BY student ORDER BY subject) AS running
FROM scores;

