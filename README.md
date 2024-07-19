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

****INSTALLATION****
The instalation is pretty simple, install git, git clone the repo then give exec permission to the file, and eecute it! No argument needed

`sudo apt update && sudo apt install git`

`git clone https://github.com/Hash-AK/EnumMadeEZ`

`cd EnumMadeEZ`

`chmod +x EnumMadeEZ.sh`

`./EnumMadeEZ.sh`

