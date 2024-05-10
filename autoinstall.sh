#!bin/bash

# All required packages
sudo pacman -S fish fisher\
  alacritty\
  nvim\
  hyprland hyprpaper waybar

# fish config
fisher install $(cat ./.config/fish/fish_plugins)
