sudo nano /etc/systemd/system/docker-wireguard-pihole.service
#content
[Unit]
Description=Docker Compose Wireguard / Pi-Hole Service
Requires=docker.service
After=docker.service
[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=/opt/docker/wireguard-pihole/
ExecStart=/usr/bin/docker-compose up -d
ExecStop=/usr/bin/docker-compose down
TimeoutStartSec=0
[Install]
WantedBy=multi-user.target
#end of content
sudo chmod 640 /etc/systemd/system/docker-wireguard-pihole.service
sudo systemctl daemon-reload
sudo systemctl enable docker-wireguard-pihole.service
