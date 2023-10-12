.DEFAULT_GOAL := help

.PHONY: activate
activate: ## Activate Python environment
	pipenv shell

.PHONY: install-dev
install-dev: ## Install development packages
	pipenv install --dev black flake8 mypy pre-commit

.PHONY: format
format: ## Format sources
	pipenv run black src

.PHONY: lint
lint: ## Lint sources
	pipenv run flake8 src

.PHONY: type-check
type-check: # Check type
	pipenv run mypy src

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
