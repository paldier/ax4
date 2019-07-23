#!/bin/sh

message="[OpenVPN, connection successfully] from remote IP address: ${trusted_ip}"

logger -p local5.info -t "t OpenVPN" ${message}

