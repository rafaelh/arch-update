#!/bin/bash
set -Eeuo pipefail
trap "echo -e \"\033[1;31m[!] \e[0mScript error occured in $0.\"" ERR

BLUE="\033[1;34m"
RED="\033[1;31m"
ENDCOLOR="\e[0m"

# Run Firmware Update Manager if it is installed.
if command -v fwupdmgr &> /dev/null
then
    echo -ne $BLUE"[i] "$ENDCOLOR; echo "Updating Firmware"
    sudo fwupdmgr refresh && sudo fwupdmgr update
else
    echo -ne $RED"[!] "$ENDCOLOR; echo "fwupdmgr not installed"
fi
