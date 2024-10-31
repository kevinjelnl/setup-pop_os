# Configure machine after reinstall
(aims to... ) Makes reinstalling Pop!_os a breeze. Uses Ansible to configure the machine after a fresh install. 

## Features
- Manages apt packages (install, remove, update)
- Manages GNOME extensions (install, remove)
- Configures zsh with oh-my-zsh
- Installs fonts
- Configures dotfiles from https://github.com/kevinjelnl/dotfiles


## DISCLAIMER
Use at your own risk. This is a personal project configured to my needs. It might not work for you. Be careful with the roles and tasks that are executed, items are being downloaded from external sources.


## How to use
Clone the repo, cd into the dir, run the makefile
```
git clone https://github.com/kevinjelnl/setup-pop_os.git 
cd ./setup-pop_os
git submodule init # to install the submodule(s)
make setup_machine
```
Note: a reboot / relog will be required for different settings to take effect.

### Run a single role
To run a single role, use the following command:
```
# Run a single role by using the tag value
make run_playbook tag=manage_packages
```
or any of defined roles in: ./ansible/playbook.yml

## How to configure
The configuration is done in the `./ansible/roles` directory. Each role has its own directory with a `main.yml` file. The `main.yml` file contains the tasks that are executed. Variables are stored within each role in the `vars` directory.

The `./ansible/playbook.yml` file is the main playbook that is executed. It contains the internal structure of the playbook and the roles that are executed. Within this file you can override variables or extend the playbook by adding new roles.


## Under the hood
https://system76.com/pop (for the OS)
https://linuxconfig.org/introduction-to-the-dconf-configuration-system (for the dconf)
https://github.com/essembeh/gnome-extensions-cli (for the gnome extensions)
