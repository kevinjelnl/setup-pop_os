#!/usr/bin/bash

main_dir="$HOME/fresh_pop/ansible" 
venv_dir="$HOME/.virtualenvs/ansible/bin"

run_playbook() {
    source "$venv_dir/activate"
    ansible-playbook "$main_dir"/playbook.yml -e "ansible_python_interpreter=$venv_dir/python" --ask-become-pass
}

run_playbook_with_tag() {
    source "$venv_dir/activate"
    ansible-playbook "$main_dir"/playbook.yml -e "ansible_python_interpreter=$venv_dir/python" --tags "dconf-settings"
}

echo "running ansible..."
if [ $# -eq 0 ]
  then
    run_playbook
  else
    run_playbook_with_tag
fi
