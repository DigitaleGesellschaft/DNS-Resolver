# FAQ

This document covers frequently asked questions about our secure DNS resolver systems.


0. Is the service primarily intended for users living in Swiss, or do you also have points of presence in other countries (which ones)?

   Our servers are located in Zurich/Switzerland and are primarily intended for people living in Switzerland or in close neighbour countries due to low latency. Our services are accessible and usable form around the world tough.

0. What would you say is the capacity of the service?

   Our DNS resolver services are stable and intended for production use. We have two load sharing servers with a weekly average of about 100 QPS each (July 2020). The servers still have a lot of capacity. Keep in mind we are a charitable organisation and therefore only provide best effort support and availability due to our voluntary engagement.

0. Are you aware of any differences between your implementation of DoH and the spec [RFC8484](https://tools.ietf.org/html/rfc8484)?

   We are compliant with RFC8484.

0. Do you know if your service is compliant with this [RFC3597](https://tools.ietf.org/html/rfc3597) detailing how to handle unknown DNS resource record (RR) types?

   We are compliant with RFC3597.

0. Are you blocking / filtering any domain?

   We deliberately do not block or filter any domains.

0. When a domain doesn't exist, does your service respond with NXDOMAIN?

   Yes, non-existing domains are answered with NXDOMAIN.

0. Is there an associated regular DNS service on a public IP address or is it a DoH only service?

   We provide DoH and DoT only DNS resolvers. We deliberately do not operate unencrypted DNS on 53/udp/tcp.

0. Is there an IP address rate limit implemented?

   No.

0. Do you provide an alternate DNS address that blocks ads/malware/trackers domains?

   No, currently not.

0. Do you support DNSCrypt?

   No, currently not.
