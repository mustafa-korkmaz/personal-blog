Yet another WordPress installation repository :)  
This repository shows the steps that I used for pusblishing my personal website.  

**Features**
- Pre-defined plugins
- Pre-defined themes
- Deploy with either `docker run` or `docker compose`
- Reverse proxy and ssl offloading support with [nginx-proxy](https://github.com/nginx-proxy/nginx-proxy)

# Installation 

### 1. Build your custom WordPress [`Dockerfile`](./Dockerfile)

`docker build . -t custom-wordpress`

### 2. Set up your mysql database

`docker run -d --restart always -p 3306:3306 --name wordpress-db -v wordpress-db:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root-pwd -e MYSQL_DATABASE=blog -e MYSQL_USER=mute -e MYSQL_PASSWORD=user-pwd mysql`

### 3. Create your web site with your docker image

`docker run -d --restart always -p 8888:80 --name wordpress -e WORDPRESS_DB_HOST=your-db-host -e WORDPRESS_DB_NAME=blog -e WORDPRESS_DB_USER=mute -e WORDPRESS_DB_PASSWORD=user-pwd custom-wordpress`

### (Optional) Creating your environment using docker-compose.yml

Once you completed step 1 and pushed your image to a container registry, [`docker-compose.yml`](./docker-compose.yml)  file can be used as another solution.  
- Set your respective environment variables in [`.env`](./.env)  
- Set `DOCKER_NETWORK` env var in order to use a pre-existing network on docker
- `VIRTUAL_HOST` and `LETSENCRYPT_HOST` env vars can be used to set up an [nginx-proxy](https://github.com/nginx-proxy/nginx-proxy) configuration properly which I achived [here](https://github.com/mustafa-korkmaz/nginx-multiple-sites)

`docker-compose up -d`