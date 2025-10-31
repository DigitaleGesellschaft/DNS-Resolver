<!-- BEGIN_TF_DOCS -->
Creates a node pair on a qemu/libvirt hybervisor for ci purposes.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_libvirt"></a> [libvirt](#provider\_libvirt) | 0.8.3 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [libvirt_cloudinit_disk.ci](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/cloudinit_disk) | resource |
| [libvirt_domain.node](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/domain) | resource |
| [libvirt_network.local](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/network) | resource |
| [libvirt_volume.base](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/volume) | resource |
| [libvirt_volume.root](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/volume) | resource |
| [tls_private_key.keypair](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_libvirt_connect_uri"></a> [libvirt\_connect\_uri](#input\_libvirt\_connect\_uri) | Connect string for libvirt. | `string` | `"qemu:///system"` | no |
| <a name="input_libvirt_network_name"></a> [libvirt\_network\_name](#input\_libvirt\_network\_name) | Network to connect the libvirt node to. | `string` | `"localdns"` | no |
| <a name="input_libvirt_network_subnets"></a> [libvirt\_network\_subnets](#input\_libvirt\_network\_subnets) | Subnets for of libvirt network. | `list(string)` | <pre>[<br/>  "10.52.7.112/28",<br/>  "fd42:56b6:246b:67bc::/64"<br/>]</pre> | no |
| <a name="input_libvirt_pool_name"></a> [libvirt\_pool\_name](#input\_libvirt\_pool\_name) | Storage pool to use for libvirt images. | `string` | `"default"` | no |
| <a name="input_nodes"></a> [nodes](#input\_nodes) | n/a | `list(string)` | <pre>[<br/>  "localdns1",<br/>  "localdns2"<br/>]</pre> | no |
| <a name="input_nodes_addresses"></a> [nodes\_addresses](#input\_nodes\_addresses) | n/a | `list(list(string))` | <pre>[<br/>  [<br/>    "10.52.7.116/28",<br/>    "fd42:56b6:246b:67bc::116/64"<br/>  ],<br/>  [<br/>    "10.52.7.117/28",<br/>    "fd42:56b6:246b:67bc::117/64"<br/>  ]<br/>]</pre> | no |
| <a name="input_nodes_gateway_ip4"></a> [nodes\_gateway\_ip4](#input\_nodes\_gateway\_ip4) | n/a | `string` | `"10.52.7.113"` | no |
| <a name="input_nodes_gateway_ip6"></a> [nodes\_gateway\_ip6](#input\_nodes\_gateway\_ip6) | n/a | `string` | `"fd42:56b6:246b:67bc::1"` | no |
| <a name="input_ssh_private_key"></a> [ssh\_private\_key](#input\_ssh\_private\_key) | SSH private key to be used to provision the node. A new keypair is generated and stored in terraform state if omitted. | `string` | `""` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | SSH public key added to the default cloud-init account. A new keypair is generated and stored in terraform state if omitted. | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
