# Installation 

### 1. Setup your mysql database

`docker run -d --restart always -p 3306:3306 --name wordpress-db -v wordpress-db:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root-pwd -e MYSQL_DATABASE=blog -e MYSQL_USER=mute -e MYSQL_PASSWORD=user-pwd mysql`

### 2. Build your custom WordPress [`Dockerfile`](./Dockerfile)

`docker build . -t custom-wordpress`

### 3. Create your web site with your docker image

`docker run -d --restart always -p 8888:80 --name wordpress -e WORDPRESS_DB_HOST=your-db-host -e WORDPRESS_DB_NAME=blog -e WORDPRESS_DB_USER=mute -e WORDPRESS_DB_PASSWORD=user-pwd custom-wordpress`