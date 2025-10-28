# Setup duckdb

**part 1 - theory**

<a href="https://youtu.be/QBQa1yng5jM" target="_blank">
  <img src="https://github.com/kokchun/assets/blob/main/duckdb_analytics/navigation.png?raw=true" alt="duckdb navigation" width="600">
</a>

**part 2 - setup and coding**

<a href="https://youtu.be/kSEVmKFykRQ" target="_blank">
  <img src="https://github.com/kokchun/assets/blob/main/duckdb_analytics/setup_duckdb_windows_mac.png?raw=true" alt="duckdb setup" width="600">
</a>

## Setup

Follow [this link to install duckdb](https://duckdb.org/docs/installation/?version=stable&environment=cli&platform=macos&download_method=package_manager) on your computer.

<details>
  <summary><b>Mac</b></summary>
Use homebrew to install duckdb by running this command in your terminal

```bash
brew install duckdb
```

> [!NOTE]
> if you don't have homebrew installed, follow [this link to install homebrew](https://brew.sh/).

</details>

<details>
  <summary><b>Windows</b></summary>

Click direct download and unzip so you get the .exe file. Copy the .exe file and go to your programs folder, create a new folder called duckdb and paste the .exe file there. Then add the path to your environment variables so that you can run duckdb from anywhere in the terminal.

<img src="https://github.com/kokchun/assets/blob/main/duckdb_analytics/program_files.png?raw=true" width=300/>

To add environment variable, you should go into system properties &gt; advanced &gt; environment variables &gt; under system variables find path &gt; edit &gt; new &gt; add the path to the duckdb folder you created &gt; ok &gt; ok &gt; ok.

<img src="https://github.com/kokchun/assets/blob/main/duckdb_analytics/search_environment_variable.png?raw=true" width=300/>

<img src="https://github.com/kokchun/assets/blob/main/duckdb_analytics/edit_environment_path.png?raw=true" width=300/>

<img src="https://github.com/kokchun/assets/blob/main/duckdb_analytics/duckdb_path.png?raw=true" width=300/>


</details>

Now go into git bash and run

```bash
duckdb version
```

to see if it worked.

## Bash commands

If you are in windows use git bash, if you are in mac or linux just use the terminal. In visual studio code open up a terminal then you can set the default profile of your terminal to open up in git bash

<img src="https://github.com/kokchun/assets/blob/main/sql/default_profile.png?raw=true" width=300/>

To navigate using bash you have these commands

| Command | Description                              |
| ------- | ---------------------------------------- |
| `cd`    | change the current directory             |
| `cd ..` | go up a directory                        |
| `ls`    | list the contents of a directory         |
| `ls -a` | lists all files including hidden files   |
| `pwd`   | print the current working directory path |
| `<`     | input redirection                        |

> [!NOTE]
> There are many more bash commands, but we'll just cover the most basic ones here so that you can navigate in the computer without a GUI.

## Duckdb CLI

To check that it works, lets go to the terminal, navigate to your local repository and run the following command

```bash
duckdb test_yt.duckdb
```

By doing this it creates a persistent or a file-backed database that is saved on disk when you run any commands. So lets run a few commands

```sql
-- describes structures of database objects
desc;

-- query metadata about the database
SELECT * FROM information_schema.schemata;
SELECT * FROM information_schema.tables;
```

To close down the database connection do `ctrl + D` for mac and `ctrl + C` for windows in the terminal.

## Ingest data

Now we'll ingest data from a csv file into a database called `yt_videos.duckdb`. So start by building up a file structure like this

```
├── data
│   └── aigineer_yt_2024_2025.csv
└── sql
    └── ingest_data.sql
```

write this code in ingest_data.sql

```sql
CREATE TABLE IF NOT EXISTS
  videos AS (
    SELECT * FROM read_csv_auto('data/aigineer_yt_2024_2025.csv')
    );
```

now run the sql script to ingest the data into a duckdb database called `yt_videos.duckdb` using input redirection in bash

```bash
duckdb yt_videos.duckdb < sql/ingest_data.sql
```

> [!NOTE]
> Make sure you are outside data and sql folder when you run the command above.

Finally we'll check that the data is there by selecting all the columns (wildcard selection)

```sql
SELECT * FROM videos;
```

Now close down the database connection and open it up again, then do wildcard selection once more and test out `desc` as well to see that the data is persistent. Close down the database connection, git commit your changes and push it to github.

## Local UI 

As of June 2024 duckdb has a local UI that you can use to interact with your duckdb databases. To start the UI run this command in your terminal

```bash
duckdb -ui yt_videos.duckdb
```

This will open up a local UI in your browser where you can run sql commands and see the results, similar to a jupyter notebook interface, but for duckdb.

<img src="https://github.com/kokchun/assets/blob/main/duckdb_analytics/local_ui_yt_videos.png?raw=true" width=500/>


By default all the sql code you've written in the local UI is saved in .duckdb_history folder in your home directory. But you can only access the SQL code you've written in the local UI from that specific computer.

> [!IMPORTANT]
> even though we'll use this local UI to interact with duckdb databases, we will copy the sql code into sql files in the sql folder of the repository for version control. You should also do this so that you have a history of your sql code in your repository.


## Meta commands

Another way is to use a meta command once you've started a duckdb session you can do `.read ingest_data.sql` to run it. Meta commands or dot commands in duckdb starts with a . and are used to perform variopus administrative and informational tasks in duckdb CLI.

Some other common meta commands

| Meta Command | Description                                  |
| ------------ | -------------------------------------------- |
| `.open`      | Opens a DuckDB database file.                |
| `.read`      | Executes SQL commands from a specified file. |
| `.schema`    | Shows the schema of tables in the database.  |
| `.tables`    | Lists all tables in the connected database.  |
| `.quit`      | Exits the DuckDB CLI.                        |
| `.help`      | Lists all available meta commands.           |

## Gitignore

Add these to your gitignore to instruct git not to track the .wal file of duckdb

```bash
*.duckdb
*.wal
```

Also if you are on a mac you can should also add this to your gitignore

```bash
*.DS_Store
```

## Other videos 📹

- [Duckdb tutorial for beginners - MotherDuck](https://www.youtube.com/watch?v=ZX5FdqzGT1E&t=19s)

## Read more 👓

- [csv import - duckdb docs](https://duckdb.org/docs/data/csv/overview)
- [csv import tips - duckdb docs](https://duckdb.org/docs/data/csv/tips)
- [importing data - duckdb docs](https://duckdb.org/docs/data/overview)
- [describe statement - duckdb docs](https://duckdb.org/docs/sql/statements/describe)
