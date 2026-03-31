.PHONY: init plan apply destroy build

init:
	cd infra/dev && terraform init

plan:
	cd infra/dev && terraform plan

apply:
	cd infra/dev && terraform apply -auto-approve

destroy:
	cd infra/dev && terraform destroy -auto-approve

build:
	docker build -t healthcare-backend:latest -f apps/.docker/Dockerfile apps/

helm-lint:
	helm lint apps/.helm/backend-api/
