# (Re)starting services
# snmpd hangs after stop, it needs to be killed manually
ifconfig eth0 192.168.122.3
/etc/init.d/rsyslog start >/dev/null 2>/dev/null
/etc/init.d/nginx start >/dev/null 2>/dev/null
/etc/init.d/vsftpd start >/dev/null 2>/dev/null
touch /var/log/dhcp.leases
/etc/init.d/isc-dhcp-server start >/dev/null 2>/dev/null
/etc/init.d/tftpd-hpa start >/dev/null 2>/dev/null
SNMPD_PID=`cat /run/snmpd.pid`
/etc/init.d/snmpd stop >/dev/null 2>/dev/null
kill $SNMPD_PID
/etc/init.d/snmpd start >/dev/null 2>/dev/null
/etc/init.d/snmptrapd start >/dev/null 2>/dev/null

clear
route add default gw 192.168.122.1 eth0

# Launching shell
cd
exec bash -i
