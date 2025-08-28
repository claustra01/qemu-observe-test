#!/usr/bin/env bash

# generate image
qemu-img create -f qcow2 vm.img 2G

# boot guest
sudo qemu-system-x86_64 \
  -m 8G -cpu host -enable-kvm \
  -drive file=vm.img,if=virtio \
  -qmp unix:/tmp/qmp.sock,server=on,wait=off
