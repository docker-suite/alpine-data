## Meta data about the image
DOCKER_IMAGE=dsuite/alpine-data
DOCKER_IMAGE_CREATED=$(shell date -u +'%Y-%m-%dT%H:%M:%SZ')
DOCKER_IMAGE_REVISION=$(shell git rev-parse --short HEAD)

## Current directory
DIR:=$(strip $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

## Define the latest version
latest = 3.13

## Config
.DEFAULT_GOAL := help
.PHONY: *

help: ## This help!
	@printf "\033[33mUsage:\033[0m\n  make [target] [arg=\"val\"...]\n\n\033[33mTargets:\033[0m\n"
	@grep -E '^[-a-zA-Z0-9_\.\/]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[32m%-15s\033[0m %s\n", $$1, $$2}'

build-all: ## Build all supported versions
	@$(MAKE) build v=3.7
	@$(MAKE) build v=3.8
	@$(MAKE) build v=3.9
	@$(MAKE) build v=3.10
	@$(MAKE) build v=3.11
	@$(MAKE) build v=3.12
	@$(MAKE) build v=3.13

test-all: ## Test all supported versions
	@$(MAKE) test v=3.7
	@$(MAKE) test v=3.8
	@$(MAKE) test v=3.9
	@$(MAKE) test v=3.10
	@$(MAKE) test v=3.11
	@$(MAKE) test v=3.12
	@$(MAKE) test v=3.13

push-all: ## Push all supported versions
	@$(MAKE) push v=3.7
	@$(MAKE) push v=3.8
	@$(MAKE) push v=3.9
	@$(MAKE) push v=3.10
	@$(MAKE) push v=3.11
	@$(MAKE) push v=3.12
	@$(MAKE) push v=3.13

build: ## Build ( usage : make build v=3.13 )
	$(eval version := $(or $(v),$(latest)))
	@docker run --rm \
		-v $(DIR)/Dockerfiles:/data \
		-e ALPINE_VERSION=$(version) \
		-e DOCKER_IMAGE_CREATED=$(DOCKER_IMAGE_CREATED) \
		-e DOCKER_IMAGE_REVISION=$(DOCKER_IMAGE_REVISION) \
		dsuite/alpine-data \
		sh -c "templater Dockerfile.template > Dockerfile-$(version)"
	@docker build --force-rm \
		--file $(DIR)/Dockerfiles/Dockerfile-$(version) \
		--tag $(DOCKER_IMAGE):$(version) \
		$(DIR)/Dockerfiles
	@[ "$(version)" = "$(latest)" ] && docker tag $(DOCKER_IMAGE):$(version) $(DOCKER_IMAGE):latest || true

test: ## Test ( usage : make test v=3.13 )
	$(eval version := $(or $(v),$(latest)))
	@docker run --rm -t \
		-v $(DIR)/tests:/goss \
		-v /tmp:/tmp \
		-v /var/run/docker.sock:/var/run/docker.sock \
		dsuite/goss:latest \
		dgoss run --entrypoint=/goss/entrypoint.sh $(DOCKER_IMAGE):$(version)

push: ## Push ( usage : make push v=3.13 )
	$(eval version := $(or $(v),$(latest)))
	@docker push $(DOCKER_IMAGE):$(version)
	@[ "$(version)" = "$(latest)" ] && docker push $(DOCKER_IMAGE):latest || true

shell: ## Run shell ( usage : make shell v=3.13 )
	$(eval version := $(or $(v),$(latest)))
	@mkdir -p $(DIR)/packages
	@docker run -it --rm \
		-e DEBUG_LEVEL=DEBUG \
		$(DOCKER_IMAGE):$(version) \
		sh

remove: ## Remove all generated images
	@docker images | grep $(DOCKER_IMAGE) | tr -s ' ' | cut -d ' ' -f 2 | xargs -I {} docker rmi $(DOCKER_IMAGE):{} || true
	@docker images | grep $(DOCKER_IMAGE) | tr -s ' ' | cut -d ' ' -f 3 | xargs -I {} docker rmi {} || true

readme: ## Generate docker hub full description
	@docker run -t --rm \
		-e DOCKER_USERNAME=${DOCKER_USERNAME} \
		-e DOCKER_PASSWORD=${DOCKER_PASSWORD} \
		-e DOCKER_IMAGE=${DOCKER_IMAGE} \
		-v $(DIR):/data \
		dsuite/hub-updater
