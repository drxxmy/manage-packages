#!/bin/bash

if [ -f pkglist.txt ]; then
    mv pkglist.txt pkglist_bak.txt
    pacman -Qqen > pkglist.txt
else
    pacman -Qqen > pkglist.txt
fi


if [ -f pkglist_aur.txt ]; then
    mv pkglist_aur.txt pkglist_aur_bak.txt
    pacman -Qqem > pkglist_aur.txt
else
    pacman -Qqem > pkglist_aur.txt
fi
