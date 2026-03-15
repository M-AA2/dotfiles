#!/bin/bash

set -e

DOTFILES_DIR="$HOME/dotfiles"
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

detect_pkg_manager() {
    if command -v apt &>/dev/null; then
        echo "apt"
    elif command -v dnf &>/dev/null; then
        echo "dnf"
    elif command -v pacman &>/dev/null; then
        echo "pacman"
    elif command -v zypper &>/dev/null; then
        echo "zypper"
    elif command -v brew &>/dev/null; then
        echo "brew"
    else
        echo "unknown"
    fi
}

install_pkg() {
    local pkg="$1"
    case $(detect_pkg_manager) in
        apt) sudo apt install -y "$pkg" ;;
        dnf) sudo dnf install -y "$pkg" ;;
        pacman) sudo pacman -S --noconfirm "$pkg" ;;
        zypper) sudo zypper install -y "$pkg" ;;
        brew) brew install "$pkg" ;;
        *) echo "Cannot install $pkg: unknown package manager" && exit 1 ;;
    esac
}

echo "=== Detected package manager: $(detect_pkg_manager) ==="

echo "=== Installing required packages ==="
for pkg in zsh fzf stow curl wget git; do
    if ! command -v "$pkg" &>/dev/null; then
        install_pkg "$pkg"
    else
        echo "$pkg already installed"
    fi
done

echo "=== Installing Oh My Zsh ==="
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh already installed"
fi

echo "=== Installing Oh My Posh ==="
if ! command -v oh-my-posh &>/dev/null; then
    curl -s https://ohmyposh.dev/install.sh | bash -s
else
    echo "Oh My Posh already installed"
fi

echo "=== Installing Zsh plugins ==="
mkdir -p "$ZSH_CUSTOM/plugins"
[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] && \
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
[ ! -d "$ZSH_CUSTOM/plugins/fzf-tab" ] && \
    git clone https://github.com/Aloxaf/fzf-tab "$ZSH_CUSTOM/plugins/fzf-tab"

echo "=== Stowing dotfiles ==="
cd "$DOTFILES_DIR"
stow zsh nvim bash vim ghostty

echo "=== Setting Zsh as default shell ==="
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s "$(which zsh)"
fi

echo "=== Setup complete! ==="
echo "Restart terminal or run: exec zsh"
