FROM centos:latest

RUN yum -y update; yum clean all && yum -y install openssh openssh-server && \
    mkdir /var/run/sshd && \
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''  && \
    echo 'root:admin8855' | chpasswd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
