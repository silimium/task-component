DOCKER_COMPOSE = docker-compose -f tests/Bootstrap/docker-compose.yml
PHP = $(DOCKER_COMPOSE) run --rm --no-deps php php
COMPOSER = $(DOCKER_COMPOSE) run --rm --no-deps composer
CONSOLE = $(DOCKER_COMPOSE) run --rm php php tests/Bootstrap/bin/console

.PHONY: build
build:
	$(DOCKER_COMPOSE) build
	$(COMPOSER) install \
		--ansi \
		--no-scripts \
		--no-interaction \
		--no-progress \
		--optimize-autoloader

.PHONY: tests
tests:
	$(DOCKER_COMPOSE) up -d
	$(CONSOLE) doctrine:schema:update --force
	$(PHP) bin/phpunit
	$(DOCKER_COMPOSE) down --volumes
