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
    libxrender1


# Step 4: Install wkhtmltopdf (optional - only if needed)
RUN apt-get install -y wkhtmltopdf

# Step 5: Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the working directory
WORKDIR /var/www/html

# Set up a shared root directory using volumes
VOLUME /var/www/html
