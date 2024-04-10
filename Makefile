REPOS := frontend-vue api-go api-python api-nodejs
tag := shank/jumpbox:0.1

.PHONY: all
all: deploy-kind delete-kind dev-deploy-kind build-images

deploy-kind:
	kind create cluster --config=./local/kind-cluster.yaml
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
	
	kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s

delete-kind:
	kind delete cluster

build-images: build-jumpbox
	for dir in $(REPOS); do \
        (cd $$dir; make build-image); \
    done

build-jumpbox:
	docker build -t $(tag) -f Dockerfile.jumpbox .
	kind load docker-image --name kind $(tag)

build-deploy: build-images deploy-dev-kind

deploy-dev-kind: 
	if [ "$(shell kubectl get namespace shank -o 'jsonpath={.status.phase}')" == "Active" ]; then \
		echo "Namespace already exists"; \
	else \
		echo "Namespace doesn't exist"; \
		kubectl create namespace shank; \
	fi

	cd helm; helm dependency update

	if [ "$(shell helm list --namespace shank -o json | jq '.[0].status')" == "deployed" ]; then \
		helm upgrade shank-site ./helm -n shank; \
	else \
		helm install shank-site ./helm -n shank; \
	fi

deploy-dev-kind-nuke: delete-kind deploy-kind build-images
	if [ "$(shell kubectl get namespace shank -o 'jsonpath={.status.phase}')" == "Active" ]; then \
		echo "Namespace already exists"; \
	else \
		echo "Namespace doesn't exist"; \
		kubectl create namespace shank; \
	fi

	cd helm; helm dependency update

	if [ "$(shell helm list --namespace shank -o json | jq '.[0].status')" == "deployed" ]; then \
		helm uninstall shank-site -n shank; \
	fi
	
	helm install shank-site ./helm -n shank;