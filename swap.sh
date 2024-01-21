#!/bin/bash

# Membuat file swap dengan ukuran yang diinginkan (misalnya 1GB)
sudo fallocate -l 1G /swapfile

# Mengatur izin file swap
sudo chmod 600 /swapfile

# Mengaktifkan file swap
sudo mkswap /swapfile

# Menyalakan swap
sudo swapon /swapfile

# Membuat entri swap permanen di file /etc/fstab
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# Mengatur ukuran swapiness
echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# Menampilkan informasi swap yang berhasil dibuat
echo "Swap RAM berhasil diinstal dengan ukuran 1GB."
 