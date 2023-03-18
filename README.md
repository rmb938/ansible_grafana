# ansible_grafana
Ansible to Manage Grafana in my Home Lab 

This runs in a TrueNAS Jail

## Requirements

* Base Requirements
```bash
pkg install -y security/sudo lang/python3 devel/py-pip
pw user add -n ansible -d /home/ansible -m -s /bin/sh
echo '%wheel ALL=(ALL) ALL' > /usr/local/etc/sudoers.d/wheel
echo "ansible ALL=(ALL) NOPASSWD: ALL" > /usr/local/etc/sudoers.d/ansible
```
* Tailscale
```bash
mkdir -p /usr/local/etc/pkg/repos
cat > /usr/local/etc/pkg/repos/FreeBSD.conf << EOF
FreeBSD: {
  url: "pkg+http://pkg.FreeBSD.org/\${ABI}/latest",
  mirror_type: "srv",
  signature_type: "fingerprints",
  fingerprints: "/usr/share/keys/pkg",
  enabled: yes
}
EOF
pkg install -y security/tailscale
sysrc tailscaled_enable="YES"
sysrc tailscaled_syslog_output_enable="YES"
service tailscaled start
tailscale up --ssh
```
