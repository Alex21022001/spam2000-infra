# -----General-----
variable "hostname" {
  description = "Hostname to use"
  type = string
  default = "localhost"
}

# -----Minikube-----
variable "minikube_cluster_name" {
  description = "Minikube Cluster Name"
  type = string
}

variable "minikube_cluster_ram" {
  description = "Minikube RAM in MB"
  type = number
}

variable "minikube_cluster_cpu" {
  description = "Minikube CPU"
  type = number
}

variable "minikube_cluster_nodes" {
  description = "Minikube Nodes"
  type = number
}

variable "minikube_cluster_ports" {
  description = "Ports exposed by Cluster"
  type = list(string)
  default = ["8080:80"]
}


# -----ArgoCD-----
variable "argocd_namespace" {
  description = "Kubernetes namespace for ArgoCD"
  type        = string
}

variable "argocd_chart_version" {
  description = "ArgoCD Helm chart version"
  type        = string
}

variable "argocd_ingres_path" {
  description = "ArgoCD Ingres path"
  type        = string
}

# -----ArgoCD Root-----
variable "argocd_root_git_source_repoURL" {
  description = "GitSource repoURL to Track and deploy by ROOT Application"
  type        = string
}

variable "argocd_root_git_source_path" {
  description = "GitSource Path in Git Repository to Track and deploy by ROOT Application"
  type        = string
}

variable "argocd_root_git_source_targetRevision" {
  description = "GitSource HEAD or Branch to Track and deploy by ROOT Application"
  type        = string
}

# -----VictoriaMetrics-----
variable "vm_namespace" {
  description = "Namespace for VictoriaMetrics Stack"
  type        = string
}

variable "vm_chart_version" {
  description = "VictoriaMetrics Helm chart version"
  type        = string
}

variable "vm_retention" {
  description = "Data retention period (e.g. 1, 12, 1y)"
  type        = string
}

variable "vm_storage_size" {
  description = "Persistent Volume size"
  type        = string
}

variable "vm_memory_limit" {
  description = "Memory limit for VM Single"
  type        = string
}

variable "vm_cpu_limit" {
  description = "CPU limit for VM Single"
  type        = string
}

variable "vm_grafana_path" {
  description = "Grafana subpath (must start with /)"
  type        = string
}
