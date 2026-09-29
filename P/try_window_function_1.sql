-- practice note:
-- the questions below are intentionally not included in this sql file.
-- use the sales table to solve them yourself.
-- basic sql
-- 1. display all records from the sales table.
SELECT
    *
FROM
    sales
;




-- 2. display only customer_name, product_name, sales, and order_date.
SELECT
    customer_name,
    product_name,
    sales,
    order_date
FROM
    sales
;




-- 3. display all sales where sales is greater than 5000.
SELECT
    *
FROM
    sales
WHERE
    sales > 5000
;




-- 4. display all completed orders.
SELECT
    *
FROM
    sales
WHERE
    order_status = 'completed'
;




-- 5. display all sales from the north region.
SELECT
    *
FROM
    sales
WHERE
    region = 'north'
;




-- 6. display all records ordered by sales from highest to lowest.
SELECT
    *
FROM
    sales
ORDER BY
    sales DESC
;




-- 7. display the top 5 highest-value sales.
SELECT
    *
FROM
    sales
ORDER BY
    sales DESC
LIMIT
    5
;




-- 8. find the total number of sales records.
SELECT
    COUNT(*) AS total_sales
FROM
    sales
;




-- aggregate functions
-- 9. find the total sales of all orders.
SELECT
    SUM(sales) AS total_sales
FROM
    sales
;




-- 10. find the average sales value.
SELECT
    ROUND(AVG(sales), 2) AS avg_sales
FROM
    sales
;




-- 11. find the minimum and maximum sales value.
SELECT
    MIN(sales) AS min_value_sales,
    MAX(sales) AS max_value_sales
FROM
    sales
;




-- 12. find the total sales for each product_name.
SELECT
    product_name,
    SUM(sales)
FROM
    sales
GROUP BY
    product_name
;




-- 13. find the total sales for each region.
SELECT
    region,
    SUM(sales)
FROM
    sales
GROUP BY
    region
;




-- 14. find the total sales for each category.
SELECT
    category,
    SUM(sales)
FROM
    sales
GROUP BY
    category
;




-- 15. find the number of orders for each order_status.
SELECT
    order_status,
    COUNT(*)
FROM
    sales
GROUP BY
    order_status
;




-- 16. find the total sales for each customer and display the result from highest to lowest.
SELECT
    customer_name,
    SUM(sales)
FROM
    sales
GROUP BY
    customer_name
ORDER BY
    SUM(sales) DESC
;




-- window function basics
-- 17. calculate the total sales of the entire table using a window function while keeping every individual sale visible.
SELECT
    *,
    SUM(sales) OVER () AS total_sales
FROM
    sales
;




-- 18. calculate the total sales for each product_name using a window function while keeping sale_id, customer_name, and order_date visible.
SELECT
    sale_id,
    customer_name,
    order_date,
    SUM(sales) OVER (
        PARTITION BY
            product_name
    ) AS total_sales
FROM
    sales
;




-- 19. calculate the average sales for each category using a window function.
SELECT
    category,
    AVG(sales) OVER (
        PARTITION BY
            category
    ) AS total_sales
FROM
    sales
;




-- 20. calculate the total sales for each region using a window function.
SELECT
    region,
    SUM(sales) OVER (
        PARTITION BY
            region
    ) AS regional_sales
FROM
    sales
;




-- partition by + order by
-- 21. for every sale, show the total sales of its region alongside the individual sale.
SELECT
    region,
    sales,
    SUM(sales) OVER (
        PARTITION BY
            region
    ) AS regional_sales
FROM
    sales
;




-- 22. for every sale, show the average sales of its category alongside the individual sale.
SELECT
    sales,
    AVG(sales) OVER (
        PARTITION BY
            category
    ) AS category_sales
FROM
    sales
;




-- 23. rank all sales from highest sales to lowest sales using a ranking window function.
SELECT
    *,
    RANK() OVER (
        ORDER BY
            sales DESC
    ) AS sales_rank
FROM
    sales
;




