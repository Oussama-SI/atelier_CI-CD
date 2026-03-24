#!/bin/bash
set -e

sudo yum update -y

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/rpm-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/rpm-stable/jenkins.io-2026.key # or 2023

sudo yum upgrade -y
echo "--------------------Installing Java--------------------"
# Add the Corretto RPM repo
sudo rpm --import https://yum.corretto.aws/corretto.key
sudo curl -Lo /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo

# Install Java 21
sudo yum install -y java-21-amazon-corretto-devel

# Verify
java -version
echo "--------------------Installing Jenkins--------------------"
sudo yum install -y fontconfig dejavu-sans-fonts

sudo yum install jenkins -y
sudo systemctl enable jenkins && sudo systemctl start jenkins

echo "--------------------Installing Docker--------------------"
sudo yum install -y docker
sudo systemctl enable docker && sudo systemctl start docker

# Allow jenkins user to run docker without sudo
sudo usermod -aG docker jenkins
sudo usermod -aG docker ec2-user

# Restart Jenkins to pick up the docker group
sudo systemctl restart jenkins

echo "--------------------Installing AWS CLI--------------------"
sudo yum install -y unzip curl
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version

echo "--------------------Jenkins Initial Password--------------------"
sleep 30
sudo cat /var/lib/jenkins/secrets/initialAdminPassword