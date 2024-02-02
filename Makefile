REPOS := shank-flask shank-vue shank-go

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

build-images:
	for dir in $(REPOS); do \
        cd $$dir; make build-image; \
    done

dev-deploy-kind:
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