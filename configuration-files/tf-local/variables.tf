variable "nodes" {
  type    = list(string)
  default = ["localdns1", "localdns2"]
}

variable "nodes_addresses" {
  type    = list(list(string))
  default = [
    ["10.52.7.116/28", "fd42:56b6:246b:67bc::116/64"],
    ["10.52.7.117/28", "fd42:56b6:246b:67bc::117/64"]
  ]
}

variable "nodes_gateway_ip4" {
  type    = string
  default = "10.52.7.113"
}

variable "nodes_gateway_ip6" {
  type    = string
  default = "fd42:56b6:246b:67bc::1"
}

variable "ssh_private_key" {
  type        = string
  default     = ""
  description = "SSH private key to be used to provision the node. A new keypair is generated and stored in terraform state if omitted."
}

variable "ssh_public_key" {
  type        = string
  default     = ""
  description = "SSH public key added to the default cloud-init account. A new keypair is generated and stored in terraform state if omitted."
}

variable "libvirt_connect_uri" {
  type        = string
  default     = "qemu:///system"
  description = "Connect string for libvirt."
}

variable "libvirt_network_name" {
  type        = string
  default     = "localdns"
  description = "Network to connect the libvirt node to."
}

variable "libvirt_network_subnets" {
  type        = list(string)
  default     = ["10.52.7.112/28", "fd42:56b6:246b:67bc::/64"]
  description = "Subnets for of libvirt network."
}

variable "libvirt_pool_name" {
  type        = string
  default     = "default"
  description = "Storage pool to use for libvirt images."
}
