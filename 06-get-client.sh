#!/bin/bash

if [ -z "$1" ]; then
	echo "No client name" 
	exit 1
fi

docker run --volumes-from ovpn-data --rm openvpn ovpn_getclient $1 > $1.ovpn
