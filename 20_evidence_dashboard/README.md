# Evidence

You should copy over the sakila.duckdb database file that you generated when following the 19_dlt lecture. Follow the video and I'll explain where to place it and how to setup evidence to create a dashboard over the sakila data.

## Setup

To work with evidence, we need to install nodejs **version 22**. 

1. [follow the instructions here to install nodejs22](https://nodejs.org/en/download)

    <img src="https://github.com/kokchun/assets/blob/main/js/install_node.png?raw=true" alt="install node" width="600">

    Pick the right version for your operating system. Note that evidence won't work with newer nodejs versions as of this writing (2025-11).

2. Check that your installation works by running 
    ```bash
    node -v
    ```
    The output should be something like `v22.x.x`

3. Now install evidence through the vscode extension 

    <img src="https://github.com/kokchun/assets/blob/main/duckdb_analytics/evidence_vscode.png?raw=true" alt="install node" width="600">

4. Create an empty folder for your evidence project.

5. Start a new evidence project by opening the command palette (Ctrl+Shift+P) and typing `Evidence: New Project`. Pick your empty folder.

6. Make sure to gitignore the following 

    - .evidence

7. Go to the folder where your evidence project is located through your terminal and run 

    ```bash
    npm install
    ```

    This will install all dependencies needed for evidence to work. 

8. Now run 
    ```bash
    npm run sources
    ```
    to setup the data sources defined under sources folder.

9.  Now you can finally run 
    ```bash
    npm run dev
    ```
    to start the evidence server. 


Follow the video in this lecture to see how to create this particular dashboard project with sakila data. We'll pick the sakila.duckdb file from the dlt lecture.  