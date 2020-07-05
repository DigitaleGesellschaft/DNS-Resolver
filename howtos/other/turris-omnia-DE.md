# Turis Omnia / OpenWRT mit DoT


## Experten

Diese Konfigurationsvorschläge richten sich an sehr erfahrene Personen. Es muss zum Teil Drittsoftware nach installiert werden oder Einstellungen in den Konfigurationsdateien angepasst werden.

Der Turris Omnia Router kann per SSH ebenfalls auf DoT konfiguriert werden. Die Anleitung sollte auch allgemein für OpenWRT basierte Geräte funktionieren.

0. Der Turris Omnia Router kann per SSH ebenfalls auf DoT konfiguriert werden. Die Anleitung sollte auch allgemein für OpenWRT basierte Geräte funktionieren.
   ```
   name="99_digiges.conf"
   description="Digitale Gesellschaft (TLS)"
   enable_tls="1"
   port="853"
   ipv4="185.95.218.42"
   ipv6="2a05:fc84::42"
   hostname="dns.digitale-gesellschaft.ch"
   ```
0. Lokalen Resolver umstellen. In der Datei /etc/config/resolver in der Sektion config resolver ‘common‘ folgende Zeilen ändern/hinzufügen: 
   ```
   option forward_upstream ‚1'
   option forward_custom ’99_digiges'
   ```
0. Lokalen Resolver neustarten
   ```
   /etc/init.d/resolver restart
   ```

Weitere Details finden sich in der [offiziellen Dokumentation](https://doc.turris.cz/doc/en/public/dns_knot_misc).
