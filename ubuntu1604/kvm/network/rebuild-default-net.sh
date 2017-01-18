#!/bin/bash

sudo virsh net-undefine default
sudo virsh net-define ./default.xml 
sudo virsh net-start default
sudo virsh net-autostart default



