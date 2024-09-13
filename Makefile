venv:
	python -m venv .venv
	. .venv/bin/activate

install:
	pip install -r requirements.txt

lint:
	yamllint .

verify: lint
