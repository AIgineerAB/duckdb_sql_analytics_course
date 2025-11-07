# Set operations

We will use [sakila database from kaggle](https://www.kaggle.com/datasets/atanaskanev/sqlite-sakila-sample-database?resource=download). It's a fictious database representing DVD rental store created originally by MySQL for practicing SQL.  

**Part 1 - set operations theory**

<a href="https://youtu.be/16uxJNUeSJ8" target="_blank">
  <img src="https://github.com/kokchun/assets/blob/main/duckdb_analytics/set_theory.png?raw=true" alt="set operations in duckdb" width="600">
</a>

<br>
<br>

**Part 2 - set operations coding**

<a href="https://youtu.be/yYQDSBJrDwg" target="_blank">
  <img src="https://github.com/kokchun/assets/blob/main/duckdb_analytics/set_tutorial.png?raw=true" alt="set operations in duckdb" width="600">
</a>



<br>
<br>

**Part 3 - set operations with sakila database coding**

<a href="https://youtu.be/se7XRV4FJ78" target="_blank">
  <img src="https://github.com/kokchun/assets/blob/main/duckdb_analytics/set_sakila.png?raw=true" alt="set operations in duckdb" width="600">
</a>


## Setup

Donwload the sakila database and paste it into data folder. Then run this command 

```bash
duckdb sakila.duckdb < sql/load_sakila.sql
```

to get the data from the sqlite database into a duckdb database. Make sure that you have load_sakila.sql as I have written it in this repo.

## Other videos 📹

## Read more 👓

From duckdb documentation
- [set operations](https://duckdb.org/docs/sql/query_syntax/setops.html)

Other
- [set operations - wikipedia](https://en.wikipedia.org/wiki/Set_(mathematics)#Basic_operations)
- [analyze sqlite databases in duckdb](https://motherduck.com/blog/analyze-sqlite-databases-duckdb/)
