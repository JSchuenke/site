tag := shank/api-nodejs:0.1

.PHONY: all
all: venv-activate dev-start-local build-image freeze

dev-start-local:
	npm run start

build-image:
	docker build -t $(tag) .
	kind load docker-image --name kind $(tag)

