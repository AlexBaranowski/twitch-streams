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

You can also use the following command on original playbook

```
ansible-playbook playbook.yml -b -i 127.0.0.0.1, --connection=local --extra-vars "target_user=$USER"
```

## NOTES

1. Run `:PlugInstall` to install plugins.
2. You complete me requires running `install.sh --go-completer`
    ```
    cd ~/.config/share/nvim/plugged/youcompleteme
    install.sh --go-completer
    ```
