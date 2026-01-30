output "argocd_password" {
  value       = data.kubernetes_secret_v1.argocd_admin_secret.data["password"]
  description = "The Argo CD admin password"
  sensitive   = true
}
