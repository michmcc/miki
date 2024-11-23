.PHONY: build clean

build:
	pipenv run mkdocs build

run:
	pipenv run mkdocs serve

clean:
	pipenv run mkdocs clean
