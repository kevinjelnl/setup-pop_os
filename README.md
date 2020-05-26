# Configure machine after reinstall

(aims to... ) Makes reinstalling a breeze... 

## WIP

dconf-settings atm is just a dump of 
``` code 
$ dconf watch /
```
which could use a refactor. But for now it works.

```
# run a single role, i.e. apt-packages:

$ ansible-playbook ansible/playbook.yml -e ansible_python_interpreter=/home/kevinjel/.virtualenvs/ansible/bin/python --tags apt-packages --ask-become-pass

```
uses an ansible role for the gnome_extensions:
https://github.com/jaredhocutt/ansible-gnome-extensions
TODO: add this into a bash script


## NOTE

Use this at your own risk, this uses packages from others and they will be installed automatically!
