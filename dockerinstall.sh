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
