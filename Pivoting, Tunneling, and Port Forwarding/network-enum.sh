#!/bin/bash

read -p "Enter the path to the hosts file: " hostsFile

while read line; do
    proxychains nmap -p- -Pn -sC -sV -A --min-rate 2500 "$line" -oN "nmap_$line"
done < "$hostsFile"
