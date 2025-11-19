# knot resolver

knot resolver unterstützt DoT in den
für [Ubuntu bionic, focal](https://packages.ubuntu.com/search?suite=all&searchon=names&keywords=knot-resolver)
und [Debian buster](https://packages.debian.org/search?suite=all&searchon=names&keywords=knot-resolver) paketierten
Versionen ([Doku](https://knot-resolver.readthedocs.io/en/stable/index.html), [Quellcode](https://gitlab.labs.nic.cz/knot/knot-resolver/tree/master)).
Der Server Prozess wird in beiden Distributionen per socket activation gestartet (siehe `kresd.socket` und
`kresd-tls.socket`). Daher darf in der config Datei kein Port gebunden werden. Ausserdem bringt der Befehl fürs
privilege dropping nichts (weil der Prozess von Beginn weg unter dem User `knot-resolver` läuft). Eine minimale config,
die in beiden Distributionen läuft:

`/etc/knot-resolver/kresd.conf`

```
policy.add(policy.all(policy.TLS_FORWARD({
    {'185.95.218.42', hostname='dns.digitale-gesellschaft.ch', ca_file='/etc/ssl/certs/ca-certificates.crt'},
    {'185.95.218.43', hostname='dns.digitale-gesellschaft.ch', ca_file='/etc/ssl/certs/ca-certificates.crt'},
    {'2a05:fc84::42', hostname='dns.digitale-gesellschaft.ch', ca_file='/etc/ssl/certs/ca-certificates.crt'},
    {'2a05:fc84::43', hostname='dns.digitale-gesellschaft.ch', ca_file='/etc/ssl/certs/ca-certificates.crt'},
})))
```
