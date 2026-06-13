#!/bin/bash
#Script to run QEMU for buildroot as the default configuration qemu_aarch64_virt_defconfig
#Host forwarding: Host Port 10022 ->> QEMU Port 22 
#Author: Siddhant Jajoo.

#TODO : 3. Modify your runqemu.sh script to forward host port 9000 
# to your qemu instance port 9000. 
#Also to pass through virtual machine port 10022 to port 22 on your qemu instance.

#4. Build your image and run with the runqemu.sh script.  Verify you can use ssh to login to your host using port 10022 and the root user/password.


qemu-system-aarch64 \
    -M virt  \
    -cpu cortex-a53 -nographic -smp 1 \
    -kernel buildroot/output/images/Image \
    -append "rootwait root=/dev/vda console=ttyAMA0" \
    -netdev user,id=net0,hostfwd=tcp::9000-:9000,hostfwd=tcp::10022-:22 \
    -device virtio-net-device,netdev=net0 \
    -drive file=buildroot/output/images/rootfs.ext4,if=none,format=raw,id=hd0 \
    -device virtio-blk-device,drive=hd0 -device virtio-rng-pci
