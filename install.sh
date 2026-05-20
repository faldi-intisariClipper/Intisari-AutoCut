#!/bin/bash
# =========================================================
# INTISARI AUTOCUT - AUTO INSTALLER VIP
# =========================================================

export DEBIAN_FRONTEND=noninteractive

echo "[*] Mengoptimalkan sistem Termux..."
apt update -y
apt upgrade -y -o Dpkg::Options::="--force-confold"

echo "[*] Mengunduh paket aplikasi..."
apt install wget -y
wget -O intisari-latest.deb https://autocutdeb.intisariapps.com/intisari-autocut-latest.deb

if [ ! -f intisari-latest.deb ]; then
    echo "[!] ERROR: Download gagal! Periksa koneksi internet Anda."
    exit 1
fi

echo "[*] Melakukan instalasi mesin..."
apt install ./intisari-latest.deb -y
rm -f intisari-latest.deb

echo "[*] Mengonfigurasi Auto-Run..."
if ! grep -q "intisari" ~/.bashrc; then
    echo "intisari" >> ~/.bashrc
    echo "[V] Auto-Run berhasil diaktifkan."
else
    echo "[!] Auto-Run sudah terkonfigurasi sebelumnya."
fi

echo "========================================================="
echo "✅ INSTALASI SELESAI!"
echo "Silakan restart Termux atau ketik 'intisari menu'."
echo "========================================================="

intisari menu
