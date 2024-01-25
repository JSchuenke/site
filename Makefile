.PHONY: all
all: deploy-kind delete-kind

deploy-kind:
	kind create cluster --config=./local/kind-cluster.yaml
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
	
	kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s

	

delete-kind:
	kind delete cluster
 