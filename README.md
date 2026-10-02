# Secure DNS Resolver

Information, configuration files and _how tos_ about the public secure DNS resolvers operated by the Digital Society Switzerland.

The Digital Society Switzerland runs publicly available DNS-over-HTTPS (DoH) and DNS-over-TLS (DoT) DNS resolver systems.

![Secure DNS resolver overview](assets/Secure-DNS-Resolver-Overview.png)

This repository contains:

- [Configuration files](configuration-files) of our production systems. Anyone interested in our setup can review our production configuration or run its own setup based on our configuration files. You may also check out our [system architecture](ARCHITECTURE.md).
- [How tos](howtos) to configure encrypted DNS on various devices. This allows people to use our secure DNS resolvers.

Also, checkout our [website](https://www.digitale-gesellschaft.ch/dns/) and the [FAQ](FAQ.md).

# How to use our DNS resolvers

> [!NOTE]
> We deliberately do not operate unencrypted DNS service over Port 53.

To use our DNS resolvers on your DoH or DoT capable client simply configure:

| Protocol             | Address                                                                                          |
| -------------------- | ------------------------------------------------------------------------------------------------ |
| DNS-over-HTTPS (DoH) | `https://dns.digitale-gesellschaft.ch/dns-query`                                                 |
| DNS-over-TLS (DoT)   | `dns.digitale-gesellschaft.ch`, Port `853`                                                       |

For specific configuration check out our [How-Tos](howtos).

## IP addresses

Some clients let you specify the resolver's IP address directly, so they don't need another DNS resolver to look up our hostname.

| Protocol | Addresses                        |
| -------- | -------------------------------- |
| IPv4     | `185.95.218.42`, `185.95.218.43` |
| IPv6     | `2a05:fc84::42`, `2a05:fc84::43` |

You still need to configure `dns.digitale-gesellschaft.ch` as the hostname, otherwise certificate validation fails.

# Contribution

Contributions to this project are very welcome. If you like to contribute, check-out [CONTRIBUTION](CONTRIBUTION.md) for more information.

Some ideas where help is appreciated:

- Configuration how tos: Update existing guides, translate them in other languages and add new how tos.
- Ansible config review: If you know Ansible well you may review our configuration and suggest improvements.
- DNS config: If you know

# Similar Services

You may also try the DNS resolvers of similar organisations and setups:

- [Applied Privacy](https://applied-privacy.net/services/dns/) operates public DNS resolvers in Austria.
- [Quad9](https://www.quad9.net/) operates public DNS resolvers around the world.

# License

This project is licensed under [Creative Commons BY-SA](https://creativecommons.org/licenses/by-sa/4.0/deed.en)
