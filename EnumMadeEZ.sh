#!/bin/bash


RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
NC=$(tput sgr0)  # Reset color
mkdir -p /tmp/EnumMadeEz/
echo "${GREEN}"
echo " _____                     ___  ___          _          _______ ______";
echo "|  ___|                    |  \/  |         | |        / /  ___|___  /";
echo "| |__ _ __  _   _ _ __ ___ | .  . | __ _  __| | ___   / /| |__    / / ";
echo "|  __| '_ \| | | | '_ \` _ \| |\/| |/ _\` |/ _\` |/ _ \ / / |  __|  / /  ";
echo "| |__| | | | |_| | | | | | | |  | | (_| | (_| |  __// /  | |___./ /___";
echo "\____/_| |_|\__,_|_| |_| |_\_|  |_/\__,_|\__,_|\___/_/   \____/\_____/";
echo "                                                                      ";
echo "                                                                      ";
echo "${GREEN}*** EnumMadeEz, a tool devlopped by Hash-AK. ***${NC}"
echo ""
echo "${RED}[*] Hostname${NC}"
echo "${GREEN}$(hostname)${NC}"
echo "${RED}[*] Release [shortened] ${NC}"
echo "${GREEN}$(cat /etc/*-release | grep NAME) $(cat /etc/*-release | grep VERSION_ID)${NC}"
cat /etc/*-release > /tmp/EnumMadeEz/release
echo -n "${RED}Show full release? [y/n]: ${NC}"
read -r ans
ans=$(echo "$ans" | tr '[:upper:]' '[:lower:]') 
if [ "$ans" = "y" ]; then
  echo "${GREEN}$(cat /tmp/EnumMadeEz/release)${NC}"
elif [ "$ans" = "n" ]; then
  echo "${RED}ok then. You can alway access it in /tmp/EnumMadeEz/release${NC}"
fi
echo "${RED}"
echo "*********************"
echo ""
echo "${RED}[*] Linux Kernel informations : ${NC}"
echo "${GREEN}$(uname -a) ${NC}"
echo ""
echo "${RED}*********************"
echo ""
echo "${RED}[*] Checking for SSH keys...${NC}"
if [ "$(ls -la ~/.ssh/ 2>/dev/null)" ]; then
  echo "${GREEN}[*].ssh directory found...${NC}"
  echo "${GREEN}[*]Searching for ID* Files in .ssh/ ..."
  if [ "$(ls -la ~/.ssh/id* 2>/dev/null)" ]; then
    echo "${GREEN}[*]Id* files found in the .ssh directory! Here are they :${NC}"
    echo "${BLUE}"
    ls ~/.ssh/id*
    echo "${NC}" 
    cat ~/.ssh/id* > /tmp/EnumMadeEz/SSHKeys.txt
    echo "${GREEN}All id* files copyed to /tmp/EnumMadeEz/SSHKeys.txt${NC}"
    echo "${GREEN}$(grep -o "BEGIN" /tmp/EnumMadeEz/SSHKeys.txt | wc -l) BEGIN word occurence in the keys...${NC}"
  else
    echo "${GREEN}[*]Sorry, no id* files found in the .ssh directory${NC}"
  fi
  
else 
  echo "${GREEN}[*]Sorry, no files in the  ~/.ssh/ or the directory isnt existing${NC}"
fi
echo ""
echo "${RED}*********************"
echo ""
echo "${RED}[*] Curent user's (${GREEN}$(whoami)${RED}) id : ${NC}"
echo "${GREEN}$(id) ${NC}"
echo ""
echo "${RED}[*]Users account in /etc/passwd (saving them in /tmp/EnumMadeEz/users.txt) :${NC}"
echo "${GREEN}"
awk -F: '($3 >= 1000 && $1 != "nobody") || $1 == "root" {print $1}' /etc/passwd > /tmp/EnumMadeEz/users.txt
cat /tmp/EnumMadeEz/users.txt
echo "${NC}"
echo -n "${RED}Do you want to auto clean? CAUTION: If you do so, all info in /tmp/EnumMadeEz/ will get deleted. [y/n]: ${NC}"
read -r ans
ans=$(echo "$ans" | tr '[:upper:]' '[:lower:]') 
if [ "$ans" = "y" ]; then
  echo ""
  echo "${RED}[*]Deleting /tmp/EnumMadeEz/...${NC}"
  echo "${GREEN}$(rm -r /tmp/EnumMadeEz)"
  echo "${GREEN}Done!${NC}"
elif [ "$ans" = "n" ]; then
  echo "${RED}ok conserving /tmp/EnumMadeEz${NC}"
fi

