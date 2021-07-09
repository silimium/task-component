DOCKER_COMPOSE = docker-compose -f tests/Bootstrap/docker-compose.yml
PHP = $(DOCKER_COMPOSE) run --rm php php
CONSOLE = $(DOCKER_COMPOSE) run --rm php php tests/Bootstrap/bin/console

.PHONY: tests
tests:
	$(DOCKER_COMPOSE) up -d
	$(CONSOLE) doctrine:schema:update --force
	$(PHP) bin/phpunit
	$(DOCKER_COMPOSE) down --volumes
