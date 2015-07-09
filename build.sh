#!/bin/bash
IFS='\n\t'
set -euo pipefail

if [[ -f "./keys/id_rsa" && -f "./keys/id_rsa.pub" ]]; then
  echo "Using existing keypair at ./keys"
else
  echo -n "Your new SSH key's password (blank for none) [ENTER]: "
  read -es sshpass
  echo

  rm -rf ./keys
  mkdir ./keys
  ssh-keygen -b 4096 -N "$sshpass" -f "./keys/id_rsa" -C "Root Ssh Access Key"  &> /dev/null
fi

docker build -t adamveld12/ssh-server .

if [[ -f $(which boot2docker) ]]; then
  IP=$(boot2docker ip)
else
  IP="127.0.0.1"
fi

echo "ssh root@${IP} -i ./keys/id_rsa -p 2222"
