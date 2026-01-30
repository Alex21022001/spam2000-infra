#!/bin/bash
set -e

echo "Initializing Terraform..."
terraform -chdir=terraform init

echo "Starting the deployment (this may take 5-10 minutes)..."
terraform -chdir=terraform apply -var-file="local.tfvars" -auto-approve

echo "Deployment complete! Fetching access details..."

ARGOCD_PASS=$(terraform -chdir=terraform output -raw argocd_password)
GRAFANA_USER=$(terraform -chdir=terraform output -raw grafana_admin_user)
GRAFANA_PASS=$(terraform -chdir=terraform output -raw grafana_admin_password)

echo "--------------------------------------------------------"
echo "ACCESS DETAILS"
echo "--------------------------------------------------------"
echo "Argo CD UI:      http://localhost:8080/argocd (via Ingress)"
echo "Argo CD Admin:   admin"
echo "Argo CD Pass:    $ARGOCD_PASS"
echo ""
echo "Grafana UI:      http://localhost:8080/grafana (via Ingress)"
echo "Grafana Admin:   $GRAFANA_USER"
echo "Grafana Pass:    $GRAFANA_PASS"
echo ""
echo "Spam2000:        http://localhost:8080 (via Ingress)"
echo "--------------------------------------------------------"
echo "Note: This bootstrap script is just simple wrapper to run everything within one command and was made based on default configs"
