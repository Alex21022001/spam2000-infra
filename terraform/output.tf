output "argocd_password" {
  value       = module.argocd.argocd_password
  description = "The Argo CD admin password"
  sensitive   = true
}

output "grafana_admin_password" {
  value       = module.vm.grafana_admin_password
  description = "The admin password for Grafana"
  sensitive   = true
}

output "grafana_admin_user" {
  value       = module.vm.grafana_admin_user
  description = "The admin user for Grafana"
  sensitive   = true
}
