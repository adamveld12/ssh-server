#!/bin/bash
IFS='\n\t'
set -euo pipefail

if [[ -f "./keys/id_rsa"  && -f "./keys/id_rsa.pub" ]]; then
  echo "Using existing keypair..."
else
  echo -n "Your ssh password (leave blank for no password) [ENTER]:"
  read -e sshpass
  echo -e "Generating key pair for SSH in ./keys..."
  rm -rf ./keys
  mkdir -p ./keys
  ssh-keygen -b 4096 -N "${sshpass}" -f ./keys/id_rsa -C "SSH Server Root"
fi

docker build -t ssh-server .

if [[ -f $(which docker-machine) ]]; then
  IP=$(docker-machine ip default)
else
  IP=127.0.0.1
fi

echo "adamveld12/ssh-server completed."
echo "to ssh into your new server run:"
echo "docker run -d -p 2222:22 ssh-server"
echo "ssh root@${IP} -p 2222 -i ./keys/id_rsa"
