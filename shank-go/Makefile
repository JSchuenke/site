tag := shank/shank-go:0.1

.PHONY: all
all: venv-activate start build-image

venv-activate:
	./venv/bin/activate

dev-start-local:
	flask --app server run

build-image:
	docker build -t $(tag) .
	kind load docker-image --name kind $(tag)

freeze:
	pip freeze > requirements.txt