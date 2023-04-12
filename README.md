# Vagrant Wireguard

A fun project to setup a Wireguard VPN Server running out of Vagrant.  The configuration folder uses rsync for syncronizing the files into the Vagrant VM.

## Required Plugins:
- vagrant-reload: `vagrant plugin install vagrant-reload`


## How to run
1. Do a `vagrant up` to start the wireshard server
2. Portforward the port fromm the router
3. Share the public key which will be generated in the VM.

## Developer:
Fat Dragon - Static Vish
