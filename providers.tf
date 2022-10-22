terraform {
  required_providers {
    gitea = {
      source = "Lerentis/gitea"
    }

    kind = {
      source = "kyma-incubator/kind"
    }

    helm = {
      source = "hashicorp/helm"
    }

    null = {
      source = "hashicorp/null"
    }
  }
}

provider "gitea" {
  base_url = "http://${var.hostname}/gitea"
  username = "gitea_admin"
  password = var.password
}

provider "kind" {
}

provider "helm" {
  kubernetes {
    config_path = pathexpand(var.kind_cluster_config_path)
  }
}

provider "null" {
}