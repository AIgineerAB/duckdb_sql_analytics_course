/* ===========================
   Pattern matching with 
   LIKE operator and wildcards
   =========================== */

-- use LIKE operator in WHERE clause to filter rows
-- LIKE operator is often used with wildcards to search for a pattern
-- wildcard % matches 0 or more characters  
SELECT
  	example,
  	lower(trim(example)) as cleaned_example
FROM
	staging.sql_glossary
WHERE
	cleaned_example LIKE 'select%';

-- wildcard _ represents one character
SELECT
  	example,
  	trim(example) as cleaned_example
FROM
	staging.sql_glossary
WHERE
	cleaned_example LIKE 'S_LECT%';


/* ===========================
   Pattern matching with 
   regular expression
   =========================== */

-- use regexp_matches function with WHERE calsue to filter rows
-- to filter rows starting with c
SELECT
  	lower(trim(description)) as cleaned_description
FROM
	staging.sql_glossary
WHERE 
	regexp_matches(cleaned_description, '^c');

-- to filter rows starting with C or S
SELECT
  	trim(description) as cleaned_description
FROM
	staging.sql_glossary
WHERE 
	regexp_matches(cleaned_description, '^[CS]');

-- \b makes it match exactly select word (for example, not selects)
SELECT
	lower(description)
FROM
	staging.sql_glossary
WHERE
	regexp_matches (lower(description), 'select\b')

-- [a-f] matches a range of characters
-- ^[a-f] means starting with characters a to f
SELECT
	lower(trim(description)) as cleaned_description
FROM
	staging.sql_glossary
WHERE 
  	regexp_matches (cleaned_description, '^[a-f]')

-- [^a-f] matches any character NOT in the range of a-f
-- ^[^a-f] means starting with characters NOT in the range of a-f
SELECT
	lower(trim(description)) as cleaned_description
FROM
	staging.sql_glossary
WHERE 
  	regexp_matches (cleaned_description, '^[^a-f]')

-- use regexp_replace function to replace a pattern with a string
-- ' +' matches 1 or more spaces
-- 'g' is the global flag to replace all occurences of the pattern
SELECT
	description,
	regexp_replace (description, ' +', ' ', 'g') AS cleaned_description,
FROM
	staging.sql_glossary;








