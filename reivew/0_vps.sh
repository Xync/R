#!/usr/bin/env bash

sudo iptables -A INPUT -p tcp --dport 3333 -j ACCEPT
