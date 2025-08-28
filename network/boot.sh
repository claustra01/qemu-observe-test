#!/usr/bin/env bash

# generate image
wget https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-13.0.0-amd64-netinst.iso -O debian.iso
qemu-img create -f qcow2 debian.qcow2 4G

# boot guest
sudo qemu-system-x86_64 \
  -m 8G \
  -enable-kvm \
  -netdev user,id=net0 \
  -device virtio-net-pci,netdev=net0,mac=52:54:00:aa:bb:cc \
  -object filter-dump,id=f1,netdev=net0,file=/tmp/guest.pcap \
  -drive file=debian.qcow2,if=virtio,cache=none,format=qcow2 \
  -cdrom debian.iso
