# https://github.com/antonbabenko/terraform-best-practices

BASE_PATH=dev

.PHONY: help
help: ## Show help menu
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: install-requirements
install-requirements: ## Install requirements on Linux.
	@sh scripts/install-packages.sh

.PHONY: .minikube-start
.minikube-start: ## Start minikube.
	@sh scripts/build-minikube.sh start_minikube

.PHONY: .minikube-delete
.minikube-delete: ## Delete minikube.
	@sh scripts/build-minikube.sh delete_minikube

.PHONY: .terraform-init
.terraform-init: .minikube-start ## Apply terraform init.
	terraform init ${BASE_PATH}

.PHONY: terraform-start
terraform-start: .terraform-init ## Start minikube, apply terraform init and start.
	terraform apply ${BASE_PATH}

.PHONY: terraform-destroy
terraform-destroy:  ## Apply terraform destroy and delete minikube.
	terraform destroy ${BASE_PATH}
	$(MAKE) .minikube-delete