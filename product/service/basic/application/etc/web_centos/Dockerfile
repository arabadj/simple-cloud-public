FROM centos:7.8.2003

RUN rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7 && \
    yum --setopt=tsflags=nodocs update -y && \
    yum install telnet -y && \
    yum --setopt=tsflags=nodocs install httpd -y

# EXPOSE 80

CMD /usr/sbin/httpd -D FOREGROUND
