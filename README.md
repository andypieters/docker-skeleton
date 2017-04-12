# Docker skeleton
docker skeleton for creating a controlled environment for php applications

# Introduction
With this skeleton you can easily create a webserver with a mysql database using docker-compose
This skeleton also links a phpmyadmin to the database so you can manage what is inside the database.
Also, no emails will be sent from this container, but catched by mailcatcher.
In this way you can easily test your projects without accidentally sending emails to your customers.

# Prerequisites 
- 64 bit operating system
- Docker (https://www.docker.com/products/docker)

# Usage
1. Download or checkout this repository.
2. Open a terminal and navigate to the skeleton.
3. run `docker-compose up`
4. After docker completed downloading all images, the services will run

# Configuration
See docker-compose.yml
You can edit the mysql database that will be created on first start.
Also you can setup the root password and add a user with acces to the created database.

# Default configuration
The default configuration for the database is as follows:
- hostname: db
- root password: root
- user: db
- password: db
- database: db

# Ports
Docker compose will start the following services
You can access these services from a browser.
For example:
http://localhost:8080 for the webserver

1. The webserver (port: 8080)
2. Phpmyadmin (port: 8181)
3. Mailcatcher (port: 1080)


