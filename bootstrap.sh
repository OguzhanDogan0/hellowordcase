#!/bin/bash

# Enable ssh password authentication
echo "Enable ssh password authentication"
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/.*PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
systemctl reload sshd

# Set Root password
echo "Set root password"
echo -e "admin\nadmin" | passwd root >/dev/null 2>&1

# This is the Debian package repository of Jenkins to automate installation and upgrade. 
# To use this repository, first add the key to your system:
echo "Add Debian package"
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Then add a Jenkins apt repository entry:
echo "add a Jenkins apt repository entry"

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update -qq >/dev/null 2>&1
# install java
echo "install openjdk-11-jre"
sudo apt-get install -qq -y fontconfig openjdk-11-jre >/dev/null 2>&1

# install Jenkins
echo "install Jenkins"
sudo apt-get install -qq -y jenkins  >/dev/null 2>&1

# docker install
echo "install docker"
sudo apt-get update -qq >/dev/null 2>&1
sudo apt install -qq -y docker.io >/dev/null 2>&1

# start docker 
echo "start docker"
sudo systemctl enable --now docker

#install nodejs and npm
echo "install nodejs and npm"
sudo apt install -qq -y nodejs >/dev/null 2>&1
sudo apt install -qq -y npm >/dev/null 2>&1
