#!/usr/bin/env bash

#sudo systemctl edit --full --force autossh-nyc.service

USER=toast
VPC=bread

echo <<- 'EOF'
	[Unit]
	Description=AutoSSH tunnel for remote access on local port 2222
	After=network.target
	
	[Service]
	User=kali
	Group=kali
	Restart=always
	RestartSec=3
	# Environment="AUTOSSH_GATETIME=0"
	ExecStart=/usr/bin/autossh -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -NR :2222:localhost:22 ${USER}@${VPC}
	
	[Install]
	WantedBy=multi-user.target
EOF