-- 24. rank sales separately inside each category, with the highest sale receiving rank 1.
SELECT
    category,
    customer_name,
    sales,
    RANK() OVER (
        PARTITION BY
            category
        ORDER BY
            sales DESC
    ) AS category_sales_rank
FROM
    sales
;




-- 25. rank sales separately inside each region, with the highest sale receiving rank 1.
SELECT
    *,
    RANK() OVER (
        PARTITION BY
            region
        ORDER BY
            sales DESC
    ) AS regional_sales_rank
FROM
    sales
;




-- 26. assign a row number to every sale after sorting the complete dataset by sales descending.
SELECT
    *,
    ROW_NUMBER() OVER (
        ORDER BY
            sales DESC
    ) AS row_number_ranking
FROM
    sales
;




-- 27. assign a row number separately for each category, with the highest sale appearing first in each category.
SELECT
    *,
    ROW_NUMBER() OVER (
        PARTITION BY
            category
        ORDER BY
            sales DESC
    ) AS category_sales_ranking
FROM
    sales
;




-- 28. find the highest-selling order for every region using a window function.
WITH
    rank_sales AS (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY
                    region
                ORDER BY
                    sales DESC
            ) AS ranking_rows
        FROM
            sales
    )
SELECT
    *
FROM
    rank_sales
WHERE
    ranking_rows = 1
;




-- 29. find the highest-selling order for every product.
WITH
    ranked_sales AS (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY
                    product_name
                ORDER BY
                    sales DESC
            ) AS product_sales_ranking
        FROM
            sales
    )
SELECT
    *
FROM
    ranked_sales
WHERE
    product_sales_ranking = 1
;

-- 30. show each sale together with the total sales of its product and calculate what percentage of that product's total sales the individual sale represents.
-- window frame

-- select*from sales;   

-- WITH
--     sales_percentage AS (
--         SELECT
--             product_name,
--             SUM(sales) AS total_sales
--         FROM
--             sales
--         GROUP BY
--             product_name
--     )
-- SELECT product_name, total_sales,
--     round(sales / total_sales * 100 "%" , 2)
-- FROM
--     sales_percentage
-- ;


select 
* from sales;

SELECT
    sale_id,
    product_name,
    sales,
    SUM(sales) OVER (
        PARTITION BY product_name
    ) AS total_sales,
    ROUND(
        sales * 100.0 / SUM(sales) OVER (
            PARTITION BY product_name
        ),
        2
    ) || '%' AS its_percentage
FROM sales;





-- 31. calculate a running total of sales ordered by order_date.


select sale_id, product_name, order_date, sales, 
    sum(sales) over(
        order by order_date 
        rows between unbounded preceding
        and current row
    ) as running_total

from sales;

-- 32. calculate a running total of sales separately for each category.


select 
    sale_id, 
    product_name,
    category, 
    sales,
    sum(sales) over(
        partition by category 
        order by order_date
        rows between unbounded preceding
        and current row
        ) as total_categoy_running_sales
     
from sales;



-- 33. calculate the sum of the current row and the two rows before it using a window frame.

select 
    sale_id, 
    product_name,
    category, 
    sales,
    sum(sales) over(
        rows between 2 preceding
        and current row
        ) as current_and_last_2_of_that
from sales;


-- 34. calculate the sum of the current row and the two rows after it.
-- 35. calculate the sum from the current row through all following rows.
-- 36. calculate the sum from the first row through the current row using an explicit frame.
-- 37. calculate the sum using rows between 1 preceding and 1 following.
-- 38. calculate the average using the current row and the two preceding rows.
-- 39. calculate the average using the current row and the two following rows.
-- 40. for each category, calculate a running total ordered by order_date.
-- 41. for each region, calculate a running total ordered by order_date.
-- 42. for each product, calculate a running total ordered by order_date.
-- 43. calculate a moving average using the current row, one preceding row, and one following row.
-- 44. calculate a cumulative sales total from unbounded preceding to the current row.
-- 45. calculate the remaining sales from the current row to unbounded following.