#! /bin/bash
sudo apt update && apt upgrade -y #update repositories
sudo apt install screen -y #install screen
sudo cd /usr/local/src/ #install noip2
sudo wget http://www.noip.com/client/linux/noip-duc-linux.tar.gz
sudo tar xf noip-duc-linux.tar.gz
sudo cd noip-2.1.9-1/
sudo make install
sudo /usr/local/bin/noip2
sudo wget https://raw.githubusercontent.com/R1NLER/linuxcommands/main/noip2 
sudo mv noip2 /etc/init.d/
sudo chmod a+x /etc/init.d/noip2
sudo update-rc.d noip2 defaults
sudo rm -r /usr/local/src/noip-duc-linux.tar.gz
cd #update sudo
sudo wget https://www.sudo.ws/dist/sudo-1.9.9.tar.gz
sudo tar xzvf sudo-1.9.9.tar.gz
sudo cd sudo-1.9.9
sudo ./configure				#sudo apt-get install build-essential (si da error)
sudo make && sudo make install
bash -c "sudo --version"
sudo apt update && sudo apt install docker.io docker-compose -y #installing docker & docker-compose
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
#install openmediavault
wget -O - https://raw.githubusercontent.com/OpenMediaVault-Plugin-Developers/installScript/master/install | sudo bash
