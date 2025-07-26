#!/bin/bash

echo "[*] Installing Subwhisper..."

# Check for root or sudo privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root or use sudo"
    exit 1
fi

# Make sure main script is executable
chmod +x subwhisper

# Create directories
install_dir="/usr/local/share/subwhisper"
mkdir -p "$install_dir/templates"

# Copy files (not move)
cp subwhisper /usr/local/bin/subwhisper
cp templates/index.html.tpl "$install_dir/templates/index.html.tpl"
cp templates/report.txt.tpl "$install_dir/templates/report.txt.tpl"

echo "[+] Installation complete!"
echo "You can now run the tool using: subwhisper"
