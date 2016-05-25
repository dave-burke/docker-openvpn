#!/bin/bash

docker build --rm=true -t openvpn $@ $(dirname $0)
