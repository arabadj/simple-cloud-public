FROM centos:7.8.2003

RUN rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7 && \
    yum --setopt=tsflags=nodocs update -y && \
    yum install net-tools -y && \
    yum install telnet -y && \
	yum install rsyslog rsyslog-doc rsyslog-relp -y

COPY rsyslog.conf /etc/rsyslog.conf

ENTRYPOINT ["rsyslogd", "-n"]
