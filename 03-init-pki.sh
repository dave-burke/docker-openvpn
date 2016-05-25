#!/bin/bash

docker run --volumes-from ovpn-data --rm -it openvpn ovpn_initpki
