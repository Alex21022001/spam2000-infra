variable "namespace" {
  description = "Kubernetes namespace for ArgoCD"
  type        = string
  default     = "argocd"
}

variable "chart_version" {
  description = "ArgoCD Helm chart version"
  type        = string
  default     = "9.3.7"
}

variable "hostname" {
  description = "ArgoCD Hostname"
  type        = string
  default     = "localhost"
}

variable "schema" {
  description = "ArgoCD Schema"
  type        = string
  default     = "http"
}

variable "port" {
  description = "ArgoCD Port"
  type        = string
  default     = "8080"
}

variable "ingres_path" {
  description = "ArgoCD Ingres path"
  type        = string
  default     = "/argocd"
}
