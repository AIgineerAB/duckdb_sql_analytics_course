# data load tool (dlt) 

Data load tool (dlt) from dlthub is a fantastic tool for EL and ingesting data from different sources into different destinations. We'll use dlt to extract and load data from sakila sqlite database into a duckdb database. The reason for using dlt is that both you get to learn how to use dlt, and also that our previous approach doesn't work with evidence dashboards as it was only attaching the database and not actually loading the data into the duckdb database. 

We will use [sakila database from kaggle](https://www.kaggle.com/datasets/atanaskanev/sqlite-sakila-sample-database?resource=download). It's a fictious database representing DVD rental store created originally by MySQL for practicing SQL.  


TODO: video about dlt

## Setup

Run the following uv command to install dlt and all other necessary dependencies.

```bash
uv add dlt 
```



