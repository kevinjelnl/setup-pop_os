#!/usr/bin/bash

check_exit_status() {

    if [ $? -eq 0 ]
    then
        echo
        echo "Success"
        echo
    else
        echo
        echo "[ERROR] Process Failed!"
        echo
		
        read -p "The last command exited with an error. Exit script? (yes/no) " answer

        if [ "$answer" == "yes" ]
        then
            exit 1
        fi
    fi
}

update() {

    sudo apt-get update;
    check_exit_status

    sudo apt-get upgrade -y;
    check_exit_status

    sudo apt-get dist-upgrade -y;
    check_exit_status
}

housekeeping() {

    sudo apt-get autoremove -y;
    check_exit_status

    sudo apt-get autoclean -y;
    check_exit_status
}

echo "running updates..."
update
housekeeping
echo "done... updating"
