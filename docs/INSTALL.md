# WehttamSnaps - Installation Guide

Complete step-by-step installation guide for the J.A.R.V.I.S. themed Arch Linux Niri setup.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Fresh Arch Linux Installation](#fresh-arch-linux-installation)
3. [Post-Installation Setup](#post-installation-setup)
4. [Installing WehttamSnaps Dotfiles](#installing-wehttamsnaps-dotfiles)
5. [Audio System Setup](#audio-system-setup)
6. [Gaming Configuration](#gaming-configuration)
7. [WebApps Setup](#webapps-setup)
8. [Troubleshooting](#troubleshooting)

---

## Prerequisites

### Hardware Requirements
- **CPU**: Intel Core i5/i7 or AMD Ryzen (tested on i7-4790)
- **GPU**: AMD RX 580 (8GB) or equivalent
- **RAM**: 16GB minimum
- **Storage**: SSD recommended (3 SSD support: 1TB + 2x120GB)
- **Monitor**: 1920x1080 @ 60Hz (DP-3 output)

### Software Requirements
- Arch Linux fresh installation
- Internet connection
- At least 50GB free space on SSD

### Skills Required
- Basic Linux command line knowledge
- Ability to follow instructions precisely
- Willingness to learn and troubleshoot

---

## Fresh Arch Linux Installation

### 1. Create Bootable USB

Download the latest Arch Linux ISO and create a bootable USB:

```bash
# On Linux
dd bs=4M if=archlinux.iso of=/dev/sdX status=progress && sync

# On Windows
# Use Rufus or Etcher
```

### 2. Boot and Install Arch

Follow the official [Arch Installation Guide](https://wiki.archlinux.org/title/Installation_guide).

**Key installation decisions:**

**Disk Layout:**
```
/dev/sda1 (1TB) - Root (/) - Btrfs
/dev/sdb1 (120GB) - /home - ext4
/dev/sdc1 (120GB) - /var/cache/pacman - ext4
```

**Additional partitions (optional):**
- Swap file: 8GB on / (recommended)
- EFI partition: 512MB (if UEFI boot)

**Install essential packages:**
```bash
pacstrap -K /mnt base base-devel linux linux-firmware amd-ucode intel-ucode
```

**Install additional tools:**
```bash
pacstrap -K /mnt networkmanager bluez bluez-utils git vim sudo curl wget bash-completion
```

### 3. Configure the System

```bash
# Generate fstab
genfstab -U /mnt >> /mnt/etc/fstab

# Chroot into the new system
arch-chroot /mnt

# Set timezone
ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
hwclock --systohc

# Set locale
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# Set hostname
echo "snaps-pc" > /etc/hostname

# Add hosts
cat >> /etc/hosts << EOF
127.0.0.1   localhost
::1         localhost
127.0.1.1   snaps-pc.localdomain snaps-pc
EOF

# Set root password
passwd

# Create user
useradd -m -G wheel,audio,video,storage,network -s /bin/bash wehttamsnaps
passwd wehttamsnaps

# Enable sudo for wheel group
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel

# Install and configure NetworkManager
systemctl enable NetworkManager
systemctl enable bluetooth

# Install bootloader (systemd-boot for UEFI or GRUB for BIOS)
bootctl install
```

**Update systemd-boot configuration:**
```bash
# Edit /boot/loader/entries/arch.conf
nano /boot/loader/entries/arch.conf

# Add:
title Arch Linux
linux /vmlinuz-linux
initrd /amd-ucode.img
initrd /initramfs-linux.img
options root="LABEL=arch" rw
```

### 4. Finish Installation

```bash
# Exit chroot
exit

# Unmount and reboot
umount -R /mnt
reboot
```

---

## Post-Installation Setup

### 1. Update System

```bash
sudo pacman -Syu
```

### 2. Install AUR Helper (paru)

```bash
# Install build dependencies
sudo pacman -S --needed base-devel git

# Clone paru
cd ~
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# Test paru
paru --version
```

### 3. Install Essential Packages

```bash
# Install audio system
sudo pacman -S pipewire pipewire-pulse pipewire-jack wireplumber pavucontrol qpwgraph

# Install display manager and compositor
paru -S niri sddm sddm-sugar-candy-git swaylock-effects-git wlogout

# Install fonts
sudo pacman -S ttf-fira-code ttf-fira-sans ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-color-emoji-fontconfig

# Install theming
sudo pacman -S catppuccin-gtk-theme-mocha kvantum-theme-catppuccin-mocha papirus-icon-theme nordic-cursor-theme

# Install productivity tools
sudo pacman -S thunar thunar-archive-plugin thunar-media-tags-plugin rofi wofi grim slurp swappy

# Install browser
sudo pacman -S firefox
paru -S brave-bin

# Install terminal
paru -S ghostty

# Install shell
sudo pacman -S zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting starship fastfetch

# Install gaming
sudo pacman -S steam gamemode gamescope
paru -S proton-ge-custom-bin protontricks protonup-qt

# Install photography
sudo pacman -S digikam darktable gimp gimp-plugin-gmic gimp-plugin-resynthesizer krita

# Install development
sudo pacman -S git neovim code kate

# Install media
sudo pacman -S vlc mpv mpv-mpris obs-studio

# Install communication
sudo pacman -S discord
paru -S telegram-desktop

# Install utilities
sudo pacman -S btop htop bat eza zoxide fd riprep fzf jq yq tree ncdu

# Install Flatpak
sudo pacman -S flatpak flatseal
```

### 4. Configure Zsh

```bash
# Set zsh as default shell
chsh -s /bin/zsh

# Create zsh configuration
cat > ~/.zshrc << 'EOF'
# WehttamSnaps Zsh Configuration
# GitHub: https://github.com/Crowdrocker

# Path
export PATH="$HOME/.local/bin:$HOME/.config/wehttamsnaps/scripts:$PATH"

# History
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE

# Aliases
alias update='sudo pacman -Syu'
alias cleanorphans='paru -Qtdq | paru -Rns -'
alias flatupdate='flatpak update'
alias gaming='sound-system gaming-toggle'
alias screenshot='grim ~/Pictures/Screenshots/$(date +%Y%m%d-%H%M%S).png && sound-system screenshot'
alias keyhints='~/.config/wehttamsnaps/scripts/KeyHints.sh'
alias jarvis='~/.config/wehttamsnaps/scripts/jarvis'
alias ls='eza --icons'
alias ll='eza -la --icons'
alias tree='eza --tree --icons'

# Starship prompt
eval "$(starship init zsh)"

# Zsh plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# FZF
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# Zoxide (better cd)
eval "$(zoxide init zsh)"

# Welcome message
if [ -f ~/.config/wehttamsnaps/quickshell-apps/welcome.py ]; then
    # Welcome screen is handled by Niri autostart
fi
EOF

# Apply changes
source ~/.zshrc
```

### 5. Configure Starship

```bash
# Create starship configuration
mkdir -p ~/.config/starship
cat > ~/.config/starship.toml << 'EOF'
# WehttamSnaps Starship Configuration
# Catppuccin Mocha Theme

format = """
[┌───────────────────>](bold fg:primary)\
$directory\
$git_branch\
$git_commit\
$git_state\
$git_metrics\
$git_status\
$nodejs\
$python\
$rust\
$golang\
$java\
$php\
$docker_context\
$kubernetes\
$aws\
$gcloud\
$azure\
[───────────────────](bold fg:primary)\
[├─](bold fg:primary)\
$username\
$hostname\
[├─](bold fg:primary)\
$time\
[└─>](bold fg:primary)$character"""

palette = "catppuccin_mocha"

[palettes.catppuccin_mocha]
rosewater = "#f5e0dc"
flamingo = "#f2cdcd"
pink = "#f5c2e7"
mauve = "#cba6f7"
red = "#f38ba8"
maroon = "#eba0ac"
peach = "#fab387"
yellow = "#f9e2af"
green = "#a6e3a1"
teal = "#94e2d5"
sky = "#89dceb"
sapphire = "#74c7ec"
blue = "#89b4fa"
lavender = "#b4befe"
text = "#cdd6f4"
subtext1 = "#bac2de"
subtext0 = "#a6adc8"
overlay2 = "#9399b2"
overlay1 = "#7f849c"
overlay0 = "#6c7086"
surface2 = "#585b70"
surface1 = "#45475a"
surface0 = "#313244"
base = "#1e1e2e"
mantle = "#181825"
crust = "#11111b"

[character]
success_symbol = "[❯](bold fg:green)"
error_symbol = "[✗](bold fg:red)"

[directory]
style = "fg:primary"
truncation_length = 3
truncate_to_repo = true
fish_style_pwd_dir_length = 1

[git_branch]
style = "fg:mauve"
symbol = " "

[git_status]
style = "fg:red"
format = '([\[$all_status$ahead_behind\]]($style) )'

[nodejs]
style = "fg:green"
symbol = " "

[python]
style = "fg:yellow"
symbol = " "

[rust]
style = "fg:orange"
symbol = " "

[username]
style_user = "fg:primary"
show_always = false

[hostname]
style = "fg:primary"
ssh_only = true

[time]
style = "fg:secondary"
disabled = false
format = "[ $time]($style) "
time_format = "%H:%M"
EOF
```

### 6. Configure Fastfetch

```bash
# Create fastfetch configuration
mkdir -p ~/.config/fastfetch
cat > ~/.config/fastfetch/config.jsonc << 'EOF'
{
    "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
    "logo": {
        "type": "small",
        "color": "89b4fa",
        "padding": {
            "top": 2,
            "left": 2
        }
    },
    "title": {
        "color": "89b4fa",
        "prefix": "┌─ "
    },
    "separator": {
        "color": "45475a"
    },
    "modules": [
        "title",
        {
            "type": "os",
            "key": "   OS",
            "keyColor": "f38ba8"
        },
        {
            "type": "host",
            "key": " Host",
            "keyColor": "f38ba8"
        },
        {
            "type": "kernel",
            "key": "Kernel",
            "keyColor": "fab387"
        },
        {
            "type": "uptime",
            "key": "Uptime",
            "keyColor": "fab387"
        },
        {
            "type": "packages",
            "key": "Pkgs",
            "keyColor": "a6e3a1"
        },
        {
            "type": "shell",
            "key": "Shell",
            "keyColor": "a6e3a1"
        },
        {
            "type": "display",
            "key": "Display",
            "keyColor": "89dceb"
        },
        {
            "type": "de",
            "key": "   DE",
            "keyColor": "89dceb"
        },
        {
            "type": "theme",
            "key": "Theme",
            "keyColor": "89dceb"
        },
        {
            "type": "cpu",
            "key": "  CPU",
            "keyColor": "cba6f7"
        },
        {
            "type": "gpu",
            "key": "  GPU",
            "keyColor": "cba6f7"
        },
        {
            "type": "memory",
            "key": "Memory",
            "keyColor": "f5c2e7"
        },
        {
            "type": "break",
            "repeat": 1,
            "color": "45475a"
        },
        {
            "type": "colors",
            "symbol": "circle"
        }
    ]
}
EOF
```

### 7. Configure Ghostty

```bash
# Create ghostty configuration
mkdir -p ~/.config/ghostty
cat > ~/.config/ghostty/config << 'EOF'
# WehttamSnaps Ghostty Configuration
# J.A.R.V.I.S. Themed Terminal

# Font
font-family = Fira Code
font-size = 12
font-weight = 500

# Color Scheme (Catppuccin Mocha)
background = 1e1e2e
foreground = cdd6f4
selection-background = 45475a
selection-foreground = cdd6f4

# Cursor
cursor-style = bar
cursor-color = f5c2e7 1e1e2e

# ANSI Colors
color-0 = 45475a
color-1 = f38ba8
color-2 = a6e3a1
color-3 = f9e2af
color-4 = 89b4fa
color-5 = f5c2e7
color-6 = 94e2d5
color-7 = bac2de
color-8 = 585b70
color-9 = f38ba8
color-10 = a6e3a1
color-11 = f9e2af
color-12 = 89b4fa
color-13 = f5c2e7
color-14 = 94e2d5
color-15 = a6adc8

# Window
window-padding-x = 8
window-padding-y = 8
window-decoration = false
window-theme = none

# Scrollback
scrollback-limit = 100000

# Shell
shell = zsh

# Keybindings
keybind = ctrl+shift+c=copy_to_clipboard
keybind = ctrl+shift+v=paste_from_clipboard
keybind = ctrl+shift+n=new_os_window
keybind = ctrl+shift+t=new_tab
keybind = ctrl+shift+q=close_tab

# Features
resize-increment = 1
mouse-hide-while-typing = true
confirm-close-surface = false
EOF
```

### 8. Install and Configure SDDM

```bash
# Enable SDDM
sudo systemctl enable sddm

# Configure SDDM theme
sudo mkdir -p /etc/sddm.conf.d
cat > /etc/sddm.conf.d/theme.conf << 'EOF'
[Theme]
Current=sugar-candy
CursorTheme=Nordic-cursors
EOF

# Reboot to SDDM
sudo reboot
```

---

## Installing WehttamSnaps Dotfiles

### 1. Clone the Repository

```bash
cd ~
git clone https://github.com/Crowdrocker/wehttamsnaps-dotfiles.git
cd wehttamsnaps-dotfiles
```

### 2. Run the Installation Script

```bash
chmod +x install.sh
./install.sh
```

The installation script will:
- Create necessary directories
- Copy configuration files to `~/.config/wehttamsnaps/`
- Create symlinks to Niri config
- Install utility scripts to `/usr/local/bin/`
- Set up sound directories
- Configure themes and wallpapers
- Install J.A.R.V.I.S. integration

### 3. Verify Installation

```bash
# Check Niri config
ls -la ~/.config/niri/

# Check scripts
ls -la ~/.config/wehttamsnaps/scripts/

# Test sound system
sound-system status
sound-system help

# Test J.A.R.V.I.S.
jarvis help
```

### 4. Start Niri

Start Niri from a TTY or from SDDM:

```bash
# From TTY (Ctrl+Alt+F2)
niri

# Or select Niri from SDDM session list
```

---

## Audio System Setup

The J.A.R.V.I.S. and iDroid sound system requires manual setup of audio files.

### 1. Download Sounds

Visit these websites to download J.A.R.V.I.S. and iDroid sounds:

**J.A.R.V.I.S. (Paul Bettany):**
- URL: https://www.101soundboards.com/boards/10155-jarvis-v1-paul-bettany
- Required sounds:
  - startup.mp3
  - shutdown.mp3
  - notification.mp3
  - audio-mute.mp3
  - audio-unmute.mp3
  - volume-up.mp3
  - volume-down.mp3
  - workspace-switch.mp3
  - screenshot.mp3
  - window-close.mp3
  - photo-export.mp3

**iDroid Voice:**
- URL: https://www.101soundboards.com/boards/10060-idroid-voice
- Required sounds:
  - gamemode-on.mp3
  - gamemode-off.mp3
  - alert-high.mp3
  - alert-medium.mp3
  - steam-launch.mp3
  - discord-notify.mp3

### 2. Install Sounds

```bash
# Create sound directories
sudo mkdir -p /usr/share/wehttamsnaps/sounds/{jarvis,idroid}
mkdir -p ~/.config/wehttamsnaps/sounds/{jarvis,idroid}

# Copy J.A.R.V.I.S. sounds
sudo cp ~/Downloads/jarvis/*.mp3 /usr/share/wehttamsnaps/sounds/jarvis/
cp ~/Downloads/jarvis/*.mp3 ~/.config/wehttamsnaps/sounds/jarvis/

# Copy iDroid sounds
sudo cp ~/Downloads/idroid/*.mp3 /usr/share/wehttamsnaps/sounds/idroid/
cp ~/Downloads/idroid/*.mp3 ~/.config/wehttamsnaps/sounds/idroid/

# Set permissions
sudo chmod 644 /usr/share/wehttamsnaps/sounds/*/*.mp3
chmod 644 ~/.config/wehttamsnaps/sounds/*/*.mp3
```

### 3. Test Sound System

```bash
# Test all sounds
sound-system test

# Test specific sound
sound-system preview startup jarvis
sound-system preview gamemode-on idroid

# Check status
sound-system status
```

### 4. Configure PipeWire Audio Routing

See [AUDIO-ROUTING.md](AUDIO-ROUTING.md) for detailed audio routing setup.

---

## Gaming Configuration

### 1. Steam Setup

```bash
# Install Steam (already done in post-installation)
# Configure Proton:
# - Install Proton-GE via ProtonUp-Qt
# - Configure each game to use Proton-GE
```

### 2. Configure Game Launch Options

See [GAMING.md](GAMING.md) for detailed game-specific launch options for:
- Call of Duty HQ
- Cyberpunk 2077
- Fallout 4
- FarCry 5
- Ghost Recon Breakpoint
- Marvel's Avengers
- Need for Speed Payback
- Rise/Shadow of the Tomb Raider
- The First Descendant
- Tom Clancy's The Division 1 & 2
- Warframe
- Watch Dogs 1, 2, & Legion

### 3. Configure Wine/Proton for Modding Tools

```bash
# Install Wine dependencies
paru -S wine-gecko wine-mono lib32-gnutls lib32-giflib lib32-libpulse

# Configure Wine
winecfg

# Install modding tools:
# - Vortex: https://www.nexusmods.com/site/mods/1
# - Mod Organizer 2: https://www.nexusmods.com/site/mods/28
# - Wabbajack: https://www.wabbajack.org/
```

### 4. Enable Gaming Mode

```bash
# Press Mod+G to toggle gaming mode
# Or use command:
gaming
```

---

## WebApps Setup

WebApps provide isolated browser profiles for specific websites.

### 1. Create WebApps

Use the provided webapp templates:

```bash
cd ~/.config/wehttamsnaps/scripts
./create-webapp.sh
```

Or manually create webapps:

**YouTube WebApp:**
```bash
firefox --new-window --profile=Youtube https://youtube.com
```

**Twitch WebApp:**
```bash
firefox --new-window --profile=Twitch https://twitch.tv
```

**Spotify WebApp:**
```bash
firefox --new-window --profile=Spotify https://open.spotify.com
```

**Discord WebApp:**
```bash
firefox --new-window --profile=Discord https://discord.com
```

### 2. WebApp Keybinds

- `Mod + Ctrl + Y` - YouTube
- `Mod + Ctrl + T` - Twitch
- `Mod + Ctrl + S` - Spotify
- `Mod + Ctrl + D` - Discord

---

## Troubleshooting

### Audio Not Working

```bash
# Check PipeWire status
systemctl --user status pipewire
systemctl --user status pipewire-pulse
systemctl --user status wireplumber

# Restart audio services
systemctl --user restart pipewire pipewire-pulse wireplumber

# Check audio devices
pactl list sinks
pactl list sources

# Test sound
paplay /usr/share/sounds/freedesktop/stereo/complete.oga
```

### Games Crashing

See [TROUBLESHOOTING.md](TROUBLESHOOTING.md) for detailed game troubleshooting.

### Niri Not Starting

```bash
# Check Niri logs
journalctl -xe

# Validate Niri config
niri msg action validate-config

# Check config syntax
cat ~/.config/niri/config.kdl
```

### Sound System Not Working

```bash
# Check sound-system script
which sound-system
ls -l /usr/local/bin/sound-system

# Test manually
sh -c "~/.config/wehttamsnaps/scripts/sound-system status"

# Check sound files
ls -l ~/.config/wehttamsnaps/sounds/jarvis/
ls -l ~/.config/wehttamsnaps/sounds/idroid/
```

### Performance Issues

```bash
# Check system resources
btop

# Check GPU performance
radeontop

# Enable gaming mode
gaming

# Disable animations (in Niri config)
# Set animations.enable to false
```

---

## Next Steps

1. Read [QUICKSTART.md](QUICKSTART.md) for first boot instructions
2. Read [GAMING.md](GAMING.md) for gaming optimization
3. Read [AUDIO-ROUTING.md](AUDIO-ROUTING.md) for audio configuration
4. Read [PHOTOGRAPHY.md](PHOTOGRAPHY.md) for photography workflow
5. Read [TROUBLESHOOTING.md](TROUBLESHOOTING.md) for common issues

---

## Support

- **GitHub**: https://github.com/Crowdrocker/wehttamsnaps-dotfiles
- **Twitch**: https://twitch.tv/WehttamSnaps
- **YouTube**: https://youtube.com/@WehttamSnaps

---

<div align="center">

**Made with ❤️ by WehttamSnaps**

*Photography • Gaming • Content Creation*

</div>