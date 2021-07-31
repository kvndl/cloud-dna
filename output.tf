output "ip_address" {
  value       = linode_instance.heimdall.ip_address
  description = "Public IP address of instance"
}
