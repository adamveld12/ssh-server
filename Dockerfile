FROM adamveld12/base

MAINTAINER Adam Veldhousen <adam@veldhousen.ninja>

USER root

RUN locale-gen en_US.UTF-8 
ENV LANG en_US.UTF-8 
ENV LANGUAGE en_US:en 
ENV LC_ALL en_US.UTF-8 

COPY ./sshd_config /etc/ssh/sshd_config
COPY ./keys/id_rsa.pub /root/.ssh/authorized_keys
COPY ./keys/id_rsa.pub /home/dev/.ssh/authorized_keys

RUN mkdir -p /var/run/sshd && apt-get update && apt-get install -y openssh-server
RUN usermod -a -G sudo dev && chown -R dev /home/dev/.ssh/

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D"]

