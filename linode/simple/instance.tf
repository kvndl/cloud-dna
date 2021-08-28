resource "linode_instance" "heimdall" {
  image           = var.image
  label           = "${var.name}-${var.region}"
  region          = var.region
  type            = var.type
  authorized_keys = [var.public_ssh_key]
  root_pass       = var.root_pass

  group = "Terraform"
}
