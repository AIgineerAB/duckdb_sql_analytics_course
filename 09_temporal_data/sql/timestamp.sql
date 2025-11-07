/* ==========
   Timestamp 
   functions 
   ========== */

desc staging.train_schedules; -- has TIMESTAMP columns

-- time difference
select 
  scheduled_arrival,
  actual_arrival,
  delay_minutes,
  age(actual_arrival,scheduled_arrival) as delay_interval -- note this will be interval data type
from staging.train_schedules;

-- current timestamp
select current_localtimestamp();

-- truncate a timestamp to a specific precision
select 
  scheduled_arrival,
  date_trunc('hour', scheduled_arrival) as scheduled_arrival_trunc
FROM staging.train_schedules;

-- extract subfield of timestamp
-- show arrival hour in text
SELECT
    scheduled_arrival,
    'kl. ' || extract(
        'hour'
        FROM
            scheduled_arrival
    ) AS scheduled_arrival_hour
FROM
    staging.train_schedules;


