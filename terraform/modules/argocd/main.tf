terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm",
      version = ">= 3.1.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.0.1"
    }
  }
}

resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.chart_version
  namespace        = var.namespace
  create_namespace = true

  values = [
    yamlencode({
      server = {

        extraArgs = [
          "--rootpath=${var.ingres_path}"
        ]

        service = {
          type = "ClusterIP"
        }

        ingress = {
          enabled          = true
          ingressClassName = "nginx"
          hostname         = var.hostname
          path             = var.ingres_path
          pathType         = "Prefix"

          annotations = {
            "nginx.ingress.kubernetes.io/ssl-redirect"       = "false"
            "nginx.ingress.kubernetes.io/force-ssl-redirect" = "false"
            "nginx.ingress.kubernetes.io/backend-protocol"   = "HTTP"
          }
        }
      }

      configs = {
        cm = {
          "url" = "${var.schema}://${var.hostname}:${var.port}${var.ingres_path}"
        }

        params = {
          "server.insecure" = true
        }
      }
    })
  ]
}

data "kubernetes_secret_v1" "argocd_admin_secret" {
  metadata {
    name      = "argocd-initial-admin-secret"
    namespace = var.namespace
  }

  depends_on = [helm_release.argocd]
}
