#! /bin/bash
sudo apt update && sudo apt install docker.io docker-compose -y
sudo systemctl daemon-reload
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo systemctl status docker.service
sudo mkdir -p /opt/docker/wireguard-pihole
cd /opt/docker/wireguard-pihole
sudo wget https://github.com/R1NLER/linuxcommands/blob/main/docker-compose.yml
nano /opt/docker/wireguard-pihole/docker-compose.yml
#fill the .yml doc and exec with docker-compose up -d
sudo sed -i "s/127.0.0.1 localhost/127.0.0.1 localhost $(hostname)/g" /etc/hosts
sudo systemctl disable systemd-resolved
sudo systemctl stop systemd-resolved
sudo sed -i '/nameserver 127.0.0.53/a nameserver 8.8.8.8' /etc/resolv.conf
sudo sed -i '/nameserver 127.0.0.53/a nameserver 8.8.4.4' /etc/resolv.conf
cd /opt/docker/wireguard-pihole
sudo docker-compose up -d
