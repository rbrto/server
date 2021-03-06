#!/bin/sh
set -e

sudo yum remove -y docker docker-common container-selinux docker-selinux docker-engine docker-ce

sudo yum install -y yum-utils device-mapper-persistent-data lvm2

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo yum makecache fast

sudo yum install -y docker-ce git

sudo sh -c 'curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` > /usr/bin/docker-compose'

sudo sh -c 'chmod +x /usr/bin/docker-compose'

sudo usermod -aG docker $(whoami)

sudo systemctl start docker

sudo systemctl enable docker
