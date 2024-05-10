#!/usr/bin/fish

# You must already have fish installed in order to run this script

# All required packages
echo "Installing packages using pacman"
sudo pacman -S fisher\
  alacritty\
  neovim\
  hyprland hyprpaper waybar

# fish config
echo "Installing plugins with fisher"
fisher install $(cat ./.config/fish/fish_plugins)
