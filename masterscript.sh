#! /bin/bash
apt update && apt upgrade -y
cd /usr/local/src/
wget http://www.noip.com/client/linux/noip-duc-linux.tar.gz
tar xf noip-duc-linux.tar.gz
cd noip-2.1.9-1/
make install
/usr/local/bin/noip2
wget https://raw.githubusercontent.com/R1NLER/linuxcommands/main/noip2 /etc/init.d/
chmod a+x /etc/init.d/noip2
update-rc.d noip2 defaults
cd
wget https://www.sudo.ws/dist/sudo-1.9.9.tar.gz
tar xzvf sudo-1.9.9.tar.gz
cd sudo-1.9.9
./configure				#sudo apt-get install build-essential (si da error)
sudo make && sudo make install
bash -c "sudo --version"
sudo apt update && sudo apt install docker.io docker-compose -y
sudo systemctl daemon-reload
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo systemctl status docker.service
sudo mkdir -p /opt/docker/wireguard-pihole
cd /opt/docker/wireguard-pihole
wget https://raw.githubusercontent.com/R1NLER/linuxcommands/main/docker-compose.yml
nano docker-compose.yml
sudo sed -i "s/127.0.0.1 localhost/127.0.0.1 localhost $(hostname)/g" /etc/hosts
sudo systemctl disable systemd-resolved
sudo systemctl stop systemd-resolved
sudo sed -i '/nameserver 127.0.0.53/a nameserver 8.8.8.8' /etc/resolv.conf
sudo sed -i '/nameserver 127.0.0.53/a nameserver 8.8.4.4' /etc/resolv.conf
