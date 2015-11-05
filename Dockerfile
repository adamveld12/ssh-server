FROM alpine:3.2

MAINTAINER Adam Veldhousen <adam@veldhousen.ninja> @adamveld12

COPY ./keys/id_rsa.pub /root/.ssh/authorized_keys 
COPY ./sshd_config /etc/ssh/sshd_config
COPY ./motd /etc/motd

RUN apk update \
   && apk add openssh \
   && rm -rf /var/cache/apk/* \
   && rc-update add sshd \
   && /usr/bin/ssh-keygen -A

EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
