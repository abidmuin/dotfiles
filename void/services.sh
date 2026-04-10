#!/bin/sh

SERVICES="dbus elogind polkitd udevd bluetoothd wpa_supplicant dhcpcd tlp"

echo "Enabling Void services..."
for s in $SERVICES; do
    if [ -d "/etc/sv/$s" ]; then
        sudo ln -sf /etc/sv/$s /var/service/
        echo "[+] Enabled $s"
    else
        echo "[!] Warning: Service $s not found in /etc/sv/"
    fi
done

