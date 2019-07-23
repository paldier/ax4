#!/bin/bash
# usage: remoteloginlog.sh <success/fail> <https/ftp> <ip>
if [ "$1" = "success" ] ; then
	if [ "$2" = "ftp" ] ; then
		logger -p local5.info -t "t LAN access from remote" [USB remote access] from $3 through FTP,
	else
		logger -p local5.info -t "t LAN access from remote" [USB remote access] from $3 through HTTPS,
	fi
else
	if [ "$2" = "ftp" ] ; then
		logger -p local5.info -t "t LAN access from remote" [USB remote access rejected] from $3 through FTP,
	else
		logger -p local5.info -t "t LAN access from remote" [USB remote access rejected] from $3 through HTTPS,
	fi
fi
