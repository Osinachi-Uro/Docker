FROM php:8.1.16-apache-bullseye

EXPOSE 80

#---------------
# php extensions
#----------------

RUN apt update -y && apt install zlib1g-dev libzip-dev libpng-dev -y
RUN docker-php-ext-install bcmath gd zip pdo pdo_mysql mysqli 

#------------
# Clone Repo
#------------
RUN apt install git -y
RUN git clone https://github.com/f1amy/laravel-realworld-example-app.git /var/www/html/LaravelApp


#---------
#Composer
#---------

WORKDIR /var/www/html/LaravelApp/
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN composer create-project
COPY .env .env
#Change ownership
RUN chown -R www-data:www-data /var/www/html/LaravelApp && chmod -R 755 /var/www/html/LaravelApp 

#------------------------------------------
#Create the Virtual Host Configuration File
#------------------------------------------

COPY laravel.conf /etc/apache2/sites-enabled/000-default.conf

# Enable the new configuration file
RUN a2enmod rewrite


ENTRYPOINT ["/bin/bash", "-c", "service apache2 restart && php artisan migrate --seed && sleep infinity"]
