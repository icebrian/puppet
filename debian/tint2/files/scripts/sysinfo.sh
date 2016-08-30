#!/bin/bash 
#LOCATION:/usr/local/bin/sysinfo.sh 
#VERSION: 0.2 

VAR1=$(/sbin/ifconfig | grep "inet addr" | grep -v "127.0.0.1" | awk {'print $2'}) 
VAR2=$(/sbin/ifconfig | grep "inet addr" | grep -v "127.0.0.1" | awk {'print $4'}) 
MAC=$(/sbin/ifconfig | grep HWaddr | awk {'print $5'}) 
HOST=$(hostname)  
notify-send $VAR1' '$VAR2 'MAC Address: '$MAC'\nHostname: '$HOST'\nSmartdesk RPi '$SDESKPIV
