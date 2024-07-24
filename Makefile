-include .env

venv:
	/usr/bin/python -m venv .venv

activate:
	. ./.venv/bin/activate

install:
	pip install -r requirements.txt

dev:
	ansible-playbook playbooks/$(TARGET_PLAYBOOK) \
		-J \
		-i $(TARGET_SERVER_IP), \
		-e @vault.yml \
		-e "ansible_ssh_user=$(TARGET_SSH_USER) ansible_ssh_pass=$(TARGET_SSH_PASS) ansible_become_pass=$(TARGET_SSH_PASS)"