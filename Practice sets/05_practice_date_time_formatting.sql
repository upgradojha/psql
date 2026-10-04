-- ============================================================
-- PostgreSQL Date & Time — Hands-On Practice Sheet
-- Focus:
--   TO_CHAR()
--   CAST()
--   :: type-cast shorthand
--   TO_DATE()
--   TO_TIMESTAMP()
--   DATE / TIMESTAMP handling
--
-- Instructions:
-- 1. Run the setup section first.
-- 2. Attempt each question yourself.
-- 3. Do not use the same function automatically in every question.
-- 4. Prefer PostgreSQL syntax only.
-- ============================================================


-- ============================================================
-- SECTION 1 — SETUP
-- ============================================================

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id       INTEGER PRIMARY KEY,
    customer_name   TEXT NOT NULL,
    order_amount    NUMERIC(10,2) NOT NULL,
    created_at      TIMESTAMP NOT NULL,
    shipped_at      TIMESTAMP,
    delivery_date   DATE,
    signup_date     DATE,
    raw_order_date  TEXT
);

INSERT INTO orders
(order_id, customer_name, order_amount, created_at, shipped_at, delivery_date, signup_date, raw_order_date)
VALUES
(101, 'Aman',   1499.00, '2025-01-05 09:15:22', '2025-01-06 16:40:10', '2025-01-09', '2024-12-18', '05-01-2025'),
(102, 'Priya',   799.50, '2025-02-14 13:05:47', '2025-02-15 11:20:30', '2025-02-18', '2025-01-10', '14-02-2025'),
(103, 'Rohan',  2599.99, '2025-03-31 23:45:05', '2025-04-01 09:10:15', '2025-04-04', '2024-11-02', '31-03-2025'),
(104, 'Neha',    450.00, '2025-04-07 07:25:19', NULL,                  '2025-04-12', '2025-03-22', '07-04-2025'),
(105, 'Vikash',  3200.00, '2025-05-20 18:10:55', '2025-05-21 08:30:44', '2025-05-24', '2025-02-14', '20-05-2025'),
(106, 'Sneha',    999.99, '2025-06-01 00:05:12', '2025-06-02 14:15:01', '2025-06-06', '2025-05-06', '01-06-2025'),
(107, 'Karan',   1850.75, '2025-07-12 15:30:40', '2025-07-13 10:05:23', '2025-07-16', '2025-04-11', '12-07-2025'),
(108, 'Isha',    2750.25, '2025-08-26 21:55:33', NULL,                  '2025-09-01', '2025-06-28', '26-08-2025'),
(109, 'Rahul',   6100.00, '2025-09-09 10:00:00', '2025-09-10 12:50:19', '2025-09-14', '2025-07-03', '09-09-2025'),
(110, 'Pooja',   1200.00, '2025-10-31 17:45:26', '2025-11-01 09:25:35', '2025-11-05', '2025-08-19', '31-10-2025'),
(111, 'Arjun',   4999.49, '2025-11-11 11:11:11', '2025-11-12 15:45:40', '2025-11-15', '2025-09-09', '11-11-2025'),
(112, 'Meera',    899.00, '2025-12-24 20:20:20', '2025-12-26 07:05:18', '2025-12-29', '2025-10-01', '24-12-2025'),

(113, 'Aman',   2150.00, '2026-01-03 08:40:00', '2026-01-04 18:20:00', '2026-01-07', '2024-12-18', '03-01-2026'),
(114, 'Priya',  1750.75, '2026-02-28 22:10:10', '2026-03-01 10:10:10', '2026-03-04', '2025-01-10', '28-02-2026'),
(115, 'Rohan',  3500.00, '2026-03-15 12:30:45', '2026-03-16 17:30:45', '2026-03-19', '2024-11-02', '15-03-2026'),
(116, 'Neha',   1299.95, '2026-04-21 05:55:05', NULL,                  '2026-04-28', '2025-03-22', '21-04-2026'),
(117, 'Vikash',  499.99, '2026-05-09 14:14:14', '2026-05-10 09:00:00', '2026-05-13', '2025-02-14', '09-05-2026'),
(118, 'Sneha',  7200.00, '2026-06-18 19:35:50', '2026-06-19 11:45:00', '2026-06-23', '2025-05-06', '18-06-2026'),
(119, 'Karan',  1650.20, '2026-07-27 16:05:35', '2026-07-28 13:25:10', '2026-07-31', '2025-04-11', '27-07-2026'),
(120, 'Isha',   2899.00, '2026-08-08 09:08:08', '2026-08-09 12:12:12', '2026-08-12', '2025-06-28', '08-08-2026'),
(121, 'Rahul',  5400.60, '2026-09-17 23:59:59', NULL,                  '2026-09-25', '2025-07-03', '17-09-2026'),
(122, 'Pooja',   999.00, '2026-10-02 06:30:30', '2026-10-03 08:40:40', '2026-10-06', '2025-08-19', '02-10-2026');

-- Quick inspection
SELECT * FROM orders ORDER BY order_id;


-- ============================================================
-- SECTION 2 — PRACTICE QUESTIONS
-- ============================================================
-- Try them in order, but do not mechanically copy the same
-- function into every query.


-- -------------------------
-- LEVEL 1 — RECOGNIZE THE VALUE
-- -------------------------

-- Q1
-- Return order_id and only the date portion of created_at.
-- Use a type conversion, not string formatting.


-- Q2
-- Return order_id and only the time portion of created_at.
-- Keep the result as a time value, not formatted text.


-- Q3
-- Return order_id and created_at, but display created_at as:
-- YYYY-MM-DD.
-- The displayed column should be text.


-- Q4
-- Show each order's creation date as:
-- DD/MM/YYYY.
-- Return order_id and the formatted date.


-- Q5
-- Display created_at as a 24-hour clock:
-- HH24:MI:SS.
-- Do not include the date.


-- Q6
-- Display created_at in a readable form such as:
-- 17 Sep 2026.
-- Return order_id and the formatted value.


-- -------------------------
-- LEVEL 2 — DIFFERENT FORMAT PATTERNS
-- -------------------------

-- Q7
-- Return the weekday abbreviation (Mon, Tue, Wed...) for each
-- order's created_at value.


-- Q8
-- Return the full month name for every order.
-- Example: January, February, March...


-- Q9
-- Return the year and month together as:
-- YYYY-MM
-- Example: 2026-09


-- Q10
-- Return order_id and created_at formatted as:
-- DD Mon YYYY, HH24:MI


-- Q11
-- Show whether each order was created in AM or PM.
-- Return order_id and the AM/PM indicator.


-- Q12
-- Create a report column like:
-- "17 September 2026"
-- using created_at.


-- -------------------------
-- LEVEL 3 — CASTING
-- -------------------------

-- Q13
-- Return order_id and order_amount converted from NUMERIC to INTEGER.
-- Use CAST().


-- Q14
-- Repeat Q13, but use PostgreSQL's :: shorthand instead of CAST().


-- Q15
-- Return created_at converted to DATE.
-- Use the shorthand PostgreSQL cast syntax.


-- Q16
-- Convert signup_date into TEXT.
-- Use standard CAST() syntax.


-- Q17
-- Return order_id, created_at, and delivery_date.
-- Make sure created_at is explicitly converted to DATE and delivery_date
-- remains a DATE.


-- Q18
-- Convert order_id to TEXT using PostgreSQL's :: syntax.
-- Return the original and converted values side by side.


-- -------------------------
-- LEVEL 4 — PARSING TEXT INTO DATES
-- -------------------------

-- Q19
-- raw_order_date contains values in DD-MM-YYYY format.
-- Convert it into a real DATE value.


-- Q20
-- Return order_id and raw_order_date, plus a parsed_date column.
-- The parsed_date must be a DATE.


-- Q21
-- Pretend the following value came from a CSV file:
-- '21/04/2026'
-- Convert it into a PostgreSQL DATE.


-- Q22
-- Pretend this timestamp arrived from an external API:
-- '09-05-2026 14:14:14'
-- Convert it into a TIMESTAMP.


-- Q23
-- Parse this value:
-- '2026|08|26 21:55:33'
-- into a TIMESTAMP.
-- Identify the correct format pattern.


-- -------------------------
-- LEVEL 5 — REAL DATA DISPLAY
-- -------------------------

-- Q24
-- Produce a customer-facing order label:
-- Order #109 - 09 Sep 2025
-- Use order_id and created_at.


-- Q25
-- Produce a time-of-day label for every order:
-- "10:00 AM", "02:14 PM", etc.
-- Use a 12-hour clock.


-- Q26
-- Display each order as:
-- "September 2026"
-- using created_at.


-- Q27
-- Show order_id, customer_name, and a formatted delivery date:
-- DD Mon YYYY.


-- Q28
-- Create a report column:
-- "Placed on Tuesday"
-- where Tuesday changes according to created_at.


-- -------------------------
-- LEVEL 6 — DATE-BASED REASONING
-- -------------------------

-- Q29
-- Find orders created before noon.
-- Return order_id, customer_name, created_at.
-- Do not use TO_CHAR() for the comparison.


-- Q30
-- Find orders whose delivery_date falls in the same calendar year
-- as their created_at timestamp.


-- Q31
-- Find orders created during the first quarter (January-March)
-- of 2026.
-- Use a date/time function rather than converting the timestamp to text.


-- Q32
-- Return the first and last order creation dates in the table.
-- Think about the difference between DATE and TIMESTAMP.


-- Q33
-- Find orders where shipped_at is missing.
-- Return order_id and created_at.
-- This tests NULL handling with timestamps.


-- Q34
-- For every order that has shipped, display how many calendar days
-- separate created_at and delivery_date.
-- Use date arithmetic, not formatted strings.


-- -------------------------
-- LEVEL 7 — REPORTING
-- -------------------------

-- Q35
-- Count how many orders were created in each calendar month.
-- Keep the grouping value suitable for chronological ordering.


-- Q36
-- Show monthly order count for 2026 only.
-- Display the month as:
-- Jan 2026
-- Feb 2026
-- etc.
-- Keep the sorting chronological.


-- Q37
-- Show the total order amount for each calendar year.
-- Return:
-- year, total_amount
-- The year should be derived from created_at.


-- Q38
-- Find the number of orders created on each weekday.
-- Display the weekday name and order count.
-- Sort by the natural weekday order rather than alphabetically.


-- Q39
-- Find the busiest month by number of orders.
-- Return the calendar month and its order count.


-- -------------------------
-- LEVEL 8 — MIXED REALISTIC TASKS
-- -------------------------

-- Q40
-- Create a customer-facing report containing:
-- order_id
-- customer_name
-- formatted order date as DD Mon YYYY
-- formatted order time as HH24:MI
-- order_amount


-- Q41
-- Some incoming data is stored in raw_order_date as text.
-- Build a query that shows:
-- order_id
-- raw_order_date
-- parsed DATE
-- formatted parsed date as YYYY/MM/DD


-- Q42
-- Find orders created during business hours (09:00 through 18:00).
-- Compare the actual time value, not formatted text.


-- Q43
-- Find orders created on the last day of their month.
-- Hint: think about DATE_TRUNC() and interval/date arithmetic.


-- Q44
-- For each order, show:
-- order_id
-- created_at
-- the first day of the month containing created_at
-- the last day of that month


-- Q45
-- Show the order amount rounded to an integer and also formatted
-- as text with two decimal places.
-- Return both versions so you can compare type conversion
-- with display formatting.


-- Q46
-- Find customers who placed an order in both 2025 and 2026.
-- Return each qualifying customer only once.


-- Q47
-- For each order, classify the creation time into:
-- Morning   = 05:00–11:59
-- Afternoon = 12:00–16:59
-- Evening   = 17:00–20:59
-- Night     = everything else
-- Return order_id, created_at, time_period.


-- Q48
-- Create an audit-style output containing:
-- order_id
-- created_at
-- created_at as DATE
-- created_at as formatted text "YYYY-MM-DD HH24:MI:SS"
-- Make sure you understand why the last two columns have different
-- data types.


-- -------------------------
-- LEVEL 9 — CHALLENGE
-- -------------------------

-- Q49
-- Find the month with the highest total order amount in 2026.
-- Return:
-- month
-- total_amount
-- Keep month sorting chronological during the calculation.


-- Q50
-- Build a single report for 2026 containing:
-- calendar month
-- number of orders
-- total order amount
-- earliest order time
-- latest order time
-- display the month as "Mon YYYY"
-- Sort from January to December.
-- Use proper date/timestamp values for grouping and ordering,
-- and formatting only for the final display.


-- ============================================================
-- SECTION 3 — OPTIONAL SELF-CHECK QUERIES
-- ============================================================
-- These are NOT answers to Q1-Q50. They are small reference
-- experiments for when you get stuck.
-- Uncomment and run one at a time.


-- SELECT created_at::date FROM orders;

-- SELECT CAST(created_at AS date) FROM orders;

-- SELECT TO_CHAR(created_at, 'YYYY-MM-DD') FROM orders;

-- SELECT TO_DATE('29-09-2026', 'DD-MM-YYYY');

-- SELECT TO_TIMESTAMP(
--     '29-09-2026 14:35:20',
--     'DD-MM-YYYY HH24:MI:SS'
-- );

-- SELECT DATE_TRUNC('month', created_at) FROM orders;


-- ============================================================
-- END
-- ============================================================
