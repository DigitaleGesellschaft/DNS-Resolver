# DNS-Resolver
Technical overview and configuration files of our public DoT and DoH DNS resolvers.


The Digital Society Switzerland runs two publicly available DoH and DoT DNS resolver systems. In this repository we provide various configuration [instructions](howtos/) so you can use our service. To use transparency and a diverse Internet is very important, therefore we provide our live [configuration](configuration-files/). Everyone is welcome to copy our configuration and run his/her own secure DNS resolver.

Our DNS resolvers:

- DoT: `dns.digitale-gesellschaft.ch:853`
- DoH: `https://dns.digitale-gesellschaft.ch/dns-query`

Do you have improvement suggestions and/or questions about our configuration? Check out our [FAQ](FAQ.md) or get in contact with us. More information can be found [here](https://www.digitale-gesellschaft.ch/dns/) (German only).

The following illustration describes the idea of our secure DNS service.

![Secure DNS resolver in a pig picture](img/Secure-DNS-Resolver-Big-Picture-100p.png)


## Technical Information & Configuration How To’s

Technically every DNS-over-HTTPS or DNS-over-TLS conform software or system is able to be configured to our public services. Simply point them to our secure DNS resolvers:

- DoT: `dns.digitale-gesellschaft.ch:853`
- DoH: `https://dns.digitale-gesellschaft.ch/dns-query`

In case you want IP addresses use these:

- `2a05:fc84::42`
- `2a05:fc84::43`
- `185.95.218.42`
- `185.95.218.43`

These are virtual IP addresses (VRRP) and are shared by our server instances.

The following list gives you some ideas how to configure your software or system to use our secure DNS resolvers. The list of how-tos is not complete. Feel free to add configuration instructions or translations in other languages via a pull request (PR).

### Browser Configuration

- Firefox with DoH: [German](howtos/browser/firefox-DE.md)
- Opera with DoH: [German](howtos/browser/opera-DE.md)
- Chrome / Chromium with DoH: [German](howtos/browser/chrome-DE.md)


### Operating System

- Android / Lineage OS with DoT: [German](howtos/os/android-DE.md)
- iOS Profile: [German](howtos/os/ios-DE.md)


### Other

- Curl with DoH: [German](howtos/other/curl-DE.md)
- Stubby with DoT: [German](howtos/other/stubby-DE.md)
- Turris Omnia / OpenWRT with DoT: [German](howtos/other/turris-omnia-DE.md)
