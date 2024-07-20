#!/bin/bash

# Check if tput is available
if command -v tput >/dev/null 2>&1; then
    # Define colors using tput
    RED=$(tput setaf 1)
    GREEN=$(tput setaf 2)
    BLUE=$(tput setaf 4)
    NC=$(tput sgr0)  # Reset color
else
    # Fallback to ANSI escape sequences if tput is not available
    RED='\033[31m'
    GREEN='\033[32m'
    BLUE='\033[34m'
    NC='\033[0m'  # Reset color
fi

# Create directory if it doesn't exist
mkdir -p /tmp/EnumMadeEz/

# Print banner and information with colors using printf
printf "${GREEN}"
printf " _____                     ___  ___          _          _______ ______\n"
printf "|  ___|                    |  \/  |         | |        / /  ___|___  /\n"
printf "| |__ _ __  _   _ _ __ ___ | .  . | __ _  __| | ___   / /| |__    / / \n"
printf "|  __| '_ \| | | | '_ \` _ \| |\/| |/ _\` |/ _\` |/ _ \ / / |  __|  / /  \n"
printf "| |__| | | | |_| | | | | | | |  | | (_| | (_| |  __// /  | |___./ /___\n"
printf "\____/_| |_|\__,_|_| |_| |_\_|  |_/\__,_|\__,_|\___/_/   \____/\_____/ \n"
printf "\n"
printf "\n"
printf "${GREEN}*** EnumMadeEz, a tool developed by Hash-AK. ***${NC}\n"
printf "${GREEN}https://github.com/Hash-AK/EnumMadeEZ${NC}\n\n"

# Print hostname
printf "${RED}[*] Hostname${NC}\n"
printf "${GREEN}$(hostname)${NC}\n"

# Print release information (shortened for brevity)
printf "${RED}[*] Release [shortened] ${NC}\n"
printf "${GREEN}$(grep -E 'NAME|VERSION_ID' /etc/*-release)${NC}\n"
cat /etc/*-release > /tmp/EnumMadeEz/release

# Ask user if they want to show full release info
printf "${RED}Show full release? [y/n]: ${NC}"
read -r ans
ans=$(printf "$ans" | tr '[:upper:]' '[:lower:]') 
if [ "$ans" = "y" ]; then
    printf "${GREEN}$(cat /tmp/EnumMadeEz/release)${NC}\n"
elif [ "$ans" = "n" ]; then
    printf "${RED}ok then. You can always access it in /tmp/EnumMadeEz/release${NC}\n"
fi

# Print Linux kernel information
printf "${RED}*********************\n"
printf "${RED}[*] Linux Kernel informations : ${NC}\n"
printf "${GREEN}$(uname -a) ${NC}\n\n"

# Checking for SSH keys
printf "${RED}*********************\n"
printf "${RED}[*] Checking for SSH keys...${NC}\n"
if [ "$(ls -la ~/.ssh/ 2>/dev/null)" ]; then
    printf "${GREEN}[*] .ssh directory found...\n${NC}"
    printf "${GREEN}[*] Searching for ID* Files in .ssh/ ...\n${NC}"
    if [ "$(ls -la ~/.ssh/id* 2>/dev/null)" ]; then
        printf "${GREEN}[*] Id* files found in the .ssh directory! Here they are :\n${NC}"
        printf "${BLUE}"
        ls ~/.ssh/id*
        printf "${NC}\n"
        cat ~/.ssh/id* > /tmp/EnumMadeEz/SSHKeys.txt
        printf "${GREEN}All id* files copied to /tmp/EnumMadeEz/SSHKeys.txt\n${NC}"
        printf "${GREEN}$(grep -o "BEGIN" /tmp/EnumMadeEz/SSHKeys.txt | wc -l) BEGIN word occurrence in the keys...\n${NC}"
    else
        printf "${GREEN}[*] Sorry, no id* files found in the .ssh directory\n${NC}"
    fi
else 
    printf "${GREEN}[*] Sorry, no files in the ~/.ssh/ or the directory isn't existing\n${NC}"
fi

# Print current user's ID and user accounts in /etc/passwd
printf "\n${RED}*********************\n"
printf "${RED}[*] Current user's ($(whoami)) id : ${NC}\n"
printf "${GREEN}$(id) ${NC}\n\n"

printf "${RED}[*] Users accounts in /etc/passwd (saved in /tmp/EnumMadeEz/users.txt) :\n${NC}"
printf "${GREEN}"
awk -F: '($3 >= 1000 && $1 != "nobody") || $1 == "root" {print $1}' /etc/passwd > /tmp/EnumMadeEz/users.txt
cat /tmp/EnumMadeEz/users.txt
printf "${NC}\n"

# Ask if the user wants to auto-clean /tmp/EnumMadeEz
printf "${RED}Do you want to auto clean? CAUTION: If you do so, all info in /tmp/EnumMadeEz/ will be deleted. [y/n]: ${NC}"
read -r ans
ans=$(printf "$ans" | tr '[:upper:]' '[:lower:]') 
if [ "$ans" = "y" ]; then
    printf "\n${RED}[*] Deleting /tmp/EnumMadeEz/...${NC}\n"
    printf "${GREEN}$(rm -r /tmp/EnumMadeEz)${NC}\n"
    printf "${GREEN}Done!\n${NC}"
elif [ "$ans" = "n" ]; then
    printf "${RED}ok conserving /tmp/EnumMadeEz${NC}\n"
fi