/* ================
   Check data types 
   ================ */

-- check column data types of the generated tables
-- you can also check the icon next to the column names for the data types
-- note that different database systems have different data types to store temporal data
desc staging.sweden_holidays; -- has DATE columns
desc staging.train_schedules; -- has TIMESTAMP columns

/* ===============
   Date/Timestamp 
   operators 
   =============== */

-- addition and subtraction of days
select 
	Date,
	Date + interval 5 day
from staging.sweden_holidays;

select 
	Date,
	Date - interval 5 day
from staging.sweden_holidays;

-- the new column is of TIMESTAMP data type
desc
select 
	Date,
	Date - interval 5 day
from staging.sweden_holidays;

/* ==============
   Date functions 
   ============== */

-- show today
select today()

-- show difference between two dates
select 
	*,
	today() as Today,
	date_diff('day', Date, Today) as Days_Diff
from staging.sweden_holidays;

-- show the weekday
select 
	Date,
  	dayname(Date) as Weekday_Name
from staging.sweden_holidays;

-- pick the latest from two dates
select 
	*,
	today() as Today,
	greatest(Date, Today) as Later_Day
from staging.sweden_holidays;

-- convert date to string
select 
	Date,
	strftime(Date, '%d/%m/%Y') as Date_String
from staging.sweden_holidays;

/* ==========
   Timestamp 
   functions 
   ========== */

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








