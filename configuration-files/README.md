# Server Configuration

- OS: Ubuntu 20.04 LTS
- Reverse Proxy: Nginx
- DNS Resolver: Unbound
- DoH Proxy: [DNS-over-HTTPS](https://github.com/m13253/dns-over-https)


## Overview

Our two servers have an identical setup. Here is a deployment diagram as an overview.

- Nginx is our reverse proxy which handles connections on port 853/tcp and port 443/tcp. All crypto and certificate configurations are done here.
- Unbound is our DNS resolver, all name to IP translation work is done here.
- DNS-over-HTTPS is responsible for translating HTTP to DNS and vice versa.

![DNS Resolver Deployment Diagram](../img/DNS-Resolver-Deployment-Diagram.png)


## Configuration

- [index.html](index.html) `/var/www/doh/index.html` Our servers welcome and information page. This site is accessable under [https://dns.digitale-gesellschaft.ch/](https://dns.digitale-gesellschaft.ch/).


### Nginx

- [nginx.conf](nginx/nginx.conf) `/etc/nginx/nginx.conf` Basic Nginx configuration file.
- [tls.conf](nginx/tls.conf) `/etc/nginx/tls.conf` General TLS configuration for all TLS related connections.
- [doh](nginx/doh) `/etc/nginx/sites-available/doh` DoH entry point configuration.
- [dot](nginx/dot) `/etc/nginx/sites-available/dot` DoT entry point configuration.
- [res](nginx/res) `/etc/nginx/sites-available/res` Administration interface configuration.


### Unbound

- [unbound.conf](unbound/unbound.conf) `/etc/unbound/unbound.conf` Nginx configuration file.


### DNS-over-HTTPS

- [doh-server.conf](dns-over-https/doh-server.conf) `/etc/dns-over-https/doh-server.conf` DNS-over-HTTPS configuration file.
