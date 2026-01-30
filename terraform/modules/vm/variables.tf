variable "namespace" {
  description = "Kubernetes namespace for VM"
  type        = string
  default     = "monitoring"
}

variable "chart_version" {
  description = "VM Helm chart version"
  type        = string
  default     = "0.69.0"
}

variable "hostname" {
  description = "VM Hostname"
  type        = string
  default     = "localhost"
}

variable "grafana_path" {
  description = "Grafana subpath (must start with /)"
  type        = string
  default     = "/grafana"
}

# --- VictoriaMetrics Resources ---
variable "vm_retention" {
  description = "Data retention period (e.g. 1, 12, 1y)"
  type        = string
  default     = "7d"
}

variable "vm_storage_size" {
  description = "Storage Size"
  type        = string
  default     = "20Gi"
}

variable "vm_cpu_request" {
  description = "CPU Request for VM Single"
  type        = string
  default     = "500m"
}

variable "vm_cpu_limit" {
  description = "CPU Limit for VM Single"
  type        = string
  default     = "1000m"
}

variable "vm_memory_request" {
  description = "Memory Request for VM Single"
  type        = string
  default     = "2Gi"
}

variable "vm_memory_limit" {
  description = "Memory Limit for VM Single"
  type        = string
  default     = "2Gi"
}

# --- VictoriaMetrics Tuning ---
variable "vm_allowedPercent" {
  description = "Allowed memory percent for cache"
  type        = string
  default     = "90"
}

variable "vm_maxPointsPerTimeseries" {
  description = "Max points per timeseries"
  type        = string
  default     = "30000000"
}

variable "vm_maxUniqueTimeseries" {
  description = "Max unique timeseries"
  type        = string
  default     = "30000000"
}

# --- Configuration ---
variable "vm_datasource_uid" {
  description = "UID for the VictoriaMetrics Datasource in Grafana"
  type        = string
  default     = "victoriametrics-metrics-ds"
}

variable "vm_pod_scrap_interval" {
  description = "Scrape interval for annotated pods"
  type        = string
  default     = "60s"
}
