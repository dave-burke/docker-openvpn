#!/bin/bash

if [ -z "$1" ]; then
	echo "No client name" 
	exit 1
fi

docker run --volumes-from ovpn-data --rm -it openvpn easyrsa build-client-full $1 nopass
