import duckdb
from constants import DB_PATH

username = input("Enter username:")
password = input("Enter password:")

with duckdb.connect(DB_PATH) as conn:
    result = conn.execute(
        "SELECT * FROM users WHERE username = ? AND password = ?", parameters = (username, password)
    )

    if result.fetchall():
        print("login success")
        print("You can now eat all ice cream you want")
    else:
        print("another failure, try again")


# ';DROP TABLE users;--

# alice' OR '1'='1
# ' OR '1'='1' --
