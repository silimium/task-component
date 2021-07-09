DOCKER_COMPOSE = docker-compose -f tests/Bootstrap/docker-compose.yml
PHP = $(DOCKER_COMPOSE) run --rm --no-deps php php
COMPOSER = $(DOCKER_COMPOSE) run --rm --no-deps composer
CONSOLE = $(DOCKER_COMPOSE) run --rm php php tests/Bootstrap/bin/console

DOCKER_UID = $(shell id --user)
export DOCKER_UID

.PHONY: pull
pull:
	$(DOCKER_COMPOSE) pull

.PHONY: build
build:
	$(DOCKER_COMPOSE) build

.PHONY: dependencies
dependencies:
	$(COMPOSER) install \
		--ansi \
		--no-scripts \
		--no-interaction \
		--no-progress \
		--optimize-autoloader

.PHONY: up
up:
	$(DOCKER_COMPOSE) up -d
	$(CONSOLE) doctrine:schema:update --force

.PHONY: down
down:
	$(DOCKER_COMPOSE) down --volumes

.PHONY: tests
tests:
	$(PHP) bin/phpunit
