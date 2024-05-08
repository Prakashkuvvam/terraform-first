#!/bin/bash
sudo apt update
sudo apt install openjdk-11-jre-headless -y
sudo apt install ca-certificates -y
sudo apt install maven git wget unzip -y
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list >/dev/null
sudo apt-get update
sudo apt-get install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo apt install openjdk-11-jre-headless

sleep 20

sudo apt update
sudo apt install -y docker.io
sudo chmod 666 /var/run/docker.sock
