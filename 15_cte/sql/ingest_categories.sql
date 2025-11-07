CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.categories AS (
	SELECT * FROM read_csv_auto('data/categories.csv')
);

CREATE TABLE IF NOT EXISTS staging.sales AS (
	SELECT * FROM read_csv_auto('data/sales.csv')
);