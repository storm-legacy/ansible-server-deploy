# Ansible deployment suite for servers
This repository consists of roles nad playbooks for general deployment of linux servers.
Roles right now are mostly dedicated for Ubuntu machines, but there are plans for RHEL (AlmaLinux) deployments

## Available roles
- `common` - general first server configuration
- `docker` - install Docker Engine and apply tweaks
- `ufw` - Install and configure UFW firewall
- `zabbix_agent` - install and configure Zabbix Agent 2

## Additional informations
### Ansible Vault
Password for vault.example.yml is `password`;

