#!/bin/bash
ssh root@$(docker-machine ip default) -p 2222 -i ./keys/id_rsa
