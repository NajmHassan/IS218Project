FROM php:5.6-apache-jessie
RUN sed -i '/jessie-updates/d' /etc/apt/sources.list
RUN apt-get update
RUN apt-get update --fix-missing
RUN apt-get install git cron rcconf libzip-dev zlib1g-dev libpng-dev libxml2-dev -y
RUN a2enmod rewrite

WORKDIR /var/www/html
COPY ./ .
RUN service apache2 restart
EXPOSE 8000
