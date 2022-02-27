sudo wget https://raw.githubusercontent.com/R1NLER/linuxcommands/main/docker-wireguard-pihole.service /etc/systemd/system/
sudo chmod 640 /etc/systemd/system/docker-wireguard-pihole.service
sudo systemctl daemon-reload
sudo systemctl enable docker-wireguard-pihole.service
