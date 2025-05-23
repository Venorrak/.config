#!/bin/bash

#configure fonts
# fc-query -f '%{family[0]}\n' /home/venorrak/.local/share/fonts/otf/HurmitNerdFont/HurmitNerdFont-Regular.otf
# fc-query -f '%{family[0]}\n' /home/venorrak/.local/share/fonts/otf/0xProto/0xProtoNerdFont-Regular.ttf

### WIFI ###
ip link set wlan0 up
pacman -Sy iw iwmenu-git impala
systemctl enable iwd

### GENERAL ###
pacman -Sy waybar \
 dunst \
 hyprlock \
 xdg-desktop-portal-hyprland \
 hyprpolkitagent \
 pavucontrol \
 flatpak \
 neofetch \
 alacritty \
 hyprpaper \
 curl \
 htop \
 cat \
 sudo \
 less \
 gzip \
 grep \
 tmux

### BRAVE ###
pacman -Sy --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
yay -Sy brave-bin
#sync settings and change font

#VSCODE
yay visual-studio-code-bin

### ZSH ###
pacman -Sy zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### SCREENSHOT ###
sh -c "curl https://raw.githubusercontent.com/hyprwm/contrib/refs/heads/main/grimblast/grimblast > /bin/grimblast"
chmod +x /bin/grimblast
pacman -S cliphist

### FLATPACKS ###
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.spotify.Client

### NVIDIA ###
pacman -Sy nvidia-dkms \
 nvidia-open-dkms \
 linux-zen-headers \
 linux-lts-headers \
 nvidia-utils \
 egl-wayland

#/etc/modprobe.d/nvidia.conf
#options nvidia_drm modeset=1

#/etc/mkinitcpio.conf
#MODULES=(... nvidia nvidia_modeset nvidia_uvm nvidia_drm ...)
# sudo mkinitcpio -P

### BLUETOOTH ###
systemctl start bluetooth.service
systemctl enable bluetooth.service
pacman -Sy bluez \
 bluez-utils \
 bluetuith