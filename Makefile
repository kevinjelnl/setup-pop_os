.DEFAULT_GOAL := setup

ANSIBLE_DIR := ansible
ANSIBLE := $(HOME)/.virtualenvs/ansible/bin/ansible-playbook
INVENTORY := $(ANSIBLE_DIR)/inventory.yml
PLAYBOOK := $(ANSIBLE_DIR)/playbook.yml

.PHONY: setup remove bootstrap check-ansible

check-ansible:
	@test -x "$(ANSIBLE)" || { \
		echo "Ansible not found at $(ANSIBLE)"; \
		echo "Run scripts/1-after_clean_install.sh first."; \
		exit 1; \
	}

setup: check-ansible
	$(ANSIBLE) -i $(INVENTORY) $(PLAYBOOK) --ask-become-pass

remove: check-ansible
	$(ANSIBLE) -i $(INVENTORY) $(PLAYBOOK) --ask-become-pass --tags packages

bootstrap:
	YADM_INSTALL_SYSTEM_PACKAGES=1 yadm bootstrap
