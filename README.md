# Ansible deployment suite for servers
This repository consists of roles nad playbooks for general deployment of linux servers.
Roles right now are mostly dedicated for Ubuntu machines, but there are plans for RHEL (AlmaLinux) deployments

## Dependencies
- Python
- Makefile

## Instruction
1. Initialize project with Makefile. In the process choose password for new `vault.yml` file:
    ```bash
    make init
    ```

2. Adjust valules in `.env`

3. Start testing with:
    ```bash
    make dev
    ```


## Available roles
- `common` - general first server configuration
- `maintenance` - used for patching multiple devices
- `docker` - install Docker Engine and apply tweaks
- `ufw` - Install and configure UFW firewall
- `zabbix_agent` - install and configure Zabbix Agent 2

