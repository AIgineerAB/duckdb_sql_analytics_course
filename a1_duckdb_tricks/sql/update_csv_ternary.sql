-- run this script 
-- duckdb < sql/update_csv_ternary.sql

COPY (
    SELECT
        *,
        IF(year < 1900, 'old', 'new') AS age_category
    FROM
        'data/books.csv'
) TO 'data/updated_books.csv';