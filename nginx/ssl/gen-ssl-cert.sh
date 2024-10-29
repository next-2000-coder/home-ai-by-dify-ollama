#!/bin/bash

IP=$1 && \
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout private.key -out certificate.crt -subj "/C=CN/ST=State/L=Locality/O=Organization/CN=CommonName" -addext "subjectAltName = IP:$IP"
