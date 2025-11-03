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


-- extract substrings

-- reverse characters

-- find the position of the first occurence of a substring

   
   
   
   



