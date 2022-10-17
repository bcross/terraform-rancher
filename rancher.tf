resource "helm_release" "rancher" {
  name             = "rancher"
  repository       = "https://releases.rancher.com/server-charts/stable"
  chart            = "rancher"
  namespace        = "cattle-system"
  create_namespace = true
  set {
    name  = "hostname"
    value = var.hostname
  }
  set {
    name  = "replicas"
    value = "1"
  }
  set {
    name  = "bootstrapPassword"
    value = var.rancher_bootstrapPassword
  }
  depends_on = [
    helm_release.cert_manager
  ]
}