#!/bin/bash

declare -A users

register_user() {
    read -p "Enter username: " username
    read -s -p "Enter password: " password
    echo
    users["$username"]=$password
    echo "User registered successfully."
}
authenticate_user() {
    read -p "Enter username: " username
    read -s -p "Enter password: " password
    echo
    stored_password=${users["$username"]}
    if [ "$password" == "$stored_password" ]; then
        echo "BIM! successful connection."
        return 0
    else
        echo "Try again. Incorrect username or password."
        return 1
    fi
}

# Main loop
while true; do
    echo "1. Register"
    echo "2. Authenticate"
    echo "3. Quit"
    read -p "Choose an option: " choice

    case $choice in
        1) register_user ;;
        2) authenticate_user && echo "Starting chat..." && break ;;
        3) echo "byeee!" && exit ;;
        *) echo "Invalid option. Please choose again." ;;
    esac
done

# TCP Server
while true; do
    echo "Waiting for connections..."
    { echo "Chat room is open. Type 'exit' to quit."; cat; } | nc -l -p 12345
done
