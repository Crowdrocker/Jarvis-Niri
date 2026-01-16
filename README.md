# WehttamSnaps - J.A.R.V.I.S. Themed Arch Linux Niri Setup

<div align="center">

![WehttamSnaps Logo](logo.txt)

**A professional, J.A.R.V.I.S. themed Arch Linux workstation optimized for photography, gaming, and content creation.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Arch Linux](https://img.shields.io/badge/Arch-Linux-blue.svg)](https://archlinux.org/)
[![Niri](https://img.shields.io/badge/Compositor-Niri-purple.svg)](https://github.com/YaLTeR/niri)
[![Quickshell](https://img.shields.io/badge/Shell-Quickshell-cyan.svg)](https://github.com/woutuu/quickshell)

</div>

## 🌟 Features

### 🎨 Visual Experience
- **Niri Wayland Compositor** - Modern, performant tiling window manager
- **Quickshell (Noctalia)** - Beautiful, customizable shell replacement for Waybar
- **J.A.R.V.I.S. Theme** - Immersive sound and visual integration
- **Adaptive Sound System** - Auto-switches between J.A.R.V.I.S. (professional) and iDroid (gaming) voices
- **Catppuccin Mocha Color Scheme** - Consistent, vibrant theming throughout

### 🎮 Gaming Optimized
- **RX 580 Optimized** - Mesa tweaks, RADV performance presets
- **16 Pre-configured Games** - Division 2, Cyberpunk 2077, Fallout 4, Watch Dogs series, and more
- **Gaming Mode** - One-toggle performance boost with iDroid voice activation
- **GameMode & Gamescope** - Automatic performance optimization
- **Proton GE Integration** - Latest Proton versions for Windows games
- **Wine/Proton Setup** - Configured for modding tools (Vortex, MO2, Wabbajack)

### 📷 Photography Workflow
- **Professional Pipeline** - DigiKam → Darktable → GIMP → Krita workflow
- **Workspace Organization** - Dedicated photography workspace with auto-switching
- **Export Integration** - Sound confirmation on photo export
- **Color Management** - Full color profile support

### 🔊 Audio System
- **PipeWire + qpwgraph** - Professional audio routing like Voicemeeter
- **Virtual Sinks** - Separate channels for game, browser, Discord, Spotify
- **OBS Integration** - Route any application to your stream
- **Adaptive Sound Feedback** - Context-aware voice responses

### 🚀 Productivity
- **10 Organized Workspaces** - Browser, Terminal, Gaming, Streaming, Photo, Media, Comm, Music, Files, Misc
- **Quickshell Widgets** - Customizable widgets for work and gaming
- **Starship Prompt** - Fast, feature-rich shell prompt
- **Fastfetch** - Beautiful system information display
- **WebApps** - YouTube, Twitch, Spotify, Discord with isolated profiles
- **Comprehensive Keybinds** - Efficient keyboard shortcuts for everything

## 📋 System Requirements

### Hardware
- **CPU**: Intel Core i5/i7 or AMD Ryzen (tested on i7-4790)
- **GPU**: AMD RX 580 (8GB) or equivalent
- **RAM**: 16GB minimum
- **Storage**: SSD recommended (3 SSD support: 1TB + 2x120GB)

### Software
- **OS**: Arch Linux (fresh install recommended)
- **Display Server**: Wayland
- **Compositor**: Niri

## 🚀 Quick Start

### 1. Clone the Repository
```bash
git clone https://github.com/Crowdrocker/Jarvis-Niri.git ~/Jarvis-Niri
cd ~/Jarvis-Niri
```

### 2. Run the Installation Script
```bash
chmod +x install.sh
./install.sh
```

### 3. Reboot and Enjoy!
```bash
reboot
```

## 📚 Documentation

- **[INSTALL.md](docs/INSTALL.md)** - Detailed installation guide
- **[QUICKSTART.md](docs/QUICKSTART.md)** - First boot instructions
- **[GAMING.md](docs/GAMING.md)** - Gaming setup and optimization
- **[AUDIO-ROUTING.md](docs/AUDIO-ROUTING.md)** - Audio configuration guide
- **[PHOTOGRAPHY.md](docs/PHOTOGRAPHY.md)** - Photography workflow guide
- **[TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)** - Common issues and solutions

## 🗂️ Directory Structure

```
wehttamsnaps-dotfiles/
├── README.md                      # This file
├── logo.txt                       # ASCII art logo
├── install.sh                     # Main installation script
├── save-configs.sh                # Backup/sync script
│
├── configs/                       # Configuration files
│   ├── niri/                      # Niri compositor config
│   │   ├── config.kdl             # Main Niri config
│   │   └── conf.d/                # Modular config files
│   │       ├── 10-keybinds.kdl
│   │       ├── 20-window-rules.kdl
│   │       ├── 30-workspaces.kdl
│   │       └── 50-autostart.kdl
│   │
│   ├── noctalia/                  # Quickshell (Noctalia) configs
│   │   ├── widgets/               # Custom widgets
│   │   │   ├── work/              # Work mode widgets
│   │   │   ├── gaming/            # Gaming mode widgets
│   │   │   └── photo/             # Photo mode widgets
│   │   └── settings.qml
│   │
│   ├── quickshell-apps/           # Quickshell applications
│   │   ├── welcome.py             # Welcome screen
│   │   └── settings.sh            # Quick settings
│   │
│   ├── ghostty/                   # Ghostty terminal config
│   ├── starship/                  # Starship prompt config
│   └── fastfetch/                 # Fastfetch config
│
├── sounds/                        # J.A.R.V.I.S. and iDroid sounds
│   ├── jarvis/                    # J.A.R.V.I.S. voice (professional mode)
│   │   ├── startup.mp3
│   │   ├── shutdown.mp3
│   │   └── ...
│   └── idroid/                    # iDroid voice (gaming mode)
│       ├── gamemode-on.mp3
│       ├── gamemode-off.mp3
│       └── ...
│
├── webapps/                       # Web application configs
│   ├── youtube.webapp
│   ├── twitch.webapp
│   ├── spotify.webapp
│   └── discord.webapp
│
├── scripts/                       # Utility scripts
│   ├── sound-system               # Adaptive sound system
│   ├── jarvis                     # Voice assistant
│   ├── jarvis-menu                # Visual menu
│   ├── toggle-gaming-mode.sh      # Gaming mode toggle
│   ├── create-webapp.sh           # Webapp generator
│   └── audio-setup.sh             # Audio routing setup
│
├── docs/                          # Documentation
├── themes/                        # Theme files (GTK, Qt, etc.)
├── wallpapers/                    # Wallpaper collection
└── packages/                      # Package lists
    ├── core.list.txt              # Essential packages
    └── optional.list.txt          # Optional packages
```

## 🎮 Supported Games

Pre-configured launch options for:
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

See [GAMING.md](docs/GAMING.md) for detailed setup instructions.

## 🔑 Keybindings

Press `Mod + H` anytime to see the full keybindings cheat sheet.

### Essential Shortcuts
| Key | Action |
|-----|--------|
| `Mod + Space` | Application Launcher |
| `Mod + Enter` | Terminal (Ghostty) |
| `Mod + H` | KeyHints Cheat Sheet |
| `Mod + B` | Browser (Firefox) |
| `Mod + E` | File Manager (Thunar) |
| `Mod + G` | Toggle Gaming Mode |
| `Mod + Q` | Close Window |
| `Mod + 1-0` | Switch Workspaces |

## 🎨 Theme Colors

**Catppuccin Mocha Palette:**
- Background: `#1e1e2e`
- Foreground: `#cdd6f4`
- Primary: `#89b4fa`
- Secondary: `#f38ba8`
- Accent: `#a6e3a1`

## 🔧 Customization

### Adding Widgets
```bash
cd ~/Jarvis-Niri/scripts
./create-widget.sh
```

### Creating WebApps
```bash
cd ~/wehttamsnaps-dotfiles/scripts
./create-webapp.sh
```

### Customizing Sounds
Place your sounds in:
- `~/Jarvis-Niri/sounds/jarvis/` for J.A.R.V.I.S. voice
- `~/Jarvis-Niri/sounds/idroid/` for iDroid voice

Run `save-configs.sh` to sync to system.

## 📝 Scripts

### sound-system
Adaptive sound system that auto-switches between J.A.R.V.I.S. and iDroid based on context.

```bash
sound-system status           # Check current mode
sound-system gaming-toggle    # Toggle gaming mode
sound-system test             # Test all sounds
sound-system preview startup jarvis
```

### jarvis
Natural language voice assistant.

```bash
jarvis open firefox          # Launch applications
jarvis close window          # Window control
jarvis workspace 2           # Switch workspaces
jarvis search google for linux tips  # Web search
jarvis gaming mode           # Toggle gaming mode
```

### jarvis-menu
Visual menu interface for J.A.R.V.I.S. commands.

```bash
jarvis-menu                  # Full menu
jarvis-menu apps             # Quick app launcher
jarvis-menu workspaces       # Workspace switcher
```

## 🤝 Contributing

This is a personal setup, but feel free to fork and customize for your needs!

## 📄 License

MIT License - feel free to use, modify, and distribute.

## 🙏 Credits

- **Niri** - Wayland compositor by [YaLTeR](https://github.com/YaLTeR/niri)
- **Quickshell** - Shell framework by [woutuu](https://github.com/woutuu/quickshell)
- **Catppuccin** - Color scheme by [Catppuccin](https://github.com/catppuccin/catppuccin)
- **Ghostty** - Terminal emulator by [MitchellHashimoto](https://github.com/mitchellh/ghostty)
- **Starship** - Prompt by [Starship](https://github.com/starship/starship)
- **Fastfetch** - System info by [Fastfetch](https://github.com/fastfetch-cli/fastfetch)

## 📮 Support

- **GitHub Issues**: [Create an issue](https://github.com/Crowdrocker/wehttamsnaps-dotfiles/issues)
- **Twitch**: [WehttamSnaps](https://twitch.tv/WehttamSnaps)
- **YouTube**: [@WehttamSnaps](https://youtube.com/@WehttamSnaps)

---

<div align="center">

**Made with ❤️ by WehttamSnaps**

*Photography • Gaming • Content Creation*

[![GitHub](https://img.shields.io/badge/Github-Crowdrocker-black?logo=github)](https://github.com/Crowdrocker)
[![Twitch](https://img.shields.io/badge/Twitch-WehttamSnaps-purple?logo=twitch)](https://twitch.tv/WehttamSnaps)
[![YouTube](https://img.shields.io/badge/YouTube-@WehttamSnaps-red?logo=youtube)](https://youtube.com/@WehttamSnaps)

</div>
