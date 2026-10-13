#!/usr/bin/env bash

set -Eeuo pipefail

readonly venv_location="$HOME/.virtualenvs"
readonly ansible_location="$venv_location/ansible"

if [[ $EUID -eq 0 ]]; then
    echo "Run this script as your normal user, not root." >&2
    exit 1
fi

sudo -v

# Keep this script limited to prerequisites for Ansible. Package and desktop
# configuration belongs in the Ansible playbook (or yadm for user tools).
sudo DEBIAN_FRONTEND=noninteractive apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install \
    python3-pip \
    python3-venv \
    python-apt-common

mkdir -p "$venv_location"
python3 -m venv --system-site-packages "$ansible_location"
"$ansible_location/bin/python" -m pip install --upgrade ansible

echo "Ansible is ready: $ansible_location/bin/ansible-playbook"
