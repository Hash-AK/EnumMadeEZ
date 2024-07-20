# EnumMadeEz
This is a WIP script used to enumerate and find system info about a Linux machine. This can be used for basic system info gathering, like : 

- The hostname

- The distro's name & version 

- The Linux Kernel version 

- The ssh IDs file (if existing) in ~/.ssh/ (basically any file caught by regex id* in ~/.ssh)

- The current logged-in user

- The user's groups

- Other user accounts from /etc/passwd (include root)

More coming later. 

# COMPTIBILITY
I tested the script on the following distros ( most of them on official docker containers) :
- Kali Linux 2024.2
- Ubuntu 18.04.6 LTS
- Ubuntu 20.04.6 LTS
- Ubuntu 22.04.4 LTS
- Fedora Linux 40 (Container Image) (hostname didnt work correctly and printed errors)
- CentOS Linux 8
- Arch Linux VERSION_ID=20240714.0.246936 (hostname didnt work)
- Alpine Linux v3.20.1
- Debian GNU/Linux 12 (bookworm)
- openSUSE Leap 15.6 (hostname didnt work)

Some dirstros had problem with printing tput/ansi color with echo so i modified the script to use printf and optionnally ansi colors instead of tput)
And thats it. For the hostname problem im not sure if its because thoose where minimal install (Docker images).


# INSTALLATION
The instalation is pretty simple, install git, git clone the repo then give exec permission to the file, and eecute it! No argument needed

`sudo apt update && sudo apt install git`

`git clone https://github.com/Hash-AK/EnumMadeEZ`

`cd EnumMadeEZ`

`chmod +x EnumMadeEZ.sh`

`./EnumMadeEZ.sh`

