#Docker SSH Server

This is an ssh server that is hosted inside of a docker container. I've taken measures to harden this ssh server by following some tips from [here](http://www.cyberciti.biz/tips/linux-unix-bsd-openssh-server-best-practices.html).

I don't host a built image on docker hub since the public key would have to be made publically available and that would allow anyone to ssh into a container derived from that image. Please build your own, I've taken some steps to make it super easy for you. The `build.sh` script uses 4096 bit RSA and you can opt in to setting a password as well.

## How To Use

1. `./build.sh`
2. `./run.sh`
3. `ssh root@localhost -i ./keys/id_rsa.pub -p 2222`

*NOTE*: Change `localhost` to `$(boot2docker ip)` where appropriate.

## LICENSE

MIT
