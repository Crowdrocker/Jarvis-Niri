#!/bin/bash
# =============================================================================
# WehttamSnaps - Installation Script
# Automates the installation of J.A.R.V.I.S. themed Arch Linux setup
# =============================================================================
# Author: Matthew (WehttamSnaps)
# GitHub: https://github.com/Crowdrocker
# =============================================================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config/wehttamsnaps"
BACKUP_DIR="$HOME/.config/wehttamsnaps-backup-$(date +%Y%m%d-%H%M%S)"
USER_NAME=$(whoami)

# Functions
print_header() {
    echo -e "\n${CYAN}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${NC}  ${BLUE}$1${NC}$(printf "%*s" $((58 - ${#1})) "")${CYAN}║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${NC}\n"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

backup_config() {
    local config_path="$1"
    if [[ -e "$config_path" ]]; then
        print_info "Backing up $config_path to $BACKUP_DIR"
        mkdir -p "$BACKUP_DIR"
        cp -r "$config_path" "$BACKUP_DIR/"
    fi
}

# Main installation
main() {
    clear
    cat << 'EOF'
# =============================================================================
#   __  __          _    _             _____ 
#  |  \/  |        | |  | |           / ____|
#  | \  / | ___  __| |__| | ___ _ __ | |     ___  _ __ ___
#  | |\/| |/ _ \/ _` | __| |/ _ \ '_ \| |    / _ \| '__/ _ \
#  | |  | |  __/ (_| | |_| |  __/ | | | |___| (_) | | |  __/
#  |_|  |_|\___|\__,_|\__|_|\___|_| |_|\_____\___/|_|  \___|
#  
#  WehttamSnaps - J.A.R.V.I.S. Themed Arch Linux Setup
#  GitHub: https://github.com/Crowdrocker
# =============================================================================
EOF

    echo ""
    read -p "Press Enter to begin installation..."
    echo ""

    # Phase 1: Backup existing configs
    print_header "Phase 1: Backing Up Existing Configurations"
    
    backup_config "$HOME/.config/niri"
    backup_config "$HOME/.config/ghostty"
    backup_config "$HOME/.config/starship"
    backup_config "$HOME/.config/fastfetch"
    backup_config "$HOME/.config/wehttamsnaps"
    
    print_success "Configurations backed up to $BACKUP_DIR"

    # Phase 2: Create directory structure
    print_header "Phase 2: Creating Directory Structure"
    
    mkdir -p "$CONFIG_DIR"/{scripts,sounds/{jarvis,idroid},wallpapers,webapps,noctalia/{widgets/{work,gaming,photo}},quickshell-apps}
    mkdir -p "$HOME/Pictures/Screenshots"
    
    print_success "Directory structure created"

    # Phase 3: Copy configuration files
    print_header "Phase 3: Copying Configuration Files"
    
    # Niri config
    cp -r "$SCRIPT_DIR/configs/niri" "$HOME/.config/"
    print_success "Niri configuration copied"
    
    # Ghostty config
    cp -r "$SCRIPT_DIR/configs/ghostty" "$HOME/.config/"
    print_success "Ghostty configuration copied"
    
    # Starship config
    cp -r "$SCRIPT_DIR/configs/starship" "$HOME/.config/"
    print_success "Starship configuration copied"
    
    # Fastfetch config
    cp -r "$SCRIPT_DIR/configs/fastfetch" "$HOME/.config/"
    print_success "Fastfetch configuration copied"
    
    # Noctalia/Quickshell
    cp -r "$SCRIPT_DIR/configs/noctalia" "$CONFIG_DIR/"
    print_success "Noctalia configuration copied"
    
    # Quickshell apps
    cp "$SCRIPT_DIR/configs/quickshell-apps/"* "$CONFIG_DIR/quickshell-apps/" 2>/dev/null || true
    print_success "Quickshell apps copied"

    # Phase 4: Install scripts
    print_header "Phase 4: Installing Utility Scripts"
    
    # Copy scripts to config
    cp "$SCRIPT_DIR/scripts/"* "$CONFIG_DIR/scripts/" 2>/dev/null || true
    chmod +x "$CONFIG_DIR/scripts/"*
    
    # Copy system-wide scripts
    if [[ -d "$SCRIPT_DIR/scripts" ]]; then
        for script in "$SCRIPT_DIR/scripts"/*.sh; do
            if [[ -f "$script" ]]; then
                script_name=$(basename "$script")
                print_info "Installing $script_name to /usr/local/bin"
                sudo cp "$script" "/usr/local/bin/${script_name%.sh}"
                sudo chmod +x "/usr/local/bin/${script_name%.sh}"
            fi
        done
    fi
    
    # Copy non-shell scripts (jarvis, jarvis-menu, sound-system)
    for script in "$SCRIPT_DIR/scripts"/jarvis "$SCRIPT_DIR/scripts"/jarvis-menu "$SCRIPT_DIR/scripts"/sound-system; do
        if [[ -f "$script" ]]; then
            script_name=$(basename "$script")
            print_info "Installing $script_name to /usr/local/bin"
            sudo cp "$script" "/usr/local/bin/$script_name"
            sudo chmod +x "/usr/local/bin/$script_name"
        fi
    done
    
    print_success "Scripts installed to /usr/local/bin"

    # Phase 5: Install sound files
    print_header "Phase 5: Setting Up Sound System"
    
    # Create system-wide sound directory
    sudo mkdir -p "/usr/share/wehttamsnaps/sounds/{jarvis,idroid}"
    
    # Copy sounds if they exist
    if [[ -d "$SCRIPT_DIR/sounds/jarvis" ]]; then
        cp -r "$SCRIPT_DIR/sounds/jarvis/"*.mp3 "/usr/share/wehttamsnaps/sounds/jarvis/" 2>/dev/null || true
        cp -r "$SCRIPT_DIR/sounds/jarvis/"*.mp3 "$CONFIG_DIR/sounds/jarvis/" 2>/dev/null || true
    fi
    
    if [[ -d "$SCRIPT_DIR/sounds/idroid" ]]; then
        cp -r "$SCRIPT_DIR/sounds/idroid/"*.mp3 "/usr/share/wehttamsnaps/sounds/idroid/" 2>/dev/null || true
        cp -r "$SCRIPT_DIR/sounds/idroid/"*.mp3 "$CONFIG_DIR/sounds/idroid/" 2>/dev/null || true
    fi
    
    print_success "Sound directories created"
    print_warning "You need to download J.A.R.V.I.S. and iDroid sounds manually"
    print_info "See docs/INSTALL.md for download links"

    # Phase 6: Install themes
    print_header "Phase 6: Configuring Themes"
    
    # Set GTK theme
    gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Mocha-Standard-Blue-dark" 2>/dev/null || true
    gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark" 2>/dev/null || true
    gsettings set org.gnome.desktop.interface cursor-theme "Nordic-cursors" 2>/dev/null || true
    
    print_success "GTK theme configured"
    
    # Install Catppuccin GTK theme if not present
    if ! pacman -Qi catppuccin-gtk-theme-mocha &>/dev/null; then
        print_info "Catppuccin GTK theme not installed. Install with: sudo pacman -S catppuccin-gtk-theme-mocha"
    fi
    
    # Install Kvantum theme if not present
    if ! pacman -Qi kvantum-theme-catppuccin-mocha &>/dev/null; then
        print_info "Kvantum theme not installed. Install with: sudo pacman -S kvantum-theme-catppuccin-mocha"
    fi

    # Phase 7: Configure shell
    print_header "Phase 7: Configuring Shell"
    
    # Backup existing zshrc
    if [[ -f "$HOME/.zshrc" ]]; then
        backup_config "$HOME/.zshrc"
    fi
    
    # Check if zsh is installed
    if ! command -v zsh &>/dev/null; then
        print_warning "Zsh is not installed. Install with: sudo pacman -S zsh"
    else
        print_success "Zsh is installed"
        
        # Create zshrc with WehttamSnaps configuration
        if [[ -f "$SCRIPT_DIR/configs/zsh/.zshrc" ]]; then
            cp "$SCRIPT_DIR/configs/zsh/.zshrc" "$HOME/.zshrc"
            print_success "Zsh configuration copied"
        else
            print_warning "Zsh configuration not found in repository"
        fi
    fi
    
    # Check if starship is installed
    if ! command -v starship &>/dev/null; then
        print_warning "Starship is not installed. Install with: sudo pacman -S starship"
    else
        print_success "Starship is installed"
    fi

    # Phase 8: Set permissions
    print_header "Phase 8: Setting Permissions"
    
    # Make scripts executable
    chmod +x "$CONFIG_DIR/scripts/"*
    
    # Set sound file permissions
    sudo chmod 644 /usr/share/wehttamsnaps/sounds/*/*.mp3 2>/dev/null || true
    chmod 644 "$CONFIG_DIR/sounds/"*/*.mp3 2>/dev/null || true
    
    # Set welcome app executable
    chmod +x "$CONFIG_DIR/quickshell-apps/welcome.py" 2>/dev/null || true
    
    print_success "Permissions set"

    # Phase 9: Finalize
    print_header "Phase 9: Finalizing Installation"
    
    # Create VERSION file
    echo "2.0.0" > "$CONFIG_DIR/VERSION"
    echo "$(date +%Y-%m-%d)" >> "$CONFIG_DIR/VERSION"
    
    # Copy logo
    cp "$SCRIPT_DIR/logo.txt" "$CONFIG_DIR/logo.txt"
    
    print_success "Installation complete!"

    # Summary
    echo ""
    print_header "Installation Summary"
    
    cat << EOF
${GREEN}✓${NC} Niri configuration installed
${GREEN}✓${NC} Utility scripts installed to /usr/local/bin
${GREEN}✓${NC} Sound system configured
${GREEN}✓${NC} Theme settings applied
${GREEN}✓${NC} Shell configuration updated

${YELLOW}Next Steps:${NC}
1. Download J.A.R.V.I.S. and iDroid sounds
   - J.A.R.V.I.S.: https://www.101soundboards.com/boards/10155-jarvis-v1-paul-bettany
   - iDroid: https://www.101soundboards.com/boards/10060-idroid-voice
   - Place sounds in: ~/.config/wehttamsnaps/sounds/

2. Install missing packages (if any):
   - Core packages: paru -S --needed - < packages/core.list.txt
   - Gaming packages: paru -S --needed - < packages/gaming.list.txt

3. Configure audio routing:
   - Run: sound-system setup
   - Read: docs/AUDIO-ROUTING.md

4. Configure gaming:
   - Read: docs/GAMING.md

5. Start Niri:
   - From SDDM: Select Niri from session list
   - From TTY: Run 'niri'

6. Test your setup:
   - Run: sound-system test
   - Run: jarvis help
   - Press: Mod+H (keyhints)

${CYAN}Documentation:${NC}
- docs/INSTALL.md - Full installation guide
- docs/QUICKSTART.md - First boot instructions
- docs/GAMING.md - Gaming configuration
- docs/AUDIO-ROUTING.md - Audio setup

${BLUE}Support:${NC}
- GitHub: https://github.com/Crowdrocker/wehttamsnaps-dotfiles
- Twitch: https://twitch.tv/WehttamSnaps
- YouTube: https://youtube.com/@WehttamSnaps

${RED}Note:${NC} Backup files are in: $BACKUP_DIR
EOF

    echo ""
    read -p "Press Enter to exit..."
}

# Run main function
main