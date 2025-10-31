# Filtering data

**part 1 - theory**

<a href="https://youtu.be/DkhUGfYepw0" target="_blank">
  <img src="https://github.com/kokchun/assets/blob/main/duckdb_analytics/filter_data.png?raw=true" alt="filtering data" width="600">
</a>

<!-- 
**part 2 - coding**

<a href="https://youtu.be/0w-V8hGgD-A" target="_blank">
  <img src="https://github.com/kokchun/assets/blob/main/sql/05_a_filter_data.png?raw=true" alt="filtering data" width="600">
</a>  -->





We use same data as in last lecture, so just copy the duckdb database file to this folder.

## Ingest data

Create an account on kaggle and download this [dataset on data engineering job salaries](https://www.kaggle.com/datasets/chopper53/data-engineer-salary-in-2024/data).

Use input redirection to read the SQL file and use it as input for duckdb database

```bash
 duckdb data/salaries.duckdb < sql/ingest_salaries.sql
```


## Other videos 📹

## Read more 👓

From duckdb documentation

- [where clause ](https://duckdb.org/docs/sql/query_syntax/where)
- [filter clause](https://duckdb.org/docs/sql/query_syntax/filter)
- [limit and offset clauses](https://duckdb.org/docs/sql/query_syntax/limit)
- [case statement](https://duckdb.org/docs/sql/expressions/case)
- [in operator](https://duckdb.org/docs/sql/expressions/in)
- [logical operators](https://duckdb.org/docs/sql/expressions/logical_operators)
- [comparison operators](https://duckdb.org/docs/sql/expressions/comparison_operators)