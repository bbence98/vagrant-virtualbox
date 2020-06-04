#!/bin/bash
# Purpose - Script to add a user to Linux system including passsword
# Author - Vivek Gite <www.cyberciti.biz> under GPL v2.0+
# ------------------------------------------------------------------
# Am i Root user?
if [ $(id -u) -eq 0 ]; then
	username="admin"
	password="admin"
	egrep "^$username" /etc/passwd >/dev/null
	if [ $? -eq 0 ]; then
		echo "$username exists!"
	else
		pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
		useradd -m -p "$pass" "$username"
		[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
	fi
else
	echo "Only root may add a user to the system."
fi

## SSH

ssh_location="/home/admin/.ssh"

if [ ! -d $ssh_location ]; then
    mkdir $ssh_location
    cat /vagrant/*.pub >> /home/admin/.ssh/authorized_keys
fi

## SNMP

sudo apt-get -y update
sudo apt-get install -y snmpd nano

sudo cp /vagrant/snmpd.conf /etc/snmp/snmpd.conf

