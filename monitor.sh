#!/bin/bash

URL="http://127.0.0.1:5000/health"

response=$(curl -s -o /dev/null -w "%{http_code}" $URL)

if [ "$response" != "200" ]; then
    echo "Application is unhealthy. Restarting container..."
    sudo docker restart monitoring-app-container
else
    echo "Application is healthy."
fi
