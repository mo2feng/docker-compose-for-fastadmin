FROM php:7.4-fpm

ENV LANG=C.UTF-8

# install lib
RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list && \
        sed -i s@/security.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list && \
        sed -i s@/snapshot.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list && \
        apt-get clean && \
        apt-get update && \
        apt-get install -y libzip-dev  && \
        apt-get install -y -y --no-install-recommends libfreetype6-dev zip unzip libjpeg62-turbo-dev libmcrypt-dev libpng-dev wget && \
        rm -r /var/lib/apt/lists/*




# install php ext
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) gd pdo_mysql zip

RUN pecl install redis \
        && docker-php-ext-enable redis



RUN mkdir /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app
#COPY bin/composer.phar /usr/local/bin/composer
RUN php /usr/src/app/composer.phar config -g repo.packagist composer https://packagist.phpcomposer.com
