variable "kind_cluster_name" {
  type        = string
  description = "The name of the cluster."
  default     = "dev"
}

variable "kind_cluster_config_path" {
  type        = string
  description = "The location where this cluster's kubeconfig will be saved to."
  default     = "~/.kube/config"
}

variable "ingress_nginx_namespace" {
  type        = string
  description = "The nginx ingress namespace (it will be created if needed)."
  default     = "ingress-nginx"
}

variable "hostname" {
  type    = string
  default = "127.0.0.1.sslip.io"
}

variable "password" {
  type    = string
  default = "M7wLtGyE"
}