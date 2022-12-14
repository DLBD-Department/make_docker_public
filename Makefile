include ./docker/$(service)/.env
export

SHELL = /bin/bash
.DEFAULT_GOAL := help

# .PHONY: help build test all up up-elk start stop down ps

# start service

start: 
	@export service=$(service)
	@docker-compose -f ./docker/$(service)/docker-compose.yml up --build -d

stop:
	@export service=$(service)
	@docker-compose -f ./docker/$(service)/docker-compose.yml down

help:
	@echo "- make start service=<path_of_service_contained in docker folder>"
	@echo "- make stop service=<path of service contained in docker folder and previously started>"

FORCE:
