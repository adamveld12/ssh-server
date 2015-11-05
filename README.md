# SSH Server

This is an ssh server that is hosted inside of a docker container based on Alpine Linux. I've taken measures to harden this ssh server by following some tips from [here](http://www.cyberciti.biz/tips/linux-unix-bsd-openssh-server-best-practices.html).

The image on docker hub under `adamveld12/ssh-server` uses the [Vagrant insecure keypair](https://github.com/mitchellh/vagrant/tree/master/keys). Maybe this would be useful to you  if you want to use an image for a local dev environment or some for testing.


## How to use

1. `build.sh` to generate a root ssh key and build an image tagged `ssh-server`. 
2. Spin up the container with `docker run -d -p 2222:22 ssh-server`.
3. `connect.sh` or `ssh root@${docker-machine ip default} -p 2222 -i ./keys/id_rsa` to connect to your container.

You can replace the `id_rsa.pub` in `./keys` to whatever public key you want. `build.sh` will prompt to overwrite `./keys` if they already exist, so you don't have to worry about overwriting it accidentally.


## LICENSE

MIT
