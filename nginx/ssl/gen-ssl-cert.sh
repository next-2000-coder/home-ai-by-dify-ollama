#!/bin/bash

IP=$1 && \
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout server.key -out server.crt -subj "/C=CN/ST=State/L=Locality/O=Organization/CN=CommonName" -addext "subjectAltName = IP:$IP"

