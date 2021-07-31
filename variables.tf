variable "linode_token" {
  type        = string
  description = "Personal API token used to authenticate with Linode"
}

variable "name" {
  type        = string
  description = "Name to use when creating resources"
  default     = "heimdall"
}

variable "region" {
  type        = string
  description = "Location where the Linode is deployed"
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
  description = "Initial password for the root user account"
}

variable "public_ssh_key" {
  type        = string
  description = "Initial SSH key for the root user account"
}
