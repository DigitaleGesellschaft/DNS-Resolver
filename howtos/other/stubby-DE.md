# Stubby mit DoT

## Experten

Diese Konfigurationsvorschläge richten sich an sehr erfahrene Personen. Es muss zum Teil Drittsoftware nach installiert
werden oder Einstellungen in den Konfigurationsdateien angepasst werden.

Stubby ist ein Stubs Resolver Daemon, welcher DoT unterstützt. Anleitungen für verschiedene Betriebssysteme gibt
es [hier](https://dnsprivacy.org/wiki/display/DP/DNS+Privacy+Daemon+-+Stubby).

In Konfigurationsdatei /etc/stubby/stubby.yml hinzufügen um DoT im Strict-Mode zu verwenden:

    resolution_type: GETDNS_RESOLUTION_STUB

    dns_transport_list:
      - GETDNS_TRANSPORT_TLS

    listen_addresses:
      - 127.0.0.1
      -  0::1

    tls_authentication: GETDNS_AUTHENTICATION_REQUIRED

    round_robin_upstreams: 1

    upstream_recursive_servers:
      - address_data: 185.95.218.42
        tls_auth_name: "dns.digitale-gesellschaft.ch"
      - address_data: 185.95.218.43
        tls_auth_name: "dns.digitale-gesellschaft.ch"
      - address_data: 2a05:fc84::42
        tls_auth_name: "dns.digitale-gesellschaft.ch"
      - address_data: 2a05:fc84::43
        tls_auth_name: "dns.digitale-gesellschaft.ch"

Da wir auf 3-monatige Let’s Encrypt Zertifikate setzen, empfehlen wir SPKI (tls_pubkey_pinset) nicht.
