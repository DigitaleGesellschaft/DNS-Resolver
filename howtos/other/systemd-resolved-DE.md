# systemd resolved

Eine Datei unter `/etc/systemd/resolved.conf.d/digitale-gesellschaft.conf` mit folgendem Inhalt erstellen:

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

Konfiguration neu laden:

```
sudo systemctl reload systemd-resolved.service
```

Änderungen prüfen:

```
resolvectl status
```

Das Kommando oben sollte folgendes ausgeben:

```
Global
         Protocols: +LLMNR -mDNS +DNSOverTLS DNSSEC=yes/supported
  resolv.conf mode: stub
       DNS Servers: 2a05:fc84::42#dns.digitale-gesellschaft.ch 2a05:fc84::43#dns.digitale-gesellschaft.ch
                    185.95.218.42#dns.digitale-gesellschaft.ch 185.95.218.43#dns.digitale-gesellschaft.ch
        DNS Domain: ~.
[...]
```
