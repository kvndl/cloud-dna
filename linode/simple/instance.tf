resource "linode_stackscript" "this" {
  label       = "rocky8-heimdall"
  description = "Setup Heimdall instance"
  script      = file("./startup.sh")
  images      = [var.image]
  rev_note    = "v1.1"
}

resource "linode_instance" "this" {
  image           = var.image
  label           = "${var.name}-${var.region}"
  region          = var.region
  type            = var.type
  authorized_keys = [var.public_ssh_key]
  root_pass       = var.root_pass

  stackscript_id = linode_stackscript.heimdall.id

  group = "Terraform"
}
