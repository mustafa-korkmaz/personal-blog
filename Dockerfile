FROM wordpress:php8.1-apache

COPY ./custom-php.ini /usr/local/etc/php/conf.d/

WORKDIR /var/www/html
COPY ./wp-config.php ./wp-config.php
COPY ./.htaccess ./.htaccess

# copy themes 
COPY ./themes ./wp-content/themes
# copy plugins
COPY ./plugins ./wp-content/plugins