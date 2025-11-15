/**
 * Creates a node pair on a qemu/libvirt hybervisor for ci purposes.
 */

locals {
  use_generated_keypair = var.ssh_private_key == "" && var.ssh_public_key == ""
  ssh_agent_identity    = var.ssh_private_key == "" ? var.ssh_public_key : ""
  ssh_public_key        = local.use_generated_keypair ? tls_private_key.keypair[0].public_key_openssh : var.ssh_public_key
  ssh_private_key       = local.use_generated_keypair ? tls_private_key.keypair[0].private_key_openssh : var.ssh_private_key
}

resource "tls_private_key" "keypair" {
  count     = local.use_generated_keypair ? 1 : 0
  algorithm = "ED25519"
}

resource "libvirt_cloudinit_disk" "ci" {
  count = 2
  name  = "${var.nodes[count.index]}_cloudinit.iso"
  pool  = var.libvirt_pool_name
  user_data = templatefile("${path.module}/provision/cloud-init/user-data.cfg.tftpl", {
    ssh_public_key = local.ssh_public_key
    hostname       = var.nodes[count.index]
  })
  network_config = templatefile("${path.module}/provision/cloud-init/network-config.yml.tftpl", {
    addresses   = var.nodes_addresses[count.index]
    gateway_ip4 = var.nodes_gateway_ip4
    gateway_ip6 = var.nodes_gateway_ip6
  })
}

resource "libvirt_volume" "base" {
  name   = "noble-server-cloudimg-amd64.img"
  pool   = var.libvirt_pool_name
  source = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
}

resource "libvirt_network" "local" {
  count     = var.libvirt_network_name != "default" ? 1 : 0
  name      = var.libvirt_network_name
  mode      = "nat"
  domain    = "${var.libvirt_network_name}.local"
  addresses = var.libvirt_network_subnets
  xml {
    xslt = file("${path.module}/libvirt-network.xsl")
  }
}

resource "libvirt_volume" "root" {
  count          = 2
  name           = "${var.nodes[count.index]}_root"
  pool           = var.libvirt_pool_name
  base_volume_id = libvirt_volume.base.id
  size           = 21474836480
}

resource "libvirt_domain" "node" {
  count      = 2
  name       = var.nodes[count.index]
  machine    = "q35"
  cloudinit  = libvirt_cloudinit_disk.ci[count.index].id
  memory     = 2048
  vcpu       = 2
  qemu_agent = true
  xml {
    xslt = file("${path.module}/libvirt-domain.xsl")
  }
  cpu {
    mode = "host-passthrough"
  }
  disk {
    volume_id = libvirt_volume.root[count.index].id
    scsi      = true
  }
  network_interface {
    network_name = var.libvirt_network_name
  }
  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }
  provisioner "remote-exec" {
    inline = [
      "cloud-init status --wait"
    ]
    connection {
      type           = "ssh"
      user           = "ubuntu"
      agent_identity = local.ssh_agent_identity
      private_key    = local.ssh_private_key
      host           = regex("[^/]*", var.nodes_addresses[count.index][0])
    }
  }
}
