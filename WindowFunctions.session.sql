-- remove the previous table if it exists
DROP TABLE IF EXISTS stadium;




-- create the table
CREATE TABLE
  stadium (
    id INT PRIMARY KEY,
    visit_date date UNIQUE NOT NULL,
    people INT NOT NULL
  );


-- insert sample data
INSERT INTO
  stadium (id, visit_date, people)
VALUES
  (1, '2017-01-01', 10),
  (2, '2017-01-02', 109),
  (3, '2017-01-03', 150),
  (4, '2017-01-04', 99),
  (5, '2017-01-05', 145),
  (6, '2017-01-06', 1455),
  (7, '2017-01-07', 199),
  (8, '2017-01-09', 188),
  (9, '2017-01-10', 120),
  (10, '2017-01-11', 95),
  (11, '2017-01-12', 130),
  (12, '2017-01-13', 140),
  (13, '2017-01-14', 160),
  (14, '2017-01-15', 80),
  (15, '2017-01-16', 200),
  (16, '2017-01-17', 210),
  (17, '2017-01-18', 220),
  (18, '2017-01-19', 230),
  (19, '2017-01-20', 70),
  (20, '2017-01-21', 110);

SELECT * FROM stadium;
-- view all records

WITH stadium_table AS (
    SELECT
        id,
        visit_date,
        people,

        LEAD(id, 1) OVER (ORDER BY id) AS next_id,
        LEAD(id, 2) OVER (ORDER BY id) AS third_id,

        LEAD(people, 1) OVER (ORDER BY id) AS next_people,
        LEAD(people, 2) OVER (ORDER BY id) AS third_people

    FROM stadium
)
SELECT *
FROM stadium_table

 WHERE next_id = id + 1
  AND third_id = id + 2
  AND people >= 100
  AND next_people >= 100
  AND third_people >= 100
;
