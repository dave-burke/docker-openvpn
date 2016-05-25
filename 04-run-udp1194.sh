#!/bin/bash

name="ovpn-udp1194"
cid="$(docker ps -q --filter "name=${name}")"
if [ -n "${cid}" ]; then
	echo "Stopping container..."
	docker stop "${name}" > /dev/null
fi
cid="$(docker ps -a -q --filter "name=${name}")"
if [ -n "${cid}" ]; then
	echo "Removing container..."
	docker rm "${name}" > /dev/null
fi

echo "Running container..."
#docker run --volumes-from ovpn-data --rm --publish 1194:1194/udp --cap-add=NET_ADMIN --name "${name}" openvpn
docker run --volumes-from ovpn-data --restart=always --detach --publish 1194:1194/udp --cap-add=NET_ADMIN --name "${name}" openvpn

