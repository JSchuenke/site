tag := shank/shank-vue:0.1

.PHONY: all
all: build-image

dev-start-local:
	npm run dev
	open http://localhost:5173/

dev-deploy-kind:
	helm install shank-vue ./helm -n shank

build-image:
	docker build -t $(tag) .
	kind load docker-image --name kind $(tag)