# Networkers' Toolbox

FROM ubuntu:focal

RUN DEBIAN_FRONTEND=noninteractive ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y --no-install-recommends \
    install telnet curl openssh-client nano vim-tiny iputils-ping build-essential \
    net-tools nginx vsftpd isc-dhcp-server tftpd-hpa snmpd snmptrapd rsyslog \
    python3 python3-pip \
    && dpkg-reconfigure --frontend noninteractive tzdata \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

ADD dhcp/dhcpd.conf         /etc/dhcp/dhcpd.conf
ADD dhcp/isc-dhcp-server    /etc/default/isc-dhcp-server
ADD ftp/vsftpd.conf         /etc/vsftpd.conf
ADD ftp/pam_d-vsftpd        /etc/pam.d/vsftpd
ADD syslog/rsyslog.conf     /etc/rsyslog.conf
ADD tftp/tftpd-hpa          /etc/default/tftpd-hpa
ADD snmp/snmptrapd          /etc/default/snmptrapd
ADD snmp/snmpd.conf         /etc/snmp/snmpd.conf
ADD snmp/snmptrapd.conf     /etc/snmp/snmptrapd.conf
ADD index.html              /var/www/html/index.html
ADD gns3.png                /var/www/html/gns3.png
ADD starter.sh              /sbin/starter.sh

RUN DEBIAN_FRONTEND=noninteractive chmod 755 /sbin/starter.sh; mkdir /tftpboot; chmod 777 /tftpboot; echo root:gns3 | chpasswd; chmod 644 /var/www/html/*

VOLUME [ "/root", "/tftpboot", "/var/log", "/var/www", "/etc" ]
CMD [ "sh", "-c", "/sbin/starter.sh" ]
