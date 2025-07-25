#!/bin/bash

echo "======================"
echo "🧠 Linux Hardware Diagnosis - $(date)"
echo "======================"

echo -e "\n💻 Basic System Info:\n"
uname -a
cat /etc/*release*

echo -e "\n🔌 PCI Devices:\n"
lspci -nnk

echo -e "\n🔌 USB Devices:\n"
lsusb

echo -e "\n📶 Network Devices:\n"
lshw -C network 2>/dev/null

echo -e "\n🧠 CPU Info:\n"
lscpu

echo -e "\n🧠 Memory Info:\n"
free -h

echo -e "\n📦 Kernel Modules (Wi-Fi/GPU):\n"
lsmod

echo -e "\n❗ Boot Errors (dmesg fail/fatal/error):\n"
dmesg | grep -iE 'fail|fatal|error'

echo -e "\n🌐 IP Info:\n"
ip a

echo -e "\n🧪 Boot Mode:\n"
if [ -d /sys/firmware/efi ]; then
  echo "UEFI Mode"
else
  echo "Legacy BIOS Mode"
fi

echo -e "\n✅ Diagnosis complete!"
