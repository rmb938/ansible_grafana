# ansible_grafana
Ansible to Manage Grafana in my Home Lab 

This runs in a TrueNAS Jail

## Requirements

* Base Requirements
```bash
pkg install sudo
echo '%wheel ALL=(ALL) ALL' > /usr/local/etc/sudoers.d/allow-wheel-user-login
pkg install lang/python3
pw user add -n ansible -d /home/ansible -m -s /bin/sh
echo "ansible ALL=(ALL) NOPASSWD: ALL" > /usr/local/etc/sudoers.d/ansible
```
* Tailscale
```bash
pkg install tailscale
sysrc tailscaled_enable="YES"
sysrc tailscaled_syslog_output_enable="YES"
service tailscaled start
tailscale up --ssh
```
