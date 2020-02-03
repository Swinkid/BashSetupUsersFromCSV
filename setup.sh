#!/bin/bash

# Author: Alex Noble 2018
# GitHub: https://github.com/swinkid
# Bash / Shell Script to batch create users from a CSV.

OLDIFS=$IFS
IFS=","

# Read CSV
# CSV Format: Last Name, First Name, User ID, Password

cat users.csv | while read lastname firstname userid password;
do
        echo "Adding: ${firstname} ${lastname} ${userid} ${password}"
        useradd -m -p "$(echo -n ${password} | openssl passwd -crypt -stdin)" -c "${firstname} ${lastname}" -g users -s /bin/bash "${userid}"
        
        # Force User to change password on Login
        passwd -e "${password}"
done
