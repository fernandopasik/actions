verify: format lint hooks

venv:
	@python -m venv .venv
	@echo 'run `. .venv/bin/activate` to develop'

install:
	pip install -r requirements-dev.txt
	pre-commit install

format:
	pre-commit run --all-files yamlfmt
	mdformat .

lint:
	yamllint .

hooks:
	pre-commit run --all-files

test-clean:
	find test -type d \( -name '.venv' -o -name 'node_modules' \) -prune -exec rm -rf {} +

update:
	ncu --deep -u
	cd test/setup-node/npm && npm i && npm up
	cd test/setup-node/pnpm && pnpm i && pnpm up
	cd test/setup-node/yarn1 && yarn && yarn upgrade
	cd test/setup-node/yarn && yarn && yarn up
	cd test/setup-python/pipenv && pipenv update
	cd test/setup-python/poetry && poetry update
	find . -path './.venv' -prune -o \( -name '*requirements.txt' -o -name 'requirements-dev.txt' \) -exec sh -c 'printf "all\n" | pip-upgrade "$$1"' _ {} \;
