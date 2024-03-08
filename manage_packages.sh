#!/bin/bash

TITLE="Manage Packages"

items=(1 "Install packages"
       2 "Backup packages")

while choice=$(dialog --title "$TITLE" \
                 --menu "Please select" 10 40 3 "${items[@]}" \
                 2>&1 >/dev/tty)
    do
    case $choice in
        1) exec ./install_packages.sh; break;;
        2) exec ./backup_installed_packages.sh; break;;
        *) ;; # some action on other
    esac
done
