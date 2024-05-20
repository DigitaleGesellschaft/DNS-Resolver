# Turris Omnia mit DoT


Menü unter Turris-Logo > `Network Settings` > `DNS`

![](img/turris_dns.png)

Unten rechts auf `Add custom forwarder` klicken und [DigiGes Konfiguration](../../README.md) eingeben. Unter `TLS type` `Hostname` auswählen und bei `TLS hostname` den Port weglassen (`dns.digitale-gesellschaft.ch`). Dann speichern.

![](img/turris_custom.png)

Auf der DNS-Seite den neuen Eintrag für den DigiGes-DNS auswählen und wieder speichern.

![](img/turris_digiges.png)

Unten auf der DNS-Seite den `Connection Test` durchführen. Zwei grüne Haken bei `DNS` und `DNSSEC` sollten erscheinen. Falls der `DNSSEC`-Test fehlschlägt, sicherstellen, dass `DNSSEC` oben aktiviert ist.

![](img/turris_test.png)

Weitere Details finden sich in der [offiziellen Dokumentation](https://docs.turris.cz/basics/reforis/dns/reforis-dns/).
