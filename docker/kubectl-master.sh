#!/bin/bash

sudo apt update && sudo apt install

curl -fsSL https://get.docker.com -o install-docker.sh
sh install-docker.sh

sudo usermod -aG docker ubuntu
