/* Use case 1: generate row number */

-- create row number
SELECT 
  row_number() OVER () as employee_id,
  *
FROM data_jobs;

-- create row number within job_title
SELECT 
  row_number() OVER () as employee_id,
  job_title || '_' || row_number () OVER (PARTITION BY job_title ORDER BY salary_in_usd DESC) job_title_id,
  job_title,
  salary_in_usd
FROM data_jobs;

/* Use case 2: rank */

-- rank 
SELECT 
  row_number() OVER () as employee_id,
  job_title,
  rank() OVER (PARTITION BY job_title ORDER BY salary_in_usd DESC) as salary_rank, --with gap
  dense_rank() OVER (PARTITION BY job_title ORDER BY salary_in_usd DESC) as salary_rank, --without gap
  job_title,
  salary_in_usd
FROM data_jobs;

-- percentile within a partition
SELECT 
  row_number() OVER () as employee_id,
  job_title,
  cume_dist(ORDER BY salary_in_usd) OVER(PARTITION BY job_title),
  salary_in_usd
FROM data_jobs
ORDER BY job_title, salary_in_usd;

-- pick one value within a partition
SELECT 
  row_number() OVER () as employee_id,
  job_title,
  salary_in_usd,
  first_value(salary_in_usd) OVER (PARTITION BY job_title ORDER BY salary_in_usd DESC) as highest_salary,
FROM data_jobs;

/* Use case 3: showing aggregated value for each row */

-- with aggregation function
SELECT 
  row_number() OVER () as employee_id,
  job_title,
  salary_in_usd,
  AVG(salary_in_usd) OVER (PARTITION BY job_title) as avg_salary,
  MAX(salary_in_usd) OVER (PARTITION BY job_title) as max_salary,
  MIN(salary_in_usd) OVER (PARTITION BY job_title) as min_salary,
  MEDIAN(salary_in_usd) OVER (PARTITION BY job_title) as median_salary,
FROM data_jobs;