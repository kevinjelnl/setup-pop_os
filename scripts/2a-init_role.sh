#!/usr/bin/bash

main_dir="$HOME/fresh_pop/ansible" 

init_role() {
    source $HOME/.virtualenvs/ansible/bin/activate
    mkdir -p "$main_dir/roles"
    
    ansible-galaxy init "$main_dir/roles/flatpak" 
}

init_role
