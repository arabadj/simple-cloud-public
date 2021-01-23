#!/bin/bash

/usr/sbin/rsyslogd -n &
/usr/sbin/httpd -D FOREGROUND
