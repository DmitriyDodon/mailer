FROM php:7.4-fpm

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN cd /var/www/html

RUN apt update
RUN apt install -y zlib1g-dev g++ git libicu-dev zip libzip-dev zip
RUN docker-php-ext-install intl opcache pdo pdo_mysql
RUN pecl install apcu
RUN docker-php-ext-enable apcu
RUN docker-php-ext-configure zip
RUN docker-php-ext-install zip
RUN apt-get install -y git
RUN git clone https://github.com/DmitriyDodon/mailer.git \
    && cd mailer/app/ \
    && cp .env.example .env \
    && composer install

WORKDIR /var/www/html/mailer

CMD /var/www/html/mailer/app/bin/mailocal
