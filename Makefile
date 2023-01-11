ifneq ($(service),)
include ./docker/$(service)/.env
export
endif
SHELL = /bin/bash
.DEFAULT_GOAL := help

# .PHONY: help build test all up up-elk start stop down ps

# start service

start: 
	@docker-compose -f ./docker/$(service)/docker-compose.yml up --build -d

stop:
	@docker-compose -f ./docker/$(service)/docker-compose.yml down

shell:
	@docker exec -it $(docker) /bin/bash

started:
	@docker ps --no-trunc --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}\t{{.Mounts}}"

available:
	@ls docker/

help:
	@echo "- make avaiable (will print the available services that you can run)"
	@echo "- make started will print the currently running services)"
	@echo "- make start service=<path_of_service_contained in docker folder>"
	@echo "- make stop service=<path of service contained in docker folder and previously started>"
	@echo "- make shell docker=<name of started container that you want to connect to>"

FORCE:
