# Larvel  with Docker Compose

This project contains all the necessary docker images for running a laravel site. Although, you will need to install laravel seperatley. It does not come out of the box.

## Steps for getting docker 8 up and running:

Prerequisites:

- composer installed globally (see https://getcomposer.org/doc/00-intro.md#installation-linux-unix-macos)
- docker-compose installed (see https://docs.docker.com/compose/install/)
- laravel installer installed globally (see: https://laravel.com/docs/7.x/installation#installing-laravel)

1. clone this repo:

```
git clone https://github.com/richardlawson/laravel-docker-compose.git
```

2. A new folder called laravel-docker-compose will be created. You should cd into that:

```
cd laravel-docker-compose
```

3. Install laravel into the code directory using the laravel installer:

```
cd code
laravel new .
```

4. That should have installed laravel for you. Check that it has been created.

5. Run composer install.

```
composer install
```
6. Update the DB_PASSWORD property in the .env file. It will be blank to start with, but you should change it to password. So, DB_PASSWORD=password
You can do this using the following command: 

```
sed -i "" 's/DB_PASSWORD=/DB_PASSWORD=password/g' .env
```
7. Update DB_HOST in the .env file. It will be set to 127.0.0.1 to start with, but you should change it to point to the mysql image. So,
DB_HOST=mysql
You can do this using the following command: 

```
sed -i "" 's/DB_HOST=127.0.0.1/DB_HOST=mysql/g' .env
```

8. cd back into the laravel-docker-compose directory:

```
cd ../
```

9. Add the following to your /etc/hosts file (note this is your computer hosts file. and is not included in the laravel-docker-compose directory)

```
127.0.0.1       laravel.local
```

10. Run docker-compose:

```
docker-compose up -d
```

11. Go to the following url in your browser:

```
http://laravel.local:8080/
```

You should hopefully see your new laravel site.

12. Migrate the default database that comes with laravel. Do this by running the following command in the root folder:

```
./php-artisan migrate:fresh --seed
```

You should now be all set up.


NB: To stop the site at any time, run the following command:

```
docker-compose stop
```

NB: You can run artisan in the root folder by running the following command (don't use php artisan):

```
./php-artisan
```

NB: If you would prefer to run the site without adding port info, edit the docker-compose.yml file

e.g. http://laravel.local instead of http://laravel.local:8080

And change the following:

```
ports:
        - "8080:80"
```

to:

```
ports:
        - "80:80"
```

You will also have to make sure that you don't have any services running on port 80

NB: You can access the docker mysql server on your local computer by using mysql work bench.

To do so, add a new connection and use the following settings:

```
hostname: 127.0.0.1
port: 3307
username: root
password: password
```


