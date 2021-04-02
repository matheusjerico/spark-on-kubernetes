
.PHONY: help
help: ## Show help menu
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: install-requirements
install-requirements: ## Install all requiremets used in this project.
	$(MAKE) -C cluster install-requirements

.PHONY: create-infrastructure
create-infrastructure: ## Create infrastructure with Terraform.
	$(MAKE) -C cluster terraform-start

.PHONY: destroy-infrastructure
destroy-infrastructure: ## Destroy infrastructure with Terraform.
	$(MAKE) -C cluster terraform-destroy

.PHONY: connect-airflow
connect-airflow: ## Make port forward with airflow on port 8080.
	kubectl port-forward -n airflow service/airflow --address 0.0.0.0 8080:8080

.PHONY: connect-minio
connect-minio: ## Make port forward with minio on port 9000.
	kubectl port-forward -n airflow service/minio --address 0.0.0.0 9000:9000
