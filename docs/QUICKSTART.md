# WehttamSnaps - Quick Start Guide

Welcome to your new J.A.R.V.I.S. themed Arch Linux workstation! This guide will help you get started with your WehttamSnaps setup.

## Table of Contents

1. [First Boot](#first-boot)
2. [Essential Shortcuts](#essential-shortcuts)
3. [J.A.R.V.I.S. Voice System](#jarvis-voice-system)
4. [Workspaces](#workspaces)
5. [Gaming Mode](#gaming-mode)
6. [Audio System](#audio-system)
7. [Common Tasks](#common-tasks)
8. [Getting Help](#getting-help)

---

## First Boot

### 1. Welcome Screen

On your first boot, you'll see the WehttamSnaps Welcome App with:
- Quick Start guide
- Workspace overview
- Feature highlights
- Pro tips
- Resource links

**Tip:** You can always access the welcome app later by running:
```bash
python3 ~/.config/wehttamsnaps/quickshell-apps/welcome.py
```

### 2. Verify Your Setup

Check that everything is working:

```bash
# Test sound system
sound-system status

# Test J.A.R.V.I.S.
jarvis help

# Check Niri config
niri msg action validate-config

# View keybinds
keyhints
```

### 3. Download Sounds (If Not Done Yet)

The J.A.R.V.I.S. and iDroid sound system requires audio files:

**J.A.R.V.I.S. (Paul Bettany):**
- Visit: https://www.101soundboards.com/boards/10155-jarvis-v1-paul-bettany
- Download: startup, shutdown, notification, audio-mute, audio-unmute, volume-up, volume-down, workspace-switch, screenshot, window-close, photo-export

**iDroid Voice:**
- Visit: https://www.101soundboards.com/boards/10060-idroid-voice
- Download: gamemode-on, gamemode-off, alert-high, alert-medium, steam-launch, discord-notify

**Install sounds:**
```bash
# Copy J.A.R.V.I.S. sounds
cp ~/Downloads/jarvis/*.mp3 ~/.config/wehttamsnaps/sounds/jarvis/

# Copy iDroid sounds
cp ~/Downloads/idroid/*.mp3 ~/.config/wehttamsnaps/sounds/idroid/

# Test sounds
sound-system test
```

---

## Essential Shortcuts

Press **Mod + H** anytime to see the full keybindings cheat sheet.

### Most Used Shortcuts

| Key | Action | Notes |
|-----|--------|-------|
| `Mod + Space` | Application Launcher | Quickshell/Noctalia |
| `Mod + Enter` | Terminal | Ghostty with Fira Code |
| `Mod + H` | KeyHints | Full cheat sheet |
| `Mod + B` | Browser | Firefox |
| `Mod + E` | File Manager | Thunar |
| `Mod + Q` | Close Window | With J.A.R.V.I.S. sound |
| `Mod + G` | Toggle Gaming Mode | iDroid sounds + performance |
| `Mod + 1-0` | Switch Workspaces | 10 organized workspaces |

### Window Management

| Key | Action |
|-----|--------|
| `Mod + Q` | Close window |
| `Mod + F` | Maximize column |
| `Mod + Shift + F` | Fullscreen |
| `Mod + Ctrl + V` | Toggle floating |
| `Mod + W` | Toggle tabbed |
| `Mod + Arrow Keys` | Move focus |

### Screenshots

| Key | Action |
|-----|--------|
| `Mod + Print` | Full screenshot (with sound) |
| `Ctrl + Print` | Screen capture (Niri) |
| `Alt + Print` | Window capture (Niri) |
| `Mod + Shift + Print` | Region screenshot |

---

## J.A.R.V.I.S. Voice System

Your setup features an adaptive sound system that switches between:
- **J.A.R.V.I.S.** (Paul Bettany voice) - Professional mode
- **iDroid** - Gaming/tactical mode

### Sound Modes

**J.A.R.V.I.S. Mode** (Professional):
- Active on: Workspace 1, 4, 5, 6, 8, 9, 10
- Used for: Desktop work, photography, general use
- Sounds: Professional, calm responses

**iDroid Mode** (Gaming):
- Active on: Workspace 2, 3, 7 (and Gaming Mode)
- Used for: Gaming, high-performance tasks
- Sounds: Tactical, combat-style responses

### Using J.A.R.V.I.S.

**Voice Assistant:**
```bash
# Interactive mode
jarvis interactive

# Quick commands
jarvis open firefox
jarvis close window
jarvis workspace 3
jarvis search google for linux tips
jarvis gaming mode
```

**Visual Menu:**
```bash
# Full menu with categories
jarvis-menu

# Quick app launcher
jarvis-menu apps

# Quick workspace switcher
jarvis-menu workspaces
```

**Sound System:**
```bash
# Check status
sound-system status

# Toggle gaming mode
sound-system gaming-toggle

# Test sounds
sound-system test

# Preview specific sound
sound-system preview startup jarvis
```

---

## Workspaces

Your setup includes 10 organized workspaces:

### Workspace Overview

| # | Name | Purpose | Keybind | Sound Mode |
|---|------|---------|---------|------------|
| 1 | Browser | Web browsing, research | `Mod + 1` | J.A.R.V.I.S. |
| 2 | Terminal/Dev | Coding, terminal work | `Mod + 2` | iDroid |
| 3 | Gaming | Steam, games | `Mod + 3` | iDroid |
| 4 | Streaming | OBS Studio, streaming | `Mod + 4` | J.A.R.V.I.S. |
| 5 | Photography | Photo editing | `Mod + 5` | J.A.R.V.I.S. |
| 6 | Media | Video editing | `Mod + 6` | J.A.R.V.I.S. |
| 7 | Communication | Discord, Telegram | `Mod + 7` | iDroid |
| 8 | Music | Spotify, VLC | `Mod + 8` | J.A.R.V.I.S. |
| 9 | Files | Thunar, file management | `Mod + 9` | J.A.R.V.I.S. |
| 10 | Misc | Overflow workspace | `Mod + 0` | J.A.R.V.I.S. |

### Workspace Actions

**Switch to workspace:**
- `Mod + 1-0` - Direct switch
- `Mod + BracketRight` - Next workspace
- `Mod + BracketLeft` - Previous workspace

**Move window to workspace:**
- `Mod + Shift + 1-0` - Move focused window

**Quick access:**
- `Mod + 3` - Gaming workspace
- `Mod + 5` - Photography workspace
- `Mod + 4` - Streaming workspace

---

## Gaming Mode

Gaming Mode optimizes your system for gaming and switches to iDroid sounds.

### Enable Gaming Mode

**Toggle with keybind:**
- Press `Mod + G`

**Or use command:**
```bash
gaming
# or
sound-system gaming-toggle
```

### What Gaming Mode Does

1. **Sound System:** Switches to iDroid voice
2. **Performance:** Sets CPU to performance mode
3. **Notifications:** Reduces notifications
4. **Animations:** (Optional) Disables animations for performance

### Gaming Workspace

Use `Mod + 3` to switch to the gaming workspace. All gaming apps are pre-configured for optimal performance.

### Supported Games

Your setup includes pre-configured launch options for:
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

See [GAMING.md](GAMING.md) for detailed game-specific optimizations.

---

## Audio System

Your setup uses PipeWire with professional audio routing capabilities.

### Basic Audio Controls

| Key | Action |
|-----|--------|
| `XF86AudioMute` | Mute/Unmute |
| `XF86AudioRaiseVolume` | Volume Up |
| `XF86AudioLowerVolume` | Volume Down |
| `XF86AudioMicMute` | Microphone Mute |

### Audio Routing (Voicemeeter-like)

For advanced audio routing, use **qpwgraph**:

```bash
# Launch qpwgraph
qpwgraph

# Keybind: Mod + A (if configured)
```

**qpwgraph allows you to:**
- Separate audio channels (game, browser, Discord, Spotify)
- Route any application to specific outputs
- Create virtual sinks for streaming
- Save routing presets

### Audio Troubleshooting

```bash
# Check audio status
sound-system status

# Restart audio services
systemctl --user restart pipewire pipewire-pulse wireplumber

# Check audio devices
pactl list sinks
pactl list sources

# Test audio
paplay /usr/share/sounds/freedesktop/stereo/complete.oga
```

For detailed audio routing setup, see [AUDIO-ROUTING.md](AUDIO-ROUTING.md).

---

## Common Tasks

### Screenshot

```bash
# Full screenshot with sound
Mod + Print

# Or using command
screenshot

# Screenshot location: ~/Pictures/Screenshots/
```

### Update System

```bash
# Update Arch packages
update

# Or manually
sudo pacman -Syu

# Update Flatpaks
flatpak update

# Clear orphaned packages
cleanorphans
```

### Launch Apps

**Using launcher:**
- Press `Mod + Space` and type app name

**Using keybinds:**
- `Mod + B` - Firefox
- `Mod + E` - Thunar (file manager)
- `Mod + Enter` - Terminal (Ghostty)
- `Mod + O` - OBS Studio
- `Mod + P` - Spotify
- `Mod + Shift + S` - Steam (with iDroid sound)

### WebApps

WebApps provide isolated browser profiles:

| Keybind | WebApp |
|---------|--------|
| `Mod + Ctrl + Y` | YouTube |
| `Mod + Ctrl + T` | Twitch |
| `Mod + Ctrl + S` | Spotify |
| `Mod + Ctrl + D` | Discord |

### Photography Workflow

1. **Import:** Use DigiKam to organize photos
2. **Process:** Use Darktable for RAW editing
3. **Edit:** Use GIMP for advanced editing
4. **Export:** Press `Mod + Shift + E` after saving (plays confirmation sound)

Quick access: Press `Mod + 5` for photography workspace.

### Development

**Terminal:** Ghostty with Fira Code, Zsh, Starship

**Editors:**
- `Mod + Shift + T` - Kate
- `Mod + Shift + C` - VS Code

**Git:**
```bash
# Git workflow
Mod + Shift + G  # Opens lazygit
```

---

## Getting Help

### Documentation

- **[INSTALL.md](INSTALL.md)** - Full installation guide
- **[GAMING.md](GAMING.md)** - Gaming optimizations
- **[AUDIO-ROUTING.md](AUDIO-ROUTING.md)** - Audio configuration
- **[PHOTOGRAPHY.md](PHOTOGRAPHY.md)** - Photography workflow
- **[TROUBLESHOOTING.md](TROUBLESHOOTING.md)** - Common issues

### Built-in Help

**KeyHints:** Press `Mod + H` anytime to see all keybindings

**J.A.R.V.I.S. Help:**
```bash
jarvis help
```

**Sound System Help:**
```bash
sound-system help
```

### Community Support

- **GitHub:** https://github.com/Crowdrocker/wehttamsnaps-dotfiles
- **Twitch:** https://twitch.tv/WehttamSnaps
- **YouTube:** https://youtube.com/@WehttamSnaps

### Common Issues

**Audio not working:**
```bash
systemctl --user restart pipewire pipewire-pulse wireplumber
```

**Games crashing:**
- Enable Gaming Mode: `Mod + G`
- See [GAMING.md](GAMING.md) for game-specific fixes

**Niri not starting:**
```bash
niri msg action validate-config
journalctl -xe
```

**Sounds not playing:**
```bash
sound-system status
sound-system test
```

---

## Customization

### Add Custom Scripts

Place your custom scripts in:
```
~/.config/wehttamsnaps/scripts/
```

Make them executable:
```bash
chmod +x ~/.config/wehttamsnaps/scripts/your-script.sh
```

### Add Custom Widgets

Quickshell widgets can be added to:
```
~/.config/wehttamsnaps/noctalia/widgets/
```

See widget templates in the repository.

### Add WebApps

Create a new webapp:
```bash
cd ~/.config/wehttamsnaps/scripts
./create-webapp.sh
```

### Customize Theme

**GTK Theme:** Use GNOME settings or qt6ct
```bash
qt6ct
```

**Terminal Theme:** Edit `~/.config/ghostty/config`

**Prompt Theme:** Edit `~/.config/starship.toml`

---

## Next Steps

1. **Download Sounds:** Get J.A.R.V.I.S. and iDroid sounds (see First Boot)
2. **Configure Audio:** Set up audio routing with qpwgraph
3. **Configure Gaming:** Set up Steam and game launch options
4. **Customize:** Adjust theme colors, fonts, and layouts to your preference
5. **Explore:** Try different workspaces, apps, and features

---

## Tips & Tricks

1. **Use Gaming Mode:** Press `Mod + G` before launching games
2. **Screenshot with Sound:** Use `Mod + Print` for screenshots with audio feedback
3. **Voice Assistant:** Try `jarvis interactive` for natural language commands
4. **Workspace Sounds:** Each workspace plays a sound when switching
5. **Photo Export:** Use `Mod + Shift + E` after exporting photos
6. **Quick Help:** Press `Mod + H` anytime for keybindings
7. **Audio Routing:** Use qpwgraph to separate audio channels for streaming
8. **System Update:** Use `update` alias for easy system updates

---

## Keyboard Shortcuts Summary

**Mod = SUPER (Windows Key)**

| Category | Key | Action |
|----------|-----|--------|
| **System** | Mod+Space | App Launcher |
| | Mod+Enter | Terminal |
| | Mod+H | KeyHints |
| | Mod+G | Gaming Mode |
| **Windows** | Mod+Q | Close |
| | Mod+F | Maximize |
| | Mod+Shift+F | Fullscreen |
| | Mod+Ctrl+V | Float |
| **Workspaces** | Mod+1-0 | Switch |
| | Mod+Shift+1-0 | Move Window |
| **Screenshots** | Mod+Print | Screenshot |
| | Ctrl+Print | Screen Capture |
| | Alt+Print | Window Capture |
| **Audio** | XF86AudioMute | Mute |
| | XF86AudioVol± | Volume |
| | XF86MicMute | Mic Mute |
| **WebApps** | Mod+Ctrl+Y | YouTube |
| | Mod+Ctrl+T | Twitch |
| | Mod+Ctrl+S | Spotify |
| | Mod+Ctrl+D | Discord |

---

<div align="center">

**Enjoy your WehttamSnaps workstation!**

*Photography • Gaming • Content Creation*

[GitHub](https://github.com/Crowdrocker) • [Twitch](https://twitch.tv/WehttamSnaps) • [YouTube](https://youtube.com/@WehttamSnaps)

</div>