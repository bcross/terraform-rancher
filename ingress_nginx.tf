resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"

  namespace        = var.ingress_nginx_namespace
  create_namespace = true

  values = [file("./helm/values/nginx_ingress_values.yaml")]

  wait_for_jobs = true

  depends_on = [kind_cluster.default]
}