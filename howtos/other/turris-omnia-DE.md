# Turis Omnia / OpenWRT mit DoT


## Experten

Diese Konfigurationsvorschläge richten sich an sehr erfahrene Personen. Es muss zum Teil Drittsoftware nach installiert werden oder Einstellungen in den Konfigurationsdateien angepasst werden.

Der Turris Omnia Router kann per SSH ebenfalls auf DoT konfiguriert werden. Die Anleitung sollte auch allgemein für OpenWRT basierte Geräte funktionieren.

0. Der Turris Omnia Router kann per SSH ebenfalls auf DoT konfiguriert werden. Die Anleitung sollte auch allgemein für OpenWRT basierte Geräte funktionieren.
   Dazu die folgenden Eintraege in der (neuen) Datei '/etc/resolver/dns_servers/99_digiges.conf' erfassen - die Datei wird bei einem turris update nicht überschrieben!
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
   Der folgende Block verhindert die automatische Sicherung der Konfigurationeinstellungen, bitte vermeiden! 
   ```
   option forward_upstream ‚1'
   option forward_custom ’99_digiges'
   ```

   Der folgende Block ermöglicht die automatische Sicherung der Konfigurationeinstellungen!
   ```
   uci set resolver.common.forward_upstream='1'
   uci set resolver.common.forward_custom='99_digiges'
   uci commit
   ```
0. Lokalen Resolver neustarten
   ```
   /etc/init.d/resolver restart
   ```

Weitere Details finden sich in der [offiziellen Dokumentation](https://doc.turris.cz/doc/en/public/dns_knot_misc).
