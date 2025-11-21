import dlt
from dlt.sources.sql_database import sql_database
from pathlib import Path

SQLITE_PATH = Path(__file__).parent / "sqlite-sakila.db"
DUCKDB_PATH = Path(__file__).parent / "sakila.duckdb"


source = sql_database(credentials=f"sqlite:///{SQLITE_PATH}", schema="main")

# pipeline writing to a DuckDB file
pipeline = dlt.pipeline(
    pipeline_name="sakila_sqlite_to_duckdb",
    destination=dlt.destinations.duckdb(str(DUCKDB_PATH)),
    dataset_name="staging",
)

# run the load (this captures ALL tables automatically)
load_info = pipeline.run(source, write_disposition="replace")

print(load_info)
