#!/bin/sh

message="[OpenVPN, connection successfully] from remote IP address: ${ifconfig_pool_remote_ip}"

logger -p local5.info -t "t OpenVPN" ${message}

