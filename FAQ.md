# FAQ

This document covers frequently asked questions about our secure DNS resolver systems.

## General

1. Can I use your secure DNS resolvers for private usage?

   - Yes.

2. Why does the Digital Society provide this service?

   - We think a decentralised and censor resistent Internet is important for our society.

3. How can I help?
   - There are several things you can do:
     - Review our [configuration files](configuration-files) and [guides](howtos) and improve them.
     - The annual costs for operating the servers amount to 1'000 CHF. Perhaps it is possible for you to make
       a [donation](https://www.digitale-gesellschaft.ch/uber-uns/unterstuetzer-werden/).

### For Companies

1. Can I use your secure DNS resolvers for our employees?
   - Technically yes, but we encourage you to set up your own secure resolvers.

## Servers

1. Where are the DNS resolvers located?
   - Zurich, Switzerland

## Configuration

1. Can I use your service for plain text (unencrypted) DNS?
   - No, we only provide encrypted DNS-over-HTTPS or DNS-over-TLS. We deliberately do not operate a plain text DNS to
     avoid user configuration errors.

## Technical Questions

1. Do you block any domains?

   - No, we do not block any domain. Checkout our transparency reports and privacy
     notice: https://www.digitale-gesellschaft.ch/dns/ However, we do temporarily block clients or requests if they
     have malicious behaviour and/or impact our service for other users.

2. Do you support DNSCrypt?
   - No, currently not.
