# Turis Omnia / OpenWRT mit DoT

> :warning: **Für Experten** :warning:
>
> Diese Konfigurationsvorschläge richten sich an sehr erfahrene Personen. Es muss zum Teil Drittsoftware nach installiert werden oder Einstellungen in den Konfigurationsdateien angepasst werden.

Der DNS-Resolver des Turris Omnia Router, kresd, kann per SSH auch für DoT konfiguriert werden. Die folgende Anleitung für DoT via die DNS-Server der Digitalen Gesellschaft sollte auch allgemein für OpenWRT basierte Geräte funktionieren.

1. Konfigurationsdatei erstellen.

   Eine neuen Datei unter `/etc/resolver/dns_servers/99_digiges.conf` mit folgendem Inhalt erstellen:

   ```
   name="99_digiges.conf"
   description="Digitale Gesellschaft (TLS)"
   enable_tls="1"
   port="853"
   ipv4="185.95.218.42 185.95.218.43"
   ipv6="2a05:fc84::42 2a05:fc84::43"
   ca_file="/etc/ssl/certs/ca-certificates.crt"
   hostname="dns.digitale-gesellschaft.ch"
   ```

2. Lokalen Resolver umstellen.

   In der Datei `/etc/config/resolver` in der Sektion `config resolver 'common'` folgende Zeilen ändern/hinzufügen:

   ```
   option forward_upstream '1'
   option forward_custom '99_digiges'
   ```

3. Lokalen Resolver neustarten
   ```
   /etc/init.d/resolver restart
   ```

Weitere Details finden sich in der [offiziellen Dokumentation](https://doc.turris.cz/doc/en/public/dns_knot_misc).
