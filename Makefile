PYTHON := python3
VENV := .venv
BIN := $(VENV)/bin

ifeq ($(OS), Windows_NT)
  BIN = $(VENV)/Scripts
  PYTHON = python
endif

default: init

init: venv install copyexample
	$(BIN)/ansible-vault encrypt "vault.yml"

copyexample:
	$(PYTHON) ./console.py copy -s "vault.example.yml" -d "vault.yml"

venv:
	$(PYTHON) -m venv $(VENV)

install:
	$(BIN)/$(PYTHON) -m pip install -r requirements.txt