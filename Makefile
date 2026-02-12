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
	find . -type d \( -name '.venv' -o -name 'node_modules' \) -prune -o -name '*.sh' -exec shellcheck {} +

hooks:
	pre-commit run --all-files

test-clean:
	find test -type d \( -name '.venv' -o -name 'node_modules' \) -prune -exec rm -rf {} +

update:
	cd test/setup-node/npm && rm -rf package-lock.json && npm i && npm up
	cd test/setup-node/pnpm && rm -rf pnpm-lock.yaml && pnpm i && pnpm up
	cd test/setup-node/yarn1 && rm -rf yarn.lock && yarn && yarn upgrade
	cd test/setup-node/yarn && rm -rf yarn.lock && yarn && yarn up -R
# 	cd test/setup-python/pipenv && pipenv update
# 	cd test/setup-python/poetry && poetry update
# 	find . -path './.venv' -prune -o \( -name '*requirements.txt' -o -name 'requirements-dev.txt' \) -exec sh -c 'printf "all\n" | pip-upgrade "$$1"' _ {} \;
