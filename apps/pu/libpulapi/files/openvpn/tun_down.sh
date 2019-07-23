#!/bin/sh

message="[OpenVPN, connection drop] from remote IP address: ${ifconfig_pool_remote_ip}"

logger -p local5.info -t "t OpenVPN" ${message}

