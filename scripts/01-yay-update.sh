#!/bin/bash
set -Eeuo pipefail
trap "echo -e \"\033[1;31m[!] \e[0mScript error occured in $0.\"" ERR

BLUE="\033[1;34m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
ENDCOLOR="\e[0m"

# Run yay if it is installed.
if command -v yay &> /dev/null
then
    echo -ne $BLUE"[i] "$ENDCOLOR; echo "Updating Archlinux packages"
    yay -Syu
elif [ command -v pacman &> /dev/null ] && [ ! command -v yay ]
then
    echo -ne $YELLOW"[w] "$ENDCOLOR; echo "Updating Archlinux packages (pacman; yay not installed)"
elif command -v pacman &> /dev/null
then 
    echo -ne $BLUE"[i] "$ENDCOLOR; echo "Removing Orphan packages"
    sudo pacman -Rns $(pacman -Qtdq)
    echo -ne $BLUE"[i] "$ENDCOLOR; echo "Optimizing pacman database"
    sudo pacman-optimize
else
    echo -ne $RED"[!] "$ENDCOLOR; echo "Neither yay nor pacman are installed"
fi