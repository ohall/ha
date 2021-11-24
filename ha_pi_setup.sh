#HA Pi setup
# passwd
sudo apt update
sudo apt install git

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo usermod -aG docker pi
sudo chmod 666 /var/run/docker.sock

sudo apt update
sudo apt install -y python3 python3-pip libffi-dev
sudo pip3 install docker-compose

git clone git@github.com:ohall/ha.git

cd ha

sudo cp home-assistant.service /etc/systemd/system/home-assistant.service

systemctl enable home-assistant.service
systemctl enable docker

