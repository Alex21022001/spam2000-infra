module "minikube" {
  source = "./modules/minikube"

  cluster_name = var.minikube_cluster_name
  memory_mb    = var.minikube_cluster_ram
  cpu_count    = var.minikube_cluster_cpu
  nodes        = var.minikube_cluster_nodes
  ports        = var.minikube_cluster_ports
}

module "argocd" {
  source = "./modules/argocd"

  namespace     = var.argocd_namespace
  chart_version = var.argocd_chart_version
  ingres_path   = var.argocd_ingres_path
  hostname      = var.hostname

  depends_on = [module.minikube]
}

module "argocd_root_app" {
  source = "./modules/argocd_root_app"

  namespace                 = var.argocd_namespace
  git_source_path           = var.argocd_root_git_source_path
  git_source_repoURL        = var.argocd_root_git_source_repoURL
  git_source_targetRevision = var.argocd_root_git_source_targetRevision

  depends_on = [module.argocd]
}

module "vm" {
  source = "./modules/vm"

  namespace       = var.vm_namespace
  chart_version   = var.vm_chart_version
  grafana_path    = var.vm_grafana_path
  vm_retention    = var.vm_retention
  vm_memory_limit = var.vm_memory_limit
  vm_cpu_limit    = var.vm_cpu_limit

  depends_on = [module.argocd]
}
