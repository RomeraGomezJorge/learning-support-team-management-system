
# Learning Support Management System
[![Symfony](https://img.shields.io/badge/symfony-%23000000.svg?style=for-the-badge&logo=symfony&logoColor=white)](https://symfony.com/)
[![PHP](https://img.shields.io/badge/php-%23777BB4.svg?style=for-the-badge&logo=php&logoColor=white)](https://www.php.net/)
[![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5)
[![Bootstrap](https://img.shields.io/badge/bootstrap-%23563D7C.svg?style=for-the-badge&logo=bootstrap&logoColor=white)](https://getbootstrap.com/)
[![jQuery](https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white)](https://jquery.com/)
[![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)

## About The Project

This project empowers managers and HR leaders by providing a streamlined solution for managing data related to learning support teams. The platform facilitates the efficient handling of employee information, job designations, employment contracts, and their respective assignments to designated schools. Additionally, each learning support team is associated with a specific office, ensuring representation in every district.

## About The Domain

A learning support team comprises multiple employees, each with defined roles and contractual agreements. These teams play a crucial role in supporting designated schools, with each team strategically placed in an office to ensure comprehensive district coverage.

## Project Screenshots

### Dashboard
<p align="center">
  <img src="https://i.imgur.com/Eu1UCFw.png/6K7Tixx.png" />
  It provides quick access to essential information and key actions
</p>

### Employee
<p align="center">
  <img src="https://i.imgur.com/x6jZItr.png" />
  List, Filter, Sort, Edit, and Create
</p>
<p align="center">
  <img src="https://i.imgur.com/x6jZItr.png" />
  Manage employee details
</p>



**Features**

- [x] PHP 7.4
- [x] Symfony 5
- [x] DDD guidelines
- [x] Hexagonal Architecture
- [x] SOLID
- [x] Domain Events

## Access Credentials

### Backoffice

- **Username**: admin
- **Password**: Admin123

# Instructions to set up the project

To get the project up and running after cloning the repository, follow these steps:


1. Start by cloning the project repository to your local machine using Git:
    ```    
   git clone https://github.com/RomeraGomezJorge/learning-support-team-management-system.git
   ```

2. Move to the directory of the project using your terminal:
    ```    
   cd learning-support-team-management-system
   ```   

3. Before you can run the application, you need to configure the environment variables. Start by renaming the .env.example file to .env:
    ```
    mv .env.example .env
    ```
4. Download and create the container images by executing the following command to start the services using Docker Compose:
    ```
    docker-compose up -d
    ```
5. Once the previous command finishes execution, check the status of all services by using the following command:
    ```
    docker-compose ps
    ```
   If everything is correct, you should see output similar to the following (where "UP" indicates that the service is running):
    ```
    database-lst     docker-entrypoint.sh mysqld      Up      0.0.0.0:3307->3306/tcp,:::3307->3306/tcp, 33060/tcp                   
    nginx-lst        /docker-entrypoint.sh nginx      Up      0.0.0.0:443->443/tcp,:::443->443/tcp, 0.0.0.0:80->80/tcp,:::80->80/tcp
    php-fpm-lst      docker-php-entrypoint php-fpm    Up      0.0.0.0:9000->9000/tcp,:::9000->9000/tcp                              
    phpmyadmin-lst   /docker-entrypoint.sh apac ...   Up      0.0.0.0:8082->80/tcp,:::8082->80/tcp        
    ```
6. Access the **php-fpm-lst** container (in the example, it is named **php-fpm-lst**)  using the following command to enter the interactive terminal of the container:
     ```
     docker exec -it php-fpm-lst /bin/bash
    ```

7. Rename **.env.example** file to **.env**
    ```
    mv .env.example .env
    ```

8. Install Symfony dependencies using the following commands:
    ```
    composer install
    ```

The project is now available at <b>http://localhost:9001</b> . Enjoy working on it!


## After install
- To initiate the project in the upcoming instances, navigate to the project's root directory, and simply execute the following command:
    ```
    docker-compose start
    ```
  <b>NOTE:</b> Replace "php-fpm-lst" with your php-fpm-lst container name, which you can obtain after running "docker-compose ps"

- To stop the project, you can use:
    ```
    docker-compose stop
    ``` 
