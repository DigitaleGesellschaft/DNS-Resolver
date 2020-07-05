# Curl mit DoH


## Experten

Diese Konfigurationsvorschläge richten sich an sehr erfahrene Personen. Es muss zum Teil Drittsoftware nach installiert werden oder Einstellungen in den Konfigurationsdateien angepasst werden.

Ab [Version 7.62.0](https://daniel.haxx.se/blog/2018/09/06/doh-in-curl/) (Oktober 2018) unterstützen curl und libcurl DoH für die Namensauflösung:

    curl --doh-url https://dns.digitale-gesellschaft.ch/dns-query https://www.example.com

