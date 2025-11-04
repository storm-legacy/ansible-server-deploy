# Ansible Server Deploy Cookbook
This is my repository with a set of pre-configured roles that set up (mainly) Ubuntu machines from scratch to be production ready (cutting a bit of work). The configuration is highly opinionated and configures things like:
- Firewall (UFW) + KnockD
- Docker + [ufw-docker](https://github.com/chaifeng/ufw-docker)
- Regular antivirus scans (ClamAV)
- Users (including an ansible user for automation)
- Swap file
- Unattended upgrades
- Zabbix (Monitoring) Agent

## Dependencies
The project was initialized with [UV](https://docs.astral.sh/uv/) — “An extremely fast Python package and project manager, written in Rust.” I like working with it.

## Installation
1. Install UV from the [official site](https://docs.astral.sh/uv/getting-started/installation/).

2. Clone the repository
```bash
git clone https://github.com/storm-legacy/ansible-server-deploy.git ansible-deploy
cd ansible-deploy
```

3. Install dependencies with UV (or use pip) and activate the virtual environment
```bash
uv sync --no-dev
. .venv/bin/activate

# or without UV (you need pip and venv modules)
python3 -m venv .venv
. .venv/bin/activate
python3 -m pip install ansible
```

4. Prepare the vault with the configuration — encrypt the file into your custom vault.yml
```bash
cp vault.example.yml vault.yml
ansible-vault encrypt vault.yml
```

5. To edit information stored in the vault, run
```bash
ansible-vault edit vault.yml

# or decrypt first, then edit with the $EDITOR of your choice
ansible-vault decrypt vault.yml
```

## Example usage
To run the playbook against the target machine, run:
```bash
# prepare environment on the remote machine
ansible-playbook -bJK -e @vault.yml -i <target>.<ip>.<address>.<of_ssh_machine>, playbooks/prepare.yml

# configure server
ansible-playbook -bJK -e @vault.yml -i <target>.<ip>.<address>.<of_ssh_machine>, playbooks/install.yml
```

## Key elements

## Vault
This file stores your secrets and must be encrypted to keep those details safe. See the vault.example.yml file for details about specific parameters.

## Roles
This is the secret sauce with all the tasks and configuration. Review them to know exactly what is happening on your target machine.

## Playbooks
These can trigger specific roles or the full setup. Feel free to comment out the roles that don’t concern you.