tag := shank/api-python:0.1

.PHONY: all
all: venv-activate dev-start-local build-image freeze

venv-activate:
	./.venv/bin/activate

dev-start-local:
	uvicorn main:app --reload

build-image:
	docker build -t $(tag) .
	kind load docker-image --name kind $(tag)

freeze:
	pip list --format=freeze > requirements.txt