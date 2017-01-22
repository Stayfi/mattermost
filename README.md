# mattermost

Docker container to run Mattermost

## Install

You must have a Mysql / MariaDB running with a database named : mattemost

Run your database :
```sh
docker run --name mariadb -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mariadb:latest
docker run -it --link mariadb:myariadb --rm mariadb sh -c 'exec mysql -hmyariadb -P3306 -uroot -pmy-secret-pw'
```

SQL to execute :
```sh
CREATE DATABASE `mattermost` COLLATE 'utf8_general_ci';
CREATE USER 'stayfi'@'%' IDENTIFIED BY 'mattermost';
GRANT ALL ON mattermost.* TO 'stayfi'@'%';
```
## Run Stayfi/mattermost

```sh
docker run --link mariadb:db -v /home/server/mattermost:/mattermost-data -d stayfi/mattermost
```


## With docker-compose :

If you want to save your mattermost's files and config in : /home/server/mattermost
Then, you can backup y with rsync in a crontab

docker-compose.yml :
```sh
mattermost:
    build: ./mattermost
    restart: always
    ports:
      - 80:80
    volumes:
      - /home/server/mattermost:/mattermost-data
    depends_on:
      - db
    environment:
      MM_LISTEN_PORT: 80
      MM_DB_USER: stayfi
      MM_DB_PASSWORD: mattermost
      MM_DB_HOST: db
      MM_DB_PORT: 3306
...
  db:
    image: mariadb:latest
    restart: always
    ports:
      - 3306:3306
    volumes:
      - /var/lib/mysql:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: my-secret-pw
```
