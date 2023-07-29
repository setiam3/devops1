# Step 1: Use the official PHP 7.4-fpm image
FROM php:7.4-fpm

# Step 2: Install necessary dependencies and packages
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    git \
    curl \
    xvfb \
    libfontconfig1 \
    libxrender1 \
    php7.4 \
    php7.4-fpm \
    php7.4-common \
    php7.4-pdo \
    php7.4-pdo_mysql \
    php7.4-mysqli \
    php7.4-mcrypt \
    php7.4-mbstring \
    php7.4-xml \
    php7.4-openssl \
    php7.4-json \
    php7.4-phar \
    php7.4-zip \
    php7.4-gd \
    php7.4-dom \
    php7.4-session \
    php7.4-zlib

# Step 4: Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Step 5: Install wkhtmltopdf (optional - only if needed)
RUN apt-get install -y wkhtmltopdf

# Set the working directory
WORKDIR /var/www/html
# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]