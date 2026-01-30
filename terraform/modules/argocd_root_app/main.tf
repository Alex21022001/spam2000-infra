terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

resource "kubectl_manifest" "argocd_root" {
  yaml_body = templatefile("${path.module}/root.yaml", {
    namespace      = var.namespace
    path           = var.git_source_path
    repoURL        = var.git_source_repoURL
    targetRevision = var.git_source_targetRevision
  })
}
