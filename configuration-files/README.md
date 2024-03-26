# Secure DNS Resolver Configuration

Ansible managed configuration files for DNS-over-HTTPS (DoH) and DNS-over-TLS (DoT) DNS resolver.

This configuration is applied to the production secure DNS resolver of the Digital Society. This document describes how
to use the Ansible setup for your own setup.

If you are interested in:

- running this configuration for testing purpose on your local machine see [Local](LOCAL.md)
- the documentation of important files and variables of this project, see [Documentation](DOCUMENTATION.md)

## Apply the Ansible Configuration

This step is very common, as soon as the Ansible configuration files are changed this step will activate the new
configuration on the DNS resolvers.

Change into `configuraiton-files` and start a dry-run of the Ansible configuration.

```shell
cd configuration-files
ansible-playbook --ask-become-pass --ask-vault-pass resolver.yml --check
```

When the output does not contain any unexpected surprises, remove the flag `--check` to definitively apply the
configuration to the DNS resolvers.

## Initial Setup

This step only done when a new server is added and the Ansible configuration shall be applied the very first time.

1. Run the playbook:
    ```shell
    ansible-playbook  --ask-become-pass --ask-vault-pass resolver.yml
    ```
2. Login to the server via SSH and create TLS certificates manually. Each productive server has two separate Let's
   Encrypt certificates. Following an example dry run on host `res3`. Remove `--dry-run` once there are no errors.
    ```shell
    sudo certbot certonly --config /etc/letsencrypt/cli.ini --key-type ecdsa --cert-name res3.digitale-gesellschaft.ch.ecdsa -d res3.digitale-gesellschaft.ch --dry-run
    sudo certbot certonly --config /etc/letsencrypt/cli.ini --key-type ecdsa --cert-name dns.digitale-gesellschaft.ch.ecdsa -d dns.digitale-gesellschaft.ch -d dns1.digitale-gesellschaft.ch -d dns2.digitale-gesellschaft.ch --dry-run
    ```
3. Rerun the playbook:
    ```shell
    ansible-playbook  --ask-become-pass --ask-vault-pass resolver.yml
    ```
   The playbook should run without errors.
