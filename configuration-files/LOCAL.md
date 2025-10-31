# Staging

This documents describes how one can set up two local resolvers based on our Ansible configuration in virtual machines.

This setup uses [Linux Containers](https://linuxcontainers.org/) respectively the command `lxc`. But one can apply the
Ansible config on any virtual Ubuntu system.

## Prerequisite

On your host install `lxc` by running:

- `sudo apt install lxc`

We do not keep sensitive information in this repository. Create these files:

- In the `locl.yml` file the two systems `localdns1` and `localdns2` are referred. In order Ansible knows these host systems they need to be in the SSH configuration `~/.ssh/config` file e.g.:

  ```
  host localdns1
  User $USER
  Hostname <ip>
  Port <port>

  host localdns2
  User $USER
  Hostname <ip>
  Port <port>
  ```

- Create a user to connect to. This might be your current user on your local machine. Create a file in `configuration-files/roles/base/tasks/users/$USER.yml` with this content. Change `$USER` with your current username.

  ```
  ---
  - name: users | $USER | create group
    group:
    name: $USER
    state: present

  - name: users | $USER | create user
    user:
    name: $USER
    group: $USER
    groups: adm,sudo
    state: present
    comment: "$USER"
    shell: /bin/bash

  - name: users | $USER | add ssh public key
    authorized_key:
    user: $USER
    key: "add your public key here within the quotes e.g. `cat .ssh/id_rsa.pub`"
  ```

- Create an encrypted secret file for ansible secrets. Contains secrets and passphrases in key-values pairs and is located in `configuration-files/group_vars/local/vault.yml`.
  - Create a new encrypted file by running `ansible-vault create configuration-files/group_vars/local/vault.yml` and add the following content (these are example secrets):
    ```
    dnsdist_control_interface_key: "KZ0-+U?T"
    dnsdist_webserver_api_key: "K[F|8I9?"
    dnsdist_webserver_password: "Lj9*kN?Z"
    keepalived_dns42_4: "tT,"f"?R"
    keepalived_dns42_6: "1}[&Is>x"
    keepalived_dns43_4: "`B<VDz?p"
    keepalived_dns43_6: "3+=rnF8="
    statisitcs_user: statisticsUser
    statistics_password: "PBawJ~^Q"
    ```

## Set up resolver (LXC)

1. Create two linux containers by running:

   ```shell
   ./configuration-files/scripts/local-lxc-setup.sh init
   ```

2. Try to connect to both servers:

   ```shell
   ssh $USER@localdns1 -p 22
   ssh $USER@localdns2 -p 22
   ```

   Once you can connect successfully, proceed with the next step.

3. Configure SSH to on both resolvers:

   ```shell
   ansible-playbook --ask-become-pass --ask-vault-pass configuration-files/resolver.yml -i configuration-files/local.yml \
   --ssh-common-args '-p 22 -l $USER' --tags 'ssh'
   ```

   Once the Ansible successfully finishes, proceed with tne next step.

4. Configure the complete DNS resolvers:
   ```shell
   ansible-playbook --ask-become-pass --ask-vault-pass configuration-files/resolver.yml -i configuration-files/local.yml \
   --ssh-common-args '-p 55022 -l $USER'`
   ```

This is it.

## Set up resolver (opentofu / libvirt / Qemu / KVM)

* Install https://opentofu.org/
  (Use [extrepo](https://manpages.debian.org/stable/extrepo/extrepo.1p.en.html) in Debian / Ubuntu)
* Install `genisoimage`, `libvirt-clients`, `libvirt-daemon-system`, `qemu-kvm`, `xsltproc` packages
* Add your user to `libvirt` and `libvirt-qemu` groups
* Verify the installation:
  ```
  sudo virt-host-validate qemu
  virsh -c qemu:///system pool-list --all
  virsh -c qemu:///system net-list --all
  stat /var/run/libvirt/libvirt-sock /var/lib/libvirt/images
  ```
* Change into `tf-local` directory
* Create a file `terraform.tfvars` and specify an SSH public key:
  ```
  ssh_public_key = "ssh-ed25519 AAAAC3NzaC1..."
  ```
* Run `tofu plan` and `tofu apply`
* Run `tofu destroy` in order to clean up VMs and images.

## Helpful commands

- `sudo lxc list` lists all Linux containers
- `ansible-vault view vault.yml` show content of vault.yml
- `ansible-vault edit vault.yml` edit content of vault.yml
