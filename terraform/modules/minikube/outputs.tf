output "host" {
  value = minikube_cluster.minikube_cluster.host
}
output "client_certificate" {
  value = minikube_cluster.minikube_cluster.client_certificate
}
output "client_key" {
  value = minikube_cluster.minikube_cluster.client_key
}
output "cluster_ca_certificate" {
  value = minikube_cluster.minikube_cluster.cluster_ca_certificate
}
