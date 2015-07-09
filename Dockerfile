FROM adamveld12/base

MAINTAINER Adam Veldhousen <adam@veldhousen.ninja>


USER root
COPY ./sshd_config /etc/ssh/sshd_config
COPY ./keys/id_rsa.pub /root/.ssh/authorized_keys
COPY ./keys/id_rsa.pub /home/dev/.ssh/authorized_keys

RUN mkdir -p /var/run/sshd && dpkg-reconfigure openssh-server


EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
