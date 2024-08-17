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

# COMPATIBILITY
I tested the script on the following distros ( most of them on the (officials) docker containers) :
- Kali Linux 2024.2 (that one was the official Kali .ova virtual machine)
- Ubuntu 18.04.6 LTS
- Ubuntu 20.04.6 LTS
- Ubuntu 22.04.4 LTS
- Fedora Linux 40 (Container Image)
- CentOS Linux 8
- Arch Linux VERSION_ID=20240714.0.246936
- Alpine Linux v3.20.1
- Debian GNU/Linux 12 (bookworm)
- openSUSE Leap 15.6

Some distros had problem with printing tput/ansi color with echo so i modified the script to use printf and optionnally ansi colors instead of tput). For the hostname there was a problem too, im not sure if it was caused by the fact that i tried it on minimal install (Docker images), im now using cat /proc/sys/kernel/hostname if hostname throw errors.


# INSTALLATION
The instalation is pretty simple, install git, git clone the repo then give exec permission to the file, and execute it! No argument needed 

`sudo apt update && sudo apt install git`

`git clone https://github.com/Hash-AK/EnumMadeEZ`

`cd EnumMadeEZ`

`chmod +x EnumMadeEZ.sh`

`./EnumMadeEZ.sh`

