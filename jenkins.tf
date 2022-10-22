resource "helm_release" "jenkins" {
  name       = "jenkins"
  repository = "https://charts.jenkins.io/"
  chart      = "jenkins"

  values = [templatefile("./helm/values/jenkins_values.yaml", { password = var.password, hostname = var.hostname })]

  depends_on = [helm_release.gitea]
}