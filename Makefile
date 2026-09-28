SHELL := /bin/bash
# =============================================================================
# Variables
# =============================================================================

.DEFAULT_GOAL:=help
.ONESHELL:
ENV_PREFIX      := $(shell if [ -d .venv ]; then echo ".venv/bin/"; fi)
VENV_EXISTS     := $(shell if [ -d .venv ]; then echo "yes"; fi)
UV_OPTS         ?=
UV              ?= uv $(UV_OPTS)

.EXPORT_ALL_VARIABLES:


.PHONY: help
help: 		   										## Display this help text for Makefile
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: upgrade
upgrade:       										## Upgrade all dependencies to the latest stable versions
	@echo "=> Updating all dependencies"
	@$(UV) lock --upgrade
	@$(UV) sync --all-groups
	@echo "=> Dependencies Updated"
	@$(UV) run prek update
	@echo "=> Updated prek hooks"

# =============================================================================
# Developer Utils
# =============================================================================
.PHONY: install-uv
install-uv: 										## Install latest version of uv
	@curl -LsSf https://astral.sh/uv/install.sh | sh

install:											## Install the project and all dependency groups
	@if ! $(UV) --version > /dev/null 2>&1; then echo '=> Installing uv'; $(MAKE) install-uv; fi
	@if [ "$(VENV_EXISTS)" ]; then echo "=> Removing existing virtual environment"; $(MAKE) destroy; $(MAKE) clean; fi
	@$(UV) sync --all-groups
	@echo "=> Install complete! Note: If you want to re-install re-run 'make install'"

clean: 												## Cleanup temporary build artifacts
	@echo "=> Cleaning working directory"
	@rm -rf .pytest_cache .ruff_cache .hypothesis build/ -rf dist/ .eggs/
	@find . -name '*.egg-info' -exec rm -rf {} +
	@find . -name '*.egg' -exec rm -f {} +
	@find . -name '*.pyc' -exec rm -f {} +
	@find . -name '*.pyo' -exec rm -f {} +
	@find . -name '*~' -exec rm -f {} +
	@find . -name '__pycache__' -exec rm -rf {} +
	@find . -name '.ipynb_checkpoints' -exec rm -rf {} +
	@rm -rf .coverage coverage.xml coverage.json htmlcov/ .pytest_cache tests/.pytest_cache tests/**/.pytest_cache .mypy_cache
	$(MAKE) docs-clean

destroy: 											## Destroy the virtual environment
	@rm -rf .venv

# =============================================================================
# Tests, Linting, Coverage
# =============================================================================
.PHONY: lint
lint: 												## Runs prek hooks; includes ruff linting, codespell, black
	@echo "=> Running prek process"
	@$(UV) run prek run --all-files
	@echo "=> prek complete"

.PHONY: coverage
coverage:  											## Run the tests and generate coverage report
	@echo "=> Running tests with coverage"
	@$(UV) run pytest tests --cov=project_template
	@$(UV) run coverage html
	@$(UV) run coverage xml
	@echo "=> Coverage report generated"

.PHONY: test
test:  												## Run the tests
	@echo "=> Running test cases"
	@$(UV) run pytest tests
	@echo "=> Tests complete"

.PHONY: test-examples
test-examples:            			              	## Run the examples tests
	@$(UV) run pytest docs/examples

.PHONY: test-all
test-all: test test-examples 						## Run all tests


.PHONY: check-all
check-all: lint test-all coverage 					## Run all linting, tests, and coverage checks

# =============================================================================
# Docs
# =============================================================================
.PHONY: docs-install
docs-install: 										## Install docs dependencies
	@echo "=> Installing documentation dependencies"
	@$(UV) sync --group docs
	@echo "=> Installed documentation dependencies"

docs-clean: 										## Dump the existing built docs
	@echo "=> Cleaning documentation build assets"
	@rm -rf docs/_build
	@echo "=> Removed existing documentation build assets"

docs-serve: docs-clean 								## Serve the docs locally
	@echo "=> Serving documentation"
	$(UV) run sphinx-autobuild docs docs/_build/ -j auto --watch src --watch docs --watch tests --watch CONTRIBUTING.rst --port 8002

docs: docs-clean 									## Dump the existing built docs and rebuild them
	@echo "=> Building documentation"
	@$(UV) run sphinx-build -M html docs docs/_build/ -E -a -j auto --keep-going
