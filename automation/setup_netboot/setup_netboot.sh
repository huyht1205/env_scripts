#!/bin/bash

# This is setup for TFTP server and NFS server for booting linux via
# local network for embedded board

sudo apt-get install tftp tftpd nfs-kernel-server

cp ./tftp /etc/xinetd.d/tftp

echo '/tftpboot *(rw,root_squash,sync,no_subtree_check)' >> /etc/exports

sudo service nfs-kernel-server start
