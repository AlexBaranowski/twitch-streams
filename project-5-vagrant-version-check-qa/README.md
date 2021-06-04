# Simple Vagrant version check script

## How to use:
Examples:

```
./vagrant_version_check.py -p libvirt -p virtualbox eurolinux-vagrant/eurolinux-8
Found provider libvirt for box eurolinux-vagrant/eurolinux-8
Found provider virtualbox for box eurolinux-vagrant/eurolinux-8
All providers for given boxes were found!
```

```
python vagrant_version_check.py -p docker -p virtualbox eurolinux-vagrant/eurolinux-8
Found provider virtualbox for box eurolinux-vagrant/eurolinux-8
There is problem with following boxes: eurolinux-vagrant/eurolinux-8
```

## Problem

Sometimes EuroLinux Vagrant build process fails. Currently, the build steps are rerun
few times, but if there is some error on the builder, the process can be not completed. Each pipeline is independent and parametrized with a provider, so there may be a libvirt box but not a virtualbox etc.

Examples:

https://app.vagrantup.com/eurolinux-vagrant/boxes/centos-7 - v7.8.1 has only VirtualBox
https://app.vagrantup.com/eurolinux-vagrant/boxes/centos-8 - v8.1.2 has only VirtualBox

## Solution

Check if **the newest box** has all expected providers (currently Libvirt and VirtualBox).

## How to make it

### The simplest approach

Use `jq` to manipulate JSON - the problem is that it will be **hard to maintain** one-liner.

### Python solution

With `request` and `json` module, it's **should** be actually really simple.

## End of the project

This script landed in the EuroLinux Continuous Delivery pipeline for Vagrant boxes.

## Trivia

This README.md is probably my first "real" commit made with GitHub editor.
