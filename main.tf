terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "haon"

    workspaces {
      name = "heimdall-dna"
    }
  }

  required_providers {
    linode = {
      source  = "linode/linode"
      version = ">= 1.19"
    }
  }
}

provider "linode" {
  token = var.linode_token
}
