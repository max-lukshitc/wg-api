#!/bin/bash

# Define the service name
SERVICE_NAME="wgapi.service"

# Loop indefinitely
while true; do
    # Check if the service is active
    if systemctl is-active --quiet $SERVICE_NAME; then
        echo "Service $SERVICE_NAME is active."
    else
        echo "Service $SERVICE_NAME is inactive. Restarting..."
        sleep 50
        sudo bash /app/wg-api/scripts/bash/restart.sh
    fi

    # Check if wg0 interface exists
    if ip a | grep -q "wg0"; then
        echo "Interface wg0 exists."
    else
        echo "Interface wg0 does not exist. Restarting $SERVICE_NAME..."
	sleep 50
        sudo bash /app/wg-api/scripts/bash/restart.sh
    fi

    # Sleep for 2 minutes before checking again
    sleep 120
done

