#!/bin/bash


CWD=`dirname $0`
PARENT_DIR=`dirname ${CWD}`

#rsync ./opt/monitor to /opt/monitor
INSTALL_APPLIANCE ()
{
	rsync -av --exclude "installation" ${PARENT_DIR}/opt/ /opt/
}

# create softlinks
MAKE_SOFT_LINKS()
{
	mkdir -p /var/www/safesquid/
	ln -s /opt/monitor/var/www/safesquid/monitor /var/www/safesquid/monitor 

	ln -s /opt/monitor/lib/systemd/system/safesquid-monitor.service  /lib/systemd/system/safesquid-monitor.service
	ln -s /lib/systemd/system/safesquid-monitor.service /etc/systemd/system/safesquid-monitor.service
	
	ln -s /opt/monitor/usr/local/bin/websocketd /usr/local/bin/websocketd
	
}


INSTALL_APPLIANCE

exit





#softlink all files relatively to the host file system
