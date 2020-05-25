# Simple Vagrant version check script

## Problem

Sometimes EuroLinux Vagrant build process fails. Currently the build steps are rerun
few times, but if there is some error on builder the process can be not completed.

Examples:

https://app.vagrantup.com/eurolinux-vagrant/boxes/centos-7 - v7.8.1 has only VirtualBox
https://app.vagrantup.com/eurolinux-vagrant/boxes/centos-8 - v8.1.2 has only VirtualBox

## Solution

Check if **the newest box** has all expected providers (currently Libvirt and VirtualBox).

## How to make it

### The simplest approach

Use `jq` that allows to manipulate json - the problem is that it will be **hard to maintain** one-liner.

### Python solution

With `request` and `json` module it's **should** be actually really simple.
