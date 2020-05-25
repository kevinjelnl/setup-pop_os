setup_machine:
	/usr/bin/bash ./scripts/1-after_clean_install.sh
	/usr/bin/bash ./scripts/2-prepare_ansible.sh
	/usr/bin/bash ./scripts/3-run_ansible.sh

packages:
	/usr/bin/bash ./scripts/3-run_ansible.sh

dconf-settings:
	/usr/bin/bash ./scripts/3-run_ansible.sh dconf-settings
