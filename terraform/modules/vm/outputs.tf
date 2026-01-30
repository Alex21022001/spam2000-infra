output "grafana_admin_password" {
  value       = data.kubernetes_secret_v1.grafana_secret.data["admin-password"]
  description = "The admin password for Grafana"
  sensitive   = true
}

output "grafana_admin_user" {
  value       = data.kubernetes_secret_v1.grafana_secret.data["admin-user"]
  description = "The admin user for Grafana"
  sensitive   = true
}
