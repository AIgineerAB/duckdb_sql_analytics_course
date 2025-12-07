import duckdb
from constants import DB_PATH, SQL_PATH

with duckdb.connect(DB_PATH) as conn, open(SQL_PATH / "create_user.sql") as sql_script:
    sql_code = sql_script.read()
    conn.execute(sql_code)
