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

# Step 3: Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mbstring

# Step 4: Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Step 5: Install wkhtmltopdf (optional - only if needed)
RUN apt-get install -y wkhtmltopdf

# Set the working directory
WORKDIR /var/www/html
# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]