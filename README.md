
## About The Project

This project help managers and HR leaders to handle the management of learning support team data.

## About The Domain

A learning support team is made up of several employees who have a job designation and an employment contract.
Also, every LST assists a group of designated schools. 
Each learning support team is assigned an office so there is at least one in every district.


**Features**

- [x] PHP 7.4
- [x] Symfony 5
- [x] DDD guidelines
- [x] Hexagonal Architecture
- [x] SOLID
- [x] Domain Events

## Access Credentials

### Backoffice

- **Username**: admin@example.com
- **Password**: *********

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

Now, the project should be configured and working correctly. Enjoy working on it!

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
