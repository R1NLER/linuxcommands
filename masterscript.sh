#! /bin/bash
apt update && apt upgrade -y       #update repositories
cd /usr/local/src/                 #install noip2
wget http://www.noip.com/client/linux/noip-duc-linux.tar.gz
tar xf noip-duc-linux.tar.gz
cd noip-2.1.9-1/
make install
/usr/local/bin/noip2
sudo wget https://raw.githubusercontent.com/R1NLER/linuxcommands/main/noip2 
sudo mv noip2 /etc/init.d/
sudo chmod a+x /etc/init.d/noip2
sudo update-rc.d noip2 defaults
sudo rm -r /usr/local/src/noip-duc-linux.tar.gz
cd /home/pi/                        #update sudo
wget https://www.sudo.ws/dist/sudo-1.9.9.tar.gz
tar xzvf sudo-1.9.9.tar.gz
cd sudo-1.9.9
./configure				                 #sudo apt-get install build-essential (si da error)
sudo make && sudo make install
bash -c "sudo --version"
sudo apt update && sudo apt install docker.io docker-compose -y #installing docker & docker-compose
sudo systemctl daemon-reload
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo systemctl status docker.service
#install openmediavault
wget -O - https://raw.githubusercontent.com/OpenMediaVault-Plugin-Developers/installScript/master/install | sudo bash
