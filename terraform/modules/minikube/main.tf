terraform {
  required_providers {
    minikube = {
      source = "scott-the-programmer/minikube"
      version = ">= 0.6.0"
    }
  }
}

resource "minikube_cluster" "minikube_cluster" {
  driver       = var.driver
  cluster_name = var.cluster_name
  nodes        = var.nodes
  memory       = var.memory_mb
  cpus         = var.cpu_count
  cni = "bridge"
  ports = var.ports

  addons = [
    "ingress",
    "default-storageclass",
    "storage-provisioner"
  ]

  # Required for VMAgent to work with k8s controller,scheduler,etcd
  extra_config = [
    "controller-manager.bind-address=0.0.0.0",
    "scheduler.bind-address=0.0.0.0",
    "etcd.listen-metrics-urls=http://0.0.0.0:2381"
  ]
}
