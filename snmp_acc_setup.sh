# agent1
echo "Agent1:";
snmpusm -u bootstrap -l authPriv -a MD5 -x DES -A temp_password -X temp_password 192.168.10.198 create manager bootstrap;
snmpusm -u manager -l authPriv -a MD5 -x DES -A temp_password -X temp_password 192.168.10.198 passwd temp_password new_password

# agent2
echo "Agent2:";
snmpusm -u bootstrap -l authPriv -a MD5 -x DES -A temp_password -X temp_password 192.168.10.199 create manager bootstrap;
snmpusm -u manager -l authPriv -a MD5 -x DES -A temp_password -X temp_password 192.168.10.199 passwd temp_password new_password

# verify accounts
echo "Account verifications:"
snmpget 192.168.10.198 sysContact.0
snmpget 192.168.10.199 sysContact.0