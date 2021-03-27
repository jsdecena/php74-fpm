FROM php:7.4-fpm
LABEL Maintainer="Jeff Simons Decena <jeff.decena@yahoo.com>" \
      Description="Minimal PHP 7.4 with FPM"

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim \
    optipng \
    pngquant \
    gifsicle \
    vim \
    unzip \
    git \
    curl \
    postgresql \ 
    postgresql-contrib \
    libpq-dev \
    libonig-dev

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN rm -f /etc/localtime
RUN ln -s /usr/share/zoneinfo/Asia/Manila /etc/localtime

RUN docker-php-ext-install bcmath sockets

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
