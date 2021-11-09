variable "linode_token" {
  type        = string
  description = "Personal API token used to authenticate with Linode"
}

variable "name" {
  type        = string
  description = "Name for resources"
  default     = "instance"
}

variable "region" {
  type        = string
  description = "Location to deploy instance"
  default     = "us-east"
}

variable "type" {
  type        = string
  description = "Instance type to create"
  default     = "g6-nanode-1"
}

variable "image" {
  type        = string
  description = "An Image ID to deploy the Disk from"
  default     = "linode/rocky8"
}

variable "root_pass" {
  type        = string
  description = "Password for root user"
}

variable "public_ssh_key" {
  type        = string
  description = "Public SSH key for root user"
}

variable "whitelist" {
  type        = list(string)
  default     = []
  description = "Whitelist for SSH access"
}
