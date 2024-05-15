#!/bin/bash

# Download unit file into /etc/systemd/system (units created by the administrator)
wget -O /etc/systemd/system/unifi-dawn.service https://raw.githubusercontent.com/fdcastel/unifi-dawn/master/unifi-dawn.service

# Reload all unit files
systemctl daemon-reload

# Create service link (install service)
systemctl enable unifi-dawn.service

# Start the service
systemctl start unifi-dawn.service
