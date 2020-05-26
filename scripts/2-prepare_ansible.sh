#!/usr/bin/bash
venv_dir="$HOME/.virtualenvs/ansible/bin"
install_venv() {
   sudo apt install python3-pip -y
   sudo apt-get install python3-venv -y
   sudo apt-get install aptitude -y
   sudo apt-get install python-apt-common -y
}

make_venv_dir() {
    mkdir -p $HOME/.virtualenvs
    # create the virtual environment
    python3 -m venv --system-site-packages $HOME/.virtualenvs/ansible 
}

install_ansible() {
    eval "$venv_dir/pip3 install ansible"
}

echo "prepare ansible..."
install_venv
make_venv_dir
install_ansible
echo "done..."
