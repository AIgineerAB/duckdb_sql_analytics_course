-- run this script 
-- duckdb < sql/update_csv_ternary.sql

COPY (
    SELECT
        *,
        CASE
            WHEN year < 1900 THEN 'old'
            ELSE 'new'
        END AS age_category
    FROM
        'data/books.csv'
) TO 'data/updated_books.csv';