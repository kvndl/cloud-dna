resource "linode_firewall" "this" {
  label = "web-ssh"
  tags  = ["standard"]

  inbound {
    label    = "allow-https"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "443"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-ssh"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "88"
    ipv4     = var.whitelist
    ipv6     = ["::/0"]
  }

  inbound_policy = "DROP"

  outbound {
    label    = "reject-http"
    action   = "DROP"
    protocol = "TCP"
    ports    = "80"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  outbound_policy = "ACCEPT"

  linodes = [linode_instance.my_instance.id]
}