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
select 
  scheduled_arrival,
  concat('kl. ', extract('hour' FROM scheduled_arrival)) as scheduled_arrival_hour
FROM staging.train_schedules;

-- convert string to timestamp
select 
	Date,
	strptime('2025-12-31', '%Y-%m-%d') as Date_Timestamp
from staging.sweden_holidays;

