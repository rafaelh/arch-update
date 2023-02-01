#!/bin/bash

# A template script to run a series of other scripts, for modularity. This will run any file ending
# in .sh in the /scripts directory.

if [ -d "./scripts" ] # Check the /scripts directory exists
then
    number_of_scripts_to_run=$(ls -l scripts/*.sh 2>/dev/null | wc -l)
    if [ $number_of_scripts_to_run != 0 ] # Check that there are '.sh' scripts to run
    then
        for script in scripts/*.sh; do
            if [[ -x "$script" ]] # Check each script is executable, then run it
            then
                bash "$script"
            else
                echo -e "\033[1;31m[!] \e[0mError: File '$script' is not executable"
            fi
        done
    else
        echo -e "\033[1;31m[!] \e[0mError: No scripts ending in '.sh' to run in './scripts'"
    fi
else
    echo -e "\033[1;31m[!] \e[0mError: Directory './scripts' does not exist"
fi