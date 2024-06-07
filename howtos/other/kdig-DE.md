# kdig mit DoT

Das tool `kdig` aus dem `knot-utils` package (Debian/Ubuntu) versteht die Option `+tls` um DNS resolver mittels DoT zu befragen.

    kdig +tls @2a05:fc84::42 -tA digiges.ch

Legacy IP:

    kdig +tls @185.95.218.42 -tA digiges.ch

Siehe [man 1 kdig](https://manpages.debian.org/stable/knot-dnsutils/kdig.1.en.html) für mehr Details.
