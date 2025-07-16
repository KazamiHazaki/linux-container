FROM ubuntu:24.04

ARG SSH_USER
ARG SSH_PASSWORD

RUN apt update && \
    apt install -y openssh-server sudo && \
    useradd -m -s /bin/bash $SSH_USER && \
    echo "$SSH_USER:$SSH_PASSWORD" | chpasswd && \
    usermod -aG sudo $SSH_USER && \
    mkdir /var/run/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
