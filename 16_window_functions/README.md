# Window functions

- use multiple rows to calculate the value for *EACH ROW*
- use OVER clause
- for example, window function can by used to produce the column *avg_salary_by_department* below: 

| employee | department | salary | avg_salary_by_department |
|---------|------------|--------|--------------------------|
| Alice   | Sales      | 40 000 | 42 500                   |
| Bob     | Sales      | 45 000 | 42 500                   |
| Carol   | IT         | 50 000 | 52 500                   |
| Dave    | IT         | 55 000 | 52 500                   |
| Emma    | HR         | 38 000 | 38 000                   |

- while aggregate functions collapses multiple rows into one row
- aggregation functions use GROUP BY clause
- for example, aggregation function can be used to produce the summary statistics by department below: 

| department | avg_salary |
|-----------|-----------:|
| Sales     | 42 500     |
| IT        | 52 500     |
| HR        | 38 000     |


## Read more 👓

From duckdb documentation
- [Window functions](https://duckdb.org/docs/stable/sql/functions/window_functions)

Other sources
- [Window functions](https://www.geeksforgeeks.org/sql/window-functions-in-sql/)
