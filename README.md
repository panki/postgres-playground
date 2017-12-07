# Postgres playground
## How to start
1) Clone repository
2) Add postgres as alias for localhost in /etc/hosts
    ```bash
    > cat /etc/hosts
    127.0.0.1 localhost postgres
    ```
3) Start container
    ```bash
    ./docker-compose up
    ```
4) Connect to postgres using credentials
    ```bash
    POSTGRES_USER: user
    POSTGRES_PASSWORD: pass
    POSTGRES_DB: example
    ```
    and execute `initdb.sql` 

