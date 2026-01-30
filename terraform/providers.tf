terraform {
  required_providers {
    minikube = {
      source = "scott-the-programmer/minikube",
      version = ">= 0.6.0"
    }
    helm = {
      source = "hashicorp/helm",
      version = ">= 3.1.1"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "3.0.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

provider "minikube" {
  kubernetes_version = "v1.30.0"
}

provider "helm" {
  kubernetes = {
    host                   = module.minikube.host
    client_certificate     = module.minikube.client_certificate
    client_key             = module.minikube.client_key
    cluster_ca_certificate = module.minikube.cluster_ca_certificate
  }
}

provider "kubernetes" {
  host                   = module.minikube.host
  client_certificate     = module.minikube.client_certificate
  client_key             = module.minikube.client_key
  cluster_ca_certificate = module.minikube.cluster_ca_certificate
}

provider "kubectl" {
  host                   = module.minikube.host
  client_certificate     = module.minikube.client_certificate
  client_key             = module.minikube.client_key
  cluster_ca_certificate = module.minikube.cluster_ca_certificate
  load_config_file       = false
}
