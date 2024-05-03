#!/bin/bash


read -p "Subdomains file path: " SUBDOMAINS
read -p "URL: " URL
read -p "Port: " PORT


while IFS= read -r line; do
    ffuf -w /usr/share/seclists/Discovery/Web-Content/web-extensions.txt:FUZZ -u "http://$line.$URL:$PORT/indexFUZZ" -v -c
done < "$SUBDOMAINS"
