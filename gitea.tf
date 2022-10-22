resource "helm_release" "gitea" {
  name       = "gitea"
  repository = "https://dl.gitea.io/charts/"
  chart      = "gitea"

  namespace        = "gitea"
  create_namespace = true

  values = [templatefile("./helm/values/gitea_values.yaml", { password = var.password, hostname = var.hostname })]

  depends_on = [helm_release.cert_manager]
}