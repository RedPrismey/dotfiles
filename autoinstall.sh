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

echo "Configuring fish prompt"
tide configure --auto --style=Rainbow --prompt_colors='True color' --show_time=No --rainbow_prompt_separators=Round --powerline_prompt_heads=Round --powerline_prompt_tails=Flat --powerline_prompt_style='Two lines, character and frame' --prompt_connection=Solid --powerline_right_prompt_frame=No --prompt_connection_andor_frame_color=Dark --prompt_spacing=Sparse --icons='Many icons' --transient=No
