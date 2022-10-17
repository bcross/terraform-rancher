terraform {
  required_providers {
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

provider "kind" {
}

provider "helm" {
  kubernetes {
    config_path = pathexpand(var.kind_cluster_config_path)
  }
}

provider "null" {
}