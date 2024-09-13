venv:
	@python -m venv .venv
	@echo 'run `. .venv/bin/activate` to develop'

install:
	pip install -r requirements.txt

lint:
	yamllint .

verify: lint
