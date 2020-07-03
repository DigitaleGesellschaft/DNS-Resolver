
## Overview

Our two servers have an identical setup. Here is a deployment diagram as an overview.

- Nginx is our reverse proxy which handles connections on port 853/tcp and port 443/tcp. All crypto and certificate configurations are done here.
- [DNS-over-HTTPS](https://github.com/m13253/dns-over-https) is responsible for translating HTTP to DNS and vice versa.
- Unbound is our DNS resolver, all name to IP translation work is done here.

![DNS Resolver Deployment Diagram](img/DNS-Resolver-Deployment-Diagram.png)
