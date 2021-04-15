#!/bin/bash

# ServerIP should be replaced with your external ip.
# WEBPASSWORD should be replaced with good password and obfuscated after setup.

podman run --name=pihole \
    --cap-add=NET_ADMIN \
    --dns=127.0.0.1 \
    --dns=1.1.1.1 \
    -e TZ=America/Chicago \
    -e SERVERIP=*** \
    -e WEBPASSWORD=*** \
    -e DNS1=1.1.1.1 \
    -e DNS2=1.0.0.1 \
    -e DNSSEC=true \
    -v pihole_pihole:/etc/pihole:Z \
    -v pihole_dnsmasq:/etc/dnsmasq.d:Z \
    -p 80:80/tcp \
    -p 443:443/tcp \
    -p 67:67/udp \
    -p 53:53/tcp \
    -p 53:53/udp \
    pihole/pihole:latest
