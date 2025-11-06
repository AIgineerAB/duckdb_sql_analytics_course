CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.students AS (
	SELECT * FROM read_csv_auto('data/students.csv')
);

CREATE TABLE IF NOT EXISTS staging.teachers AS (
	SELECT * FROM read_csv_auto('data/teachers.csv')
);

