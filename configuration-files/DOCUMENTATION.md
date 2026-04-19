# Documentation

## Important Files

| File                       | Description                                                                                                                                  |
|----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| ansible.cfg                | Ansible configuration file.                                                                                                                  |
| group_vars/\*              | Variables for local staging and productive DNS resolvers. Also contains the specific vault.yml files (these are not part of this repository) |
| host_vars/\*               | Variables specific to Ansible controlled host.                                                                                               |
| inventory.yml              | Productive DNS resolver hostnames referencing entries in the local ./ssh/config hostnames.                                                   |
| local.yml                  | Local staging DNS resolver hostnames referencing entries in the local ./ssh/config hostnames.                                                |
| resolver.yml               | This is the actual Ansible playbook. It specifies what roles shall be applied to what hosts.                                                 |
| scripts/local-lxc-setup.sh | Helper script to start a local setup based on lxc linux ubuntu containers.                                                                   |

## Roles

| Role              | Description                                                                                        |
|-------------------|----------------------------------------------------------------------------------------------------|
| base              | Basic server setup, user configuration, tool and package installation for basic server management. |
| dns-backend       | Backend DNS resolver configuration, communicates with the domain name system (the Internet).       |
| dns-frontend      | Frontend DNS resolver configuration, encrypted communicates with the users who use our service.    |
| high-availability | VRRP configuration providing high availability between DNS resolvers.                              |
| monitoring        | The server-side and third-party-side monitoring of our DNS resolvers.                              |
| web-server        | Responsible for creating Let's Encrypt certificates and reverse proxy for monitoring purposes.     |

## Ansible Variables

| Variable name                      | Description                                                |
|------------------------------------|------------------------------------------------------------|
| `dg4_dns`                          | IP v4 default gateway                                      |
| `dg6_dns`                          | IP v6 default gateway                                      |
| `dnsdist_nof_thread_doh_per_ip`    | Number of dnsdist threads per DoH IP                       |
| `dnsdist_nof_thread_dot_per_ip`    | Number of dnsdist threads per DoT IP                       |
| `dnsdist_nof_thread_upstream`      | Number of dnsdist upstream threads                         |
| `domain`                           | Domain of this resolver                                    |
| `host_public`                      | Hostname of this resolver                                  |
| `if_loopback`                      | Name of the loopback interface on this server              |
| `if_primary`                       | Name of the primary interface on this server               |
| `ip4_dns1`                         | Public IP v4 address of resolver 1                         |
| `ip4_dns2`                         | Public IP v4 address of resolver 2                         |
| `ip4_vip_dns1`                     | Public IP v4 address of resolver 1                         |
| `ip4_vip_dns2`                     | Public IP v4 address of resolver 2                         |
| `ip4_vrrp1`                        | Internal VRRP (load balancing) IP v4 address of resolver 1 |
| `ip4_vrrp2`                        | Internal VRRP (load balancing) IP v4 address of resolver 2 |
| `ip6_dns1`                         | Public IP v6 address of resolver 1                         |
| `ip6_dns2`                         | Public IP v6 address of resolver 2                         |
| `ip6_vip_dns1`                     | Public IP v6 address of resolver 1                         |
| `ip6_vip_dns2`                     | Public IP v6 address of resolver 2                         |
| `ip6_vrrp1`                        | Internal VRRP (load balancing) IP v6 address of resolver 1 |
| `ip6_vrrp2`                        | Internal VRRP (load balancing) IP v6 address of resolver 2 |
| `ip_localhost`                     | IP v4 of the loopback interface on this server             |
| `netmask4_dns_cidr`                | Netmask of the public IP v4                                |
| `netmask4_vrrp1_cidr`              | Netmask of the internal VRRP (load balancing) IP v4        |
| `netmask6_dns_cidr`                | Netmask of the public IP v6                                |
| `netmask6_vrrp1_cidr`              | Netmask of the internal VRRP (load balancing) IP v6        |
| `network_port_ssh`                 | Custom SSH tcp port                                        |
| `node_exporter_web_listen_address` | Node exporter listening host and port                      |
| `nof_cpu`                          | Number of CPUs of this resolver                            |
| `unbound_msg_cache_size`           | Unbound message cache size in bytes                        |
| `unbound_nof_slabs`                | Unbound number of slabs                                    |
| `unbound_nof_thread`               | Unbound number of Unbound threads                          |
| `unbound_num_queries_per_thread`   | Unbound number of queries per thread                       |
| `unbound_outgoing_range`           | Unbound outgoing range                                     |
| `unbound_rrset_cache_size`         | Unbound RR cache size in bytes                             |
| `unbound_so_rcvbuf`                | Unbound SO receive buffer size in bytes                    |
| `unbound_so_sndbuf`                | Unbound SO send buffer size in bytes                       |
| `vip_interfaces`                   | List of virtual IP v4 and v6 addresses                     |
