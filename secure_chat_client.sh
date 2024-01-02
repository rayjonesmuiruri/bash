#!/bin/bash

# TCP Client
while true; do
    read -p "Enter server address: " server_address
    nc "$server_address" 12345
    echo "Disconnected from the chat room. Exiting."
    break
done
