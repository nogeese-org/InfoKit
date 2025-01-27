#!/bin/bash

# Installer for InfoStack from raw.githubusercontent.com

GITHUB_RAW_REPO="https://raw.githubusercontent.com/leon8326-nogeese/InfoKit/main"
INFOSTACK_DIR="infostack"
SYSTEM_INSTALL_DIR="/usr/infostack"
SYSTEM_MASTER_DIR="$SYSTEM_INSTALL_DIR/master"
SYSTEM_BIN="/usr/bin/infostack"
USER_INSTALL_DIR="$HOME/.infostack"
USER_MASTER_DIR="$USER_INSTALL_DIR/master"
USER_BIN="$HOME/.infostack/bin/uinfostack"

download_and_install() {
    local install_type=$1
    local install_dir=$2
    local master_dir=$3
    local bin_file=$4

    echo "Installing InfoStack ($install_type)..."

    # Create required directories
    mkdir -p "$install_dir/bin"
    mkdir -p "$install_dir/program/data"
    mkdir -p "$install_dir/pkg"
    mkdir -p "$master_dir"

    # Download main script
    curl -sSL "$GITHUB_RAW_REPO/$INFOSTACK_DIR/bin/$bin_file" -o "$install_dir/bin/$bin_file"
    chmod +x "$install_dir/bin/$bin_file"

    # Initialize the master directory
    curl -sSL "$GITHUB_RAW_REPO/$INFOSTACK_DIR/master/infostack.sh" -o "$master_dir/infostack.sh"
    echo "$GITHUB_RAW_REPO" > "$master_dir/source.txt"
    echo "1.0.0" > "$master_dir/version.txt"

    # For system-wide installation, move the binary to /usr/bin
    if [[ "$install_type" == "system-wide" ]]; then
        sudo mv "$install_dir/bin/$bin_file" "$SYSTEM_BIN"
        sudo chmod +x "$SYSTEM_BIN"
    fi

    echo "InfoStack ($install_type) installed successfully!"
}

show_usage() {
    echo "Usage: $0 [--system | --user]"
    echo "Options:"
    echo "  --system   Install system-wide InfoStack (requires sudo)."
    echo "  --user     Install user-wide InfoStack."
}

if [[ "$1" == "--system" ]]; then
    if [[ "$EUID" -ne 0 ]]; then
        echo "System-wide installation requires sudo privileges."
        exit 1
    fi
    download_and_install "system-wide" "$SYSTEM_INSTALL_DIR" "$SYSTEM_MASTER_DIR" "infostack"
elif [[ "$1" == "--user" ]]; then
    download_and_install "user-wide" "$USER_INSTALL_DIR" "$USER_MASTER_DIR" "uinfostack"
else
    show_usage
fi
