tag := shank/shank-vue:0.1

.PHONY: all
all: build-image dev-start-local dev-deploy-kind dev-delete-kind

dev-start-local:
	npm run dev
	open http://localhost:5173/

dev-deploy-kind:
	if [ "$(shell kubectl get namespace shank -o 'jsonpath={.status.phase}')" == "Active" ]; then \
		echo "Namespace already exists"; \
    else \
        kubectl create namespace shank; \
    fi
	helm install shank-vue ./helm -n shank

dev-delete-kind:
	helm delete shank-vue -n shank

build-image:
	docker build -t $(tag) .
	kind load docker-image --name kind $(tag)