-include .env.example
-include .env

PYTHON := python3
VENV := .venv
BIN := $(VENV)/bin

ifeq ($(OS), Windows_NT)
  BIN = $(VENV)/Scripts
  PYTHON = python
endif

init: venv install
	$(PYTHON) ./console.py copy -s ".env.example" -d ".env"
	$(PYTHON) ./console.py copy -s "vault.example.yml" -d "vault.yml"
	$(BIN)/ansible-vault encrypt "vault.yml"

venv:
	$(PYTHON) -m venv $(VENV)

install:
	$(BIN)/$(PYTHON) -m pip install -r requirements.txt

dev:
	$(BIN)/ansible-playbook $(TARGET_PLAYBOOK) \
		-J \
		-i $(TARGET_SERVER_IP), \
		-e @vault.yml \
		-e "ansible_ssh_user=$(TARGET_SSH_USER) ansible_ssh_pass=$(TARGET_SSH_PASS) ansible_become_pass=$(TARGET_SSH_PASS)"

dev2:
	$(BIN)/ansible-playbook $(TARGET_PLAYBOOK) \
		-J \
		-i $(TARGET_SERVER_IP), \
		-e @vault.yml \
		-e "ansible_ssh_user=$(TARGET_SSH_USER) ansible_become_pass=$(TARGET_SSH_PASS)"