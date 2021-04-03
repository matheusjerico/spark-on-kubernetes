
.PHONY: help
help: ## Show help menu
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: install-requirements
install-requirements: ## [REQUIREMENTS] Install all requiremets used in this project.
	$(MAKE) -C cluster install-requirements

.PHONY: create-infrastructure
create-infrastructure: ## [IAC] Create infrastructure with Terraform.
	$(MAKE) -C cluster terraform-start

.PHONY: destroy-infrastructure
destroy-infrastructure: ## [IAC] Destroy infrastructure with Terraform.
	$(MAKE) -C cluster terraform-destroy

.PHONY: connect-airflow
connect-airflow: ## [CONNECT] Make port forward with airflow on port 8080.
	kubectl port-forward -n airflow service/airflow --address 0.0.0.0 8080:8080

.PHONY: connect-minio
connect-minio: ## [CONNECT] Make port forward with minio on port 9000.
	kubectl port-forward -n minio service/minio --address 0.0.0.0 9000:9000

.PHONY: docker-deploy
docker-deploy: ## [IMAGES] Build and push docker.
	$(MAKE) -C images docker-deploy -e TAG=0.0.1

