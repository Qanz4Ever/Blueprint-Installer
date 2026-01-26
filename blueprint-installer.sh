#!/bin/bash
set -e

# All Code Created By Mfsavana
# Don't Use And Steal Code
# License Apache License 2.0
# Credit Mfsavana © 2026

# ================== CONFIG ==================
export PTERODACTYL_DIRECTORY=/var/www/pterodactyl
REQUIRED_NODE=22

# ================== COLORS ==================
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
MAGENTA='\033[1;35m'
WHITE='\033[1;37m'
RESET='\033[0m'

# ================== UI ELEMENTS ==================
divider () {
    echo -e "${MAGENTA}────── ⋆⋅☆⋅⋆ ──────${RESET}"
}

box () {
    echo -e "${CYAN}╔══════════════════════════════════════╗${RESET}"
    echo -e "${CYAN}║${RESET} ${WHITE}$1${RESET}"
    echo -e "${CYAN}╚══════════════════════════════════════╝${RESET}"
}

delay () {
    sleep 1.3
}

print_step () {
    clear
    divider
    box "$1"
    divider
    delay
}

print_done () {
    echo -e "\n${GREEN}✔ $1${RESET}"
    delay
}

print_skip () {
    echo -e "\n${YELLOW}➜ SKIP: $1${RESET}"
    delay
}

# ================== INTRO ==================
clear
divider
box "Blueprint Installer"
echo -e "${CYAN} Created by ${WHITE}Mfsavana${RESET}"
echo -e "${BLUE} Clean • Automatic • Safe • Modern${RESET}"
divider
sleep 2

# ================== STEP 1 ==================
print_step "INSTALL BASIC TOOLS"
sudo apt install -y curl wget unzip
print_done "curl, wget, unzip ready"

# ================== STEP 2 ==================
print_step "SET PTERODACTYL DIRECTORY"
cd "$PTERODACTYL_DIRECTORY"
print_done "Directory set → $PTERODACTYL_DIRECTORY"

# ================== STEP 3 ==================
print_step "DOWNLOAD BLUEPRINT LATEST RELEASE"
wget "$(curl -s https://api.github.com/repos/BlueprintFramework/framework/releases/latest \
| grep 'browser_download_url' \
| grep 'release.zip' \
| cut -d '"' -f 4)" -O "$PTERODACTYL_DIRECTORY/release.zip"

unzip -o release.zip
print_done "Blueprint extracted"

# ================== STEP 4 ==================
print_step "INSTALL SYSTEM DEPENDENCIES"
sudo apt install -y ca-certificates curl git gnupg unzip wget zip
print_done "System dependencies installed"

# ================== STEP 5 ==================
print_step "CHECK NODE.JS (REQUIRED ≥ $REQUIRED_NODE)"
NEED_NODE=true

if command -v node >/dev/null 2>&1; then
    NODE_MAJOR=$(node -v | sed 's/v//' | cut -d. -f1)
    if [ "$NODE_MAJOR" -ge "$REQUIRED_NODE" ]; then
        NEED_NODE=false
        print_skip "Node.js $(node -v) already compatible"
    fi
fi

if [ "$NEED_NODE" = true ]; then
    echo -e "${BLUE}Installing Node.js $REQUIRED_NODE.x...${RESET}"
    delay

    sudo apt remove -y nodejs npm || true
    sudo rm -f /etc/apt/sources.list.d/nodesource.list
    sudo rm -f /etc/apt/keyrings/nodesource.gpg
    sudo apt autoremove -y

    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key \
    | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" \
    | sudo tee /etc/apt/sources.list.d/nodesource.list

    sudo apt update
    sudo apt install -y nodejs

    print_done "Node.js installed → $(node -v)"
fi

# ================== STEP 6 ==================
print_step "CHECK YARN"
if command -v yarn >/dev/null 2>&1; then
    print_skip "Yarn already installed"
else
    sudo npm i -g yarn
    print_done "Yarn installed"
fi

# ================== STEP 7 ==================
print_step "INSTALL NODE DEPENDENCIES"
cd "$PTERODACTYL_DIRECTORY"
yarn install
print_done "Node dependencies installed"

# ================== STEP 8 ==================
print_step "SET BLUEPRINT PERMISSIONS"
chmod +x "$PTERODACTYL_DIRECTORY/blueprint.sh"
print_done "Permissions applied"

# ================== STEP 9 ==================
print_step "RUN BLUEPRINT INSTALLER"
yes y | bash "$PTERODACTYL_DIRECTORY/blueprint.sh"
print_done "Blueprint installed successfully"

# ================== FINISH ==================
clear
divider
box "INSTALLATION COMPLETE"
echo -e "${GREEN} Directory : ${WHITE}$PTERODACTYL_DIRECTORY${RESET}"
echo -e "${GREEN} Node      : ${WHITE}$(node -v)${RESET}"
echo -e "${GREEN} NPM       : ${WHITE}$(npm -v)${RESET}"
echo -e "${GREEN} Yarn      : ${WHITE}$(yarn -v)${RESET}"
divider
echo -e "${CYAN} Thank you for using this installer${RESET}"
echo -e "${MAGENTA} Created by Mfsavana${RESET}"
divider
