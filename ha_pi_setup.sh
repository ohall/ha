# HA Pi setup

# Update password
passwd

# Install depenndencies
sudo apt update
sudo apt install -y python3 python3-pip libffi-dev git

# Install docker
curl -fsSL https://get.docker.com -o get-docker.sh
export LC_CTYPE=en_US.UTF-8 && export LC_ALL=en_US.UTF-8 && sudo sh get-docker.sh
sudo groupadd docker
sudo usermod -aG docker pi
sudo chmod 666 /var/run/docker.sock
sudo pip3 install docker-compose

# Pull docker-compose setup and run
scp -r .ssh pi@raspberrypi.local:/home/pi/
git clone git@github.com:ohall/ha.git
cd ha
git pull && docker-compose up -d
