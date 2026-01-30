variable "driver" {
  default = "docker"
  type = string
}
variable "cluster_name" {
  default = "spam2000"
  type = string
}
variable "nodes" {
  default = 1
  type = number
}
variable "memory_mb" {
  default = 4096
  type = number
}
variable "cpu_count" {
  default = 2
  type = number
}
variable "ports" {
  default = ["8080:80"]
  type = list(string)
}
