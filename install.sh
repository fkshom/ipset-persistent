#!/usr/bin/env bash

if [[ $(id -u) -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

apt install -y ipset

mkdir -p /usr/sbin
script_dir="$(dirname "$0")"
cp "$script_dir/ipset-persistent" /usr/sbin/ipset-persistent
chmod +x /usr/sbin/ipset-persistent

cat <<EOF | tee /etc/systemd/system/ipset-persistent.service
[Unit]
Description=IPSet Persistent Service
After=network.target

[Service]
Type=oneshot
ExecStart=/usr/sbin/ipset-persistent reload
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
Before=netfilter-persistent.service
EOF

mkdir -p /opt/ipsets

systemctl daemon-reload
systemctl enable ipset-persistent.service
