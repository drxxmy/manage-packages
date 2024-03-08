#!/bin/bash

# Install yay (if not installed)
if [ -n "pacman -Qs yay" ]; then
    echo "info: yay is already installed -- skipping"
else
    sudo pacman -S --needed --noconfirm git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
fi


# Install packages from pacman
sudo pacman -S --needed --noconfirm - < ./pkglist.txt

# Install AUR packages
yay -S --needed --noconfirm - < ./pkglist_aur.txt


# Ask to remove a cloned folder
if [ -d "yay" ]; then
    read -p "question: remove cloned yay folder? (y/n) " yn
    case $yn in
        [yY] ) exec rm -rf ./yay;
            exit;;
        [nN] ) echo "info: skip yay folder removal";
            exit;;
        * ) exit;;
    esac
fi

echo "done: script finished working"
