# systemd resolved

Create a file in `/etc/systemd/resolved.conf.d/digitale-gesellschaft.conf` with the following content:

```
[Resolve]
DNS=2a05:fc84::42#dns.digitale-gesellschaft.ch
DNS=2a05:fc84::43#dns.digitale-gesellschaft.ch
DNS=185.95.218.42#dns.digitale-gesellschaft.ch
DNS=185.95.218.43#dns.digitale-gesellschaft.ch
DNSOverTLS=yes
DNSSEC=yes
Domains=~.
```

Reload to config:

```
sudo systemctl reload systemd-resolved.service
```

Verify the changes:

```
resolvectl status
```

The output should look like this:

```
Global
         Protocols: +LLMNR -mDNS +DNSOverTLS DNSSEC=yes/supported
  resolv.conf mode: stub
       DNS Servers: 2a05:fc84::42#dns.digitale-gesellschaft.ch 2a05:fc84::43#dns.digitale-gesellschaft.ch
                    185.95.218.42#dns.digitale-gesellschaft.ch 185.95.218.43#dns.digitale-gesellschaft.ch
        DNS Domain: ~.
[...]
```
