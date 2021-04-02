
.PHONY: help
help: ## Show help menu
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: install-requirements
install-requirements: ## Install all requiremets used in this project.
	$(MAKE) -C cluster install-requirements

.PHONY: create-infrastructure
create-infrastructure: ## Create infrastructure with Terraform.
	$(MAKE) -C cluster terraform-apply

.PHONY: destroy-infrastructure
destroy-infrastructure: ## Destroy infrastructure with Terraform.
	$(MAKE) -C cluster terraform-destroy
