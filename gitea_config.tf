resource "gitea_repository" "rancher" {
  name     = "rancher"
  username = "gitea_admin"
  private  = true
  auto_init = false
}

resource "null_resource" "rancher_git" {
    provisioner "local-exec" {
        command = <<EOF
            cd git/rancher
            git init
            git config user.email "no@no.no"
            git config user.name "gitea_admin"
            git checkout -b main
            git add .
            git commit -m "initial commit"
            git push http://gitea_admin:${var.password}@${var.hostname}/gitea/gitea_admin/rancher.git --all
        EOF
    }

    depends_on = [helm_release.jenkins]
}