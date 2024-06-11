#!/usr/bin/fish

# You must already have fish installed in order to run this script

# All required packages
echo "Installing packages using pacman"
sudo pacman -S fisher alacritty neovim hyprland hyprpaper waybar bat zoxide starship

# fish config
echo "Installing plugins with fisher"
fisher install $(cat ./.config/fish/fish_plugins)

echo "Configuring fish variables"
set -Ux EDITOR nvim
echo "Enter obsidian path :"
read obsidian
set -Ux OBSIDIAN_PATH $obsidian

echo "To set a wallpaper in hyprland, put it in ~/documents/wallpaper/"
