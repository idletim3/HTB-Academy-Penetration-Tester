#!/bin/bash


read -p "Subdomains file path: " SUBDOMAINS
read -p "URL: " URL
read -p "Port: " PORT
read -p "Recursion depth: " DEPTH


while IFS= read -r line; do

    ffuf -w "/usr/share/seclists/Discovery/Web-Content/directory-list-2.3-small.txt":FUZZ -u "http://$line.$URL:$PORT/FUZZ" -e ".php,.phps,.php7" -fl 1  -fc 403 -recursion -recursion-depth $DEPTH -t 64 -v -c

done < "$SUBDOMAINS"
