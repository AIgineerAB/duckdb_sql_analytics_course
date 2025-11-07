/* =========
   Basic CTE
   ========= */
-- use WITH statement

-- generate a table of average sales by child categories
WITH avg_sales AS (
    SELECT 
        category_id,
        round(avg(quantity*unit_price_sek),0) AS average_sales_sek
    FROM staging.sales
    GROUP BY category_id
)
SELECT 
    c.category_name,
    a.average_sales_sek
FROM staging.categories c
JOIN avg_sales a ON a.category_id = c.category_id
WHERE c.parent_category_id NOT NULL -- ignore parent categories
ORDER BY category_name


/* =============
   Recursive CTE 
   ============= */
-- use WITH RECURSIVE statement
-- can reference itself
-- useful for handling hierarchical data

-- generate a table to show the hierarchical relationship of parent and child categories
-- in the generated data, top parent categories are at the top
-- there will be a new column to represent the category level of each category id
WITH RECURSIVE subcategories AS (
    -- this part is called anchor member
    -- this generates the initial result set
    SELECT 
        category_id, 
        category_name, 
        parent_category_id,
        1 AS category_level
    FROM staging.categories
    WHERE parent_category_id IS NULL

    -- append result sets of each wave of recursion
    UNION ALL 

    -- this part is called recursive member which references the current CTE at this wave of recursion
    SELECT 
        c.category_id,
        c.category_name,
        c.parent_category_id
        s.category_level + 1 as category_level
    FROM staging.categories c
    JOIN subcategories s ON c.parent_category_id = s.category_id

)
SELECT *
FROM subcategories