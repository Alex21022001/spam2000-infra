minikube_cluster_name  = "spam2000"
minikube_cluster_ram   = 6144
minikube_cluster_nodes = 1
minikube_cluster_cpu   = 4

argocd_ingres_path   = "/argocd"
argocd_namespace     = "argocd"
argocd_chart_version = "9.3.7"

argocd_root_git_source_path           = "applications"
argocd_root_git_source_repoURL        = "https://github.com/Alex21022001/spam2000-infra"
argocd_root_git_source_targetRevision = "main"

vm_namespace     = "monitoring"
vm_chart_version = "0.69.0"
vm_retention     = "7d"
vm_storage_size  = "10Gi"
vm_memory_limit  = "2Gi"
vm_cpu_limit     = "1000m"
vm_grafana_path  = "/grafana"
