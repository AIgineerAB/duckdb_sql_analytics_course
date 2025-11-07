CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.housing_sales AS (
	SELECT * FROM read_csv_auto('data/housing_sales.csv')
);

CREATE TABLE IF NOT EXISTS staging.neighborhoods AS (
	SELECT * FROM read_csv_auto('data/neighborhoods.csv')
);