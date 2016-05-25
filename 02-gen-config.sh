#!/bin/bash

docker run --volumes-from ovpn-data --rm openvpn ovpn_genconfig -u udp://bservy.duckdns.org
