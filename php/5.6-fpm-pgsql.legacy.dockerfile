# Use official PHP 5.6 FPM base image
FROM php:5.6-fpm

# Update apt sources to use archived Debian Stretch repositories
RUN echo "deb http://archive.debian.org/debian stretch main" > /etc/apt/sources.list \
    && echo "deb http://archive.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list \
    && apt-get update && apt-get install -y \
        libpq-dev \
        libzip-dev \
        unzip \
    && docker-php-ext-configure pgsql --with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo_pgsql pgsql zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /var/www

# Copy application code (assumes your PHP files are in the same directory as Dockerfile)
COPY . /var/www

# Set proper permissions (avoid 777 for security)
RUN chown -R www-data:www-data /var/www \
    && chmod -R 755 /var/www

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]
