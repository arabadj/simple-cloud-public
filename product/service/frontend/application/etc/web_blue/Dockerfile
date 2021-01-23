FROM centos:7.8.2003

RUN rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7 && \
    yum --setopt=tsflags=nodocs update -y && \
    yum install telnet -y && \
    yum install rsyslog rsyslog-doc rsyslog-relp -y && \
    yum --setopt=tsflags=nodocs install httpd -y

COPY rsyslog.conf /etc/rsyslog.conf
COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY starter.sh starter.sh

# CMD /usr/sbin/httpd -D FOREGROUND
# CMD /usr/sbin/rsyslogd -n
CMD /usr/bin/sh ./starter.sh
