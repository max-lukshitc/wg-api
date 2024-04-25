#!/bin/bash

# Copy service unit file to /etc/systemd/system
cp /app/wg-api/scripts/bash/sim_check_wgapi.service /etc/systemd/system
sudo chmod 644 /etc/systemd/system/sim_check_wgapi.service

# Reload systemd to read the new unit file
sudo systemctl daemon-reload

# Start and enable the service
sudo systemctl start sim_check_wgapi.service
sudo systemctl enable sim_check_wgapi.service

echo "Service sim_check_wgapi.service has been set up successfully."

