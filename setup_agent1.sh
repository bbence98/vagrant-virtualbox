#! /bin/bash

snmpusm -u bootstrap -l authPriv -a MD5 -x DES -A temp_password -X temp_password 192.168.10.198 create agent1 bootstrap
snmpusm -u agent1 -l authPriv -a MD5 -x DES -A temp_password -X temp_password 192.168.10.198 passwd temp_password agent1_pass
