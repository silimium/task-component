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
