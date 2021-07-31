# Heimdall DNA
Terraform configurations needed to setup Heimdall on Linode

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_linode"></a> [linode](#requirement\_linode) | >= 1.19 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_linode"></a> [linode](#provider\_linode) | 1.19.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [linode_instance.heimdall](https://registry.terraform.io/providers/linode/linode/latest/docs/resources/instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_image"></a> [image](#input\_image) | An Image ID to deploy the Disk from | `string` | `"linode/rocky8"` | no |
| <a name="input_linode_token"></a> [linode\_token](#input\_linode\_token) | Personal API token used to authenticate with Linode | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name to use when creating resources | `string` | `"heimdall"` | no |
| <a name="input_public_ssh_key"></a> [public\_ssh\_key](#input\_public\_ssh\_key) | Initial SSH key for the root user account | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Location where the Linode is deployed | `string` | `"us-east"` | no |
| <a name="input_root_pass"></a> [root\_pass](#input\_root\_pass) | Initial password for the root user account | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | Instance type to create | `string` | `"g6-nanode-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | Public IP address of instance |
