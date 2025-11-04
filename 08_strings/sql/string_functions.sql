-- removes leading and trailing spaces 
SELECT
	trim(sql_word, ' ') as trimmed_word,
	trimmed_word[1],
	trimmed_word[-1]
FROM
	staging.sql_glossary;

-- transform character to uppercase
SELECT
	upper(trim(sql_word, ' ')) as trimmed_word,
	trimmed_word[1],
	trimmed_word[-1]
FROM
	staging.sql_glossary;

-- replace 2 or more spaces with 1 space
SELECT
	description, 
	replace(description, '  ', ' ') as cleaned_description
FROM
	staging.sql_glossary;

-- concatenate strings
SELECT 
	concat(upper(trim(sql_word)), ' command') as sql_command
FROM staging.sql_glossary;

-- extract substrings
SELECT 
	substring(trim(sql_word), 1, 5) as extracted_word
FROM staging.sql_glossary

-- reverse characters
SELECT 
	reverse(substring(trim(sql_word), 1, 5)) as reversed_word
FROM staging.sql_glossary

-- find the position of the first occurence of a substring
-- return zero if the substring is not found
SELECT 
	description, 
	instr(description, 'select') as select_position,
	select_position != 0 as about_select
FROM staging.sql_glossary

-- concatenation
SELECT 'fun' || ' joke'
   
   
   



