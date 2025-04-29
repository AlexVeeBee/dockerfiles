FROM php:8.4.6-fpm AS fpm

RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip3 install \
    pillow \
    piexif \
    --break-system-packages
# RUN pip3 install piexif --break-system-packages

RUN apt-get update && apt-get install -y \
    libpq-dev \
    libzip-dev \
    unzip \
    # get mysql client
    && docker-php-ext-configure pgsql \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-install zip

RUN apt-get update && apt-get install -y ffmpeg
RUN apt update && apt full-upgrade -y
# create a /var/www directory
WORKDIR /var/www

# chmod the directory
RUN chmod -R 777 /var/www

CMD [ "php-fpm" ]