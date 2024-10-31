#!/usr/bin/bash

venv_location="$HOME/.virtualenvs"
ansible_location="$venv_location/ansible"

sys_packages=(
    "update"
    "upgrade"
    "autoremove"
    "autoclean"
)

apt_packages=(
    "python3-pip"
    "python3-venv"
    "aptitude"
    "python-apt-common"
    "pylint"
    "python3-autopep8"
)

check_exit_status() {
    if [ $? -ne 0 ]; then
        echo "[ERROR] Could not complete the last command: $1"
        read -p "The last command exited with an error. Continue? (yes/no) " continue
        if [[ "${continue,,}" == n* ]]; then
            echo "Stopping the script..."
            exit 1
        fi
    fi
}

install_dependencies() {
    # get latest value from the given parameter 
    command="sudo apt-get"
    if [ "$1" = "install" ]; then
        command="$command install"
        shift 1
    fi
    # loop trough the packages and install these
    for i in $@;
    do
        $command $i -y; check_exit_status "$command $i"
    done
}

# install the dependencies
install_dependencies "${sys_packages[@]}"
install_dependencies "install" "${apt_packages[@]}"

# install ansible via the just installed pip3
mkdir -p $venv_location
python3 -m venv --system-site-packages $ansible_location
eval "$ansible_location/bin/pip3 install ansible"
