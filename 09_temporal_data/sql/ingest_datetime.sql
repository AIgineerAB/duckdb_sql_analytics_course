CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.class_schedules AS (
	SELECT * FROM read_csv_auto('data/class_schedules.csv')
);

CREATE TABLE IF NOT EXISTS staging.sweden_holidays AS (
	SELECT * FROM read_csv_auto('data/sweden_holidays.csv')
);

