FROM ubuntu:24.04

RUN apt update && \
    apt install -y openssh-server sudo && \
    useradd -m -s /bin/bash devops && \
    echo "devops:devops123" | chpasswd && \
    usermod -aG sudo devops && \
    mkdir /var/run/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
