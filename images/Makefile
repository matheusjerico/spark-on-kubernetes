REPOSITORY=matheusjerico

TAG=latest
BASE_IMAGE_NAME=pyspark-base-v3.0.0
CUSTOM_IMAGE_NAME=pyspark-custom-v3.0.0

.PHONY: help
help: ## Show help menu
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

## HIDDEN TARGETS: Used to Main Target
##
.PHONY: .docker-build-base-image
.docker-build-base-image: ## Build docker base image ... Add `-e TAG=some_tag` to set a tag
	docker build base -t ${BASE_IMAGE_NAME}:${TAG}

.PHONY: .docker-build-custom-image
.docker-build-custom-image: ## Build docker custom image ... Add `-e TAG=some_tag` to set a tag
	docker build custom -t ${CUSTOM_IMAGE_NAME}:${TAG} --build-arg IMAGE=${REPOSITORY}/${BASE_IMAGE_NAME}:${TAG}

.PHONY: .docker-deploy-base-image
.docker-deploy-base-image: .docker-build-base-image ## Deploy docker base image ... Add `-e TAG=some_tag` to set a tag
	docker tag ${BASE_IMAGE_NAME}:${TAG} ${REPOSITORY}/${BASE_IMAGE_NAME}:${TAG}

.PHONY: .docker-deploy-custom-image
.docker-deploy-custom-image: .docker-build-custom-image ## Deploy docker custom image ... Add `-e TAG=some_tag` to set a tag
	docker tag ${CUSTOM_IMAGE_NAME}:${TAG} ${REPOSITORY}/${CUSTOM_IMAGE_NAME}:${TAG}
	docker push ${REPOSITORY}/${CUSTOM_IMAGE_NAME}:${TAG}

## MAIN TARGET: Execute build and push image to Docker Hub
##
.PHONY: docker-deploy
docker-deploy:  ## Build and Push all docker images... Add `-e TAG=some_tag` to set a tag
	$(MAKE) .docker-deploy-base-image
	$(MAKE) .docker-deploy-custom-image