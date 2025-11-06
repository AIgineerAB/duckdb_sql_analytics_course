-- replace the title with upper case 
SELECT
    * REPLACE (UPPER(title) as title, UPPER(name) as Name)
FROM
    read_csv ('data/books.csv');