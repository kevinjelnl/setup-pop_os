#!/usr/bin/bash

main_dir="$PWD/ansible"
venv_dir="$HOME/.virtualenvs/ansible/bin"
tagname=$1

install_roles() {
    if [ -f "$main_dir/requirements.yml" ]; then
        eval "$venv_dir/ansible-galaxy install -r $main_dir/requirements.yml"
    fi
    eval "$venv_dir/ansible-galaxy collection install community.general"

}

run_role() {
    eval "$venv_dir/ansible-playbook -i ./ansible/inventory.yml ./ansible/playbook.yml --ask-become-pass $1"
}

# install the required roles
install_roles

if [ -z "$tagname" ]; then
    echo "Running the complete installation playbook"
    run_role ""
else
    echo "Running a single role, with the role tag: $tagname"
    run_role "--tags $tagname"
fi
