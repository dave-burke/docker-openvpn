#!/bin/bash

name="ovpn-tcp443"
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
#docker run --volumes-from ovpn-data --rm --publish 443:1194/tcp --cap-add=NET_ADMIN --name "${name}" openvpn ovpn_run --proto tcp
docker run --volumes-from ovpn-data --detach --restart=always --publish 443:1194/tcp --cap-add=NET_ADMIN --name "${name}" openvpn ovpn_run --proto tcp

