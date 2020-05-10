# Installing and config neovim on EL(CentOS){7,8} with snap

## Requirements

- Vagrant
- Ansible

## Setting up on VM with Vagrant

- `vagrant up`
- `vagrant up --provision` - rerun Ansible
- `vagrant ssh el7` - ssh into el7 machine
- `vagrant ssh el8` - ssh into el8 machine
- `vagrant destroy -f ` - destroy machines

## Running on local machine

Change playbook.yml - change hosts to localhost and add become parameter for play.

## NOTES

1. Run `:PlugInstall` to install plugins.
2. You compelete me requires running `install.sh`
