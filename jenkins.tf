resource "helm_release" "jenkins" {
  name             = "jenkins"
  repository       = "https://charts.jenkins.io/"
  chart            = "jenkins"
  namespace        = "jenkins"
  create_namespace = true

  values = [templatefile("./helm/values/jenkins_values.yaml", { password = var.password, hostname = var.hostname })]

  depends_on = [helm_release.cert_manager]
}