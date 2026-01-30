terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 3.1.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.0.1"
    }
  }
}

resource "helm_release" "vm_stack" {
  name             = "vm-stack"
  repository       = "https://victoriametrics.github.io/helm-charts"
  chart            = "victoria-metrics-k8s-stack"
  version          = var.chart_version
  namespace        = var.namespace
  create_namespace = true

  values = [
    templatefile("${path.module}/vm-values.yaml", {
      grafana_host = var.hostname
      grafana_path = var.grafana_path

      vm_retention      = var.vm_retention
      vm_storage_size   = var.vm_storage_size
      vm_cpu_request    = var.vm_cpu_request
      vm_cpu_limit      = var.vm_cpu_limit
      vm_memory_request = var.vm_memory_request
      vm_memory_limit = var.vm_memory_limit

      vm_allowedPercent         = var.vm_allowedPercent
      vm_maxPointsPerTimeseries = var.vm_maxPointsPerTimeseries
      vm_maxUniqueTimeseries = var.vm_maxUniqueTimeseries

      vm_datasource_uid     = var.vm_datasource_uid
      vm_pod_scrap_interval = var.vm_pod_scrap_interval
    })
  ]
}

data "kubernetes_secret_v1" "grafana_secret" {
  metadata {
    name      = "vm-stack-grafana"
    namespace = var.namespace
  }

  depends_on = [helm_release.vm_stack]
}
