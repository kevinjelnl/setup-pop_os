#! usr/bin/shell
eval sudo add-apt-repository ppa:nm-l2tp/network-manager-l2tp
eval sudo apt-get update
eval sudo apt-get install network-manager-l2tp  network-manager-l2tp-gnome
eval sudo apt install network-manager-l2tp
eval sudo systemctl stop xl2tpd.service
eval sudo systemctl disable xl2tpd.service

#disable all except PAP
