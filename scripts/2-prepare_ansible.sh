#!/usr/bin/bash
venv_dir="$HOME/.virtualenvs/ansible/bin"
install_venv() {
   sudo apt install python3-pip -y
   sudo apt-get install python3-venv -y
   sudo apt-get install aptitude -y
   sudo apt-get install python-apt-common -y
   sudo apt-get install pylint -y
   sudo apt-get install python3-autopep8 -y
}

make_venv_dir() {
    mkdir -p $HOME/.virtualenvs
    # create the virtual environment
    python3 -m venv --system-site-packages $HOME/.virtualenvs/ansible 
}

install_pip_packages() {
    eval "$venv_dir/pip3 install ansible"
    eval "$venv_dir/pip3 install docker"
    eval "$venv_dir/pip3 install docker-compose"
}

echo "prepare ansible..."
install_venv
make_venv_dir
# this should be requirements.txt
install_pip_packages
echo "done..."
