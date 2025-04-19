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

update:
	ncu --deep -u
	cd test/setup-node/npm && npm i && npm up
	cd test/setup-node/pnpm && pnpm i && pnpm up
	cd test/setup-node/yarn1 && yarn && yarn upgrade
	cd test/setup-node/yarn && yarn && yarn up
