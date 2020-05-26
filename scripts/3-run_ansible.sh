#!/usr/bin/bash

main_dir="$PWD/ansible"
venv_dir="$HOME/.virtualenvs/ansible/bin"

run_playbook() {
    source "$venv_dir/activate"
    eval "ansible-galaxy install --roles-path $main_dir/roles jaredhocutt.gnome_extensions"
    eval "ansible-playbook $main_dir/playbook.yml -e ansible_python_interpreter=$venv_dir/python --ask-become-pass"
}

echo "running ansible..."
run_playbook
