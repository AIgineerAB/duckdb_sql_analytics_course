/* ================
   Simple view from 
   a single table  
   ================ */

-- create a view of average price by property type
CREATE VIEW staging.average_price_type
AS
SELECT property_type, avg(sale_price_usd) as avg_price
FROM staging.housing_sales
GROUP BY property_type

-- query the view
SELECT * FROM staging.average_price_type

-- modify an existing view
CREATE OR REPLACE VIEW staging.average_price_type
AS
SELECT 
    property_type, 
    avg(sale_price_usd) as avg_price,
    max(date_of_sale) as latest_sales
FROM staging.housing_sales
GROUP BY property_type
ORDER BY property_type

-- list the created views
SELECT *
FROM information_schema.views
WHERE table_schema = 'staging'

-- drop the view
DROP VIEW staging.average_price_type

/* ================
   Simple view from 
   multiple tables  
   ================ */

-- create a view of average price by neighborhood
CREATE VIEW staging.average_price_neighborhoods
AS
SELECT 
  max(n.city) as city,
  n.name,
  avg(h.sale_price_usd) as avg_price
FROM staging.housing_sales h
LEFT JOIN staging.neighborhoods n ON h.neighborhood_id = n.neighborhood_id
GROUP BY n.name
ORDER BY city, n.name

-- query the view
select * from staging.average_price_neighborhoods