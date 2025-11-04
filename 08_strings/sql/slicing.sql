/* duckdb specific, many other SQL dialects don't have these */

-- index
SELECT
	sql_word,
	sql_word[0],  -- count from 1
	sql_word[1], 
	sql_word[-1], 
FROM
	staging.sql_glossary;

-- slicing
SELECT
	sql_word,
	sql_word[:2],
	sql_word[2:5]
FROM
	staging.sql_glossary;

