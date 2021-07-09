FROM php:8-cli AS composer

ENV COMPOSER_HOME=/tmp

RUN apt-get update && \
    apt-get install -y \
        git \
        unzip \
        curl

COPY --from=composer:2.1 /usr/bin/composer /usr/bin/composer
COPY ./docker/composer/php.ini /usr/local/etc/php/conf.d/custom.ini

ENTRYPOINT ["composer"]
CMD ["/bin/true"]

###############################################################################

FROM php:8-cli AS php

ARG USER=www-data

RUN apt-get update && \
    apt-get install -y \
        libicu-dev \
        libonig-dev \
        libpq-dev && \
    docker-php-ext-install \
        bcmath \
        intl \
        pdo_pgsql && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /srv/app && chown $USER /srv/app
USER $USER
WORKDIR /srv/app
