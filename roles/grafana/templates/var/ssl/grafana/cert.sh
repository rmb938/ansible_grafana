#!/bin/sh

set -euo pipefail

/usr/local/bin/tailscale cert --cert-file /var/ssl/grafana/tls.crt --key-file /var/ssl/grafana/tls.key {{ inventory_hostname }}
/usr/sbin/chown grafana:grafana /var/ssl/grafana/tls.crt /var/ssl/grafana/tls.key
/bin/chmod 0600 /var/ssl/grafana/tls.crt /var/ssl/grafana/tls.key
/usr/sbin/service grafana restart
