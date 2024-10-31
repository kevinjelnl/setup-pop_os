setup_machine:
	/usr/bin/bash ./scripts/1-after_clean_install.sh
	/usr/bin/bash ./scripts/2-run_ansible.sh

run_playbook:
	/usr/bin/bash ./scripts/2-run_ansible.sh $(tag)
