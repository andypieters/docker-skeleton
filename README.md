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
3. run `docker-compose up --build`
4. After docker completed downloading all images, the services will run
5. Copy your project files to the webroot directory, the /webroot/public folder will be exposed

# Configuration
## Database
The database settings can be changed in docker-compose.yml
## Webserver (php-apache)
You can change the php configuration in the services/php-apache/config/ folder.
Any .ini files you put here, will be loaded in php.
After changing any of the ini files, you'll need to rebuild. `docker-compose up --build`


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

