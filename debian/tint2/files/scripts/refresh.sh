#!/bin/bash 
#LOCATION:/usr/local/bin/refresh.sh 
#VERSION: 0.1

#--- set Shutdown/Reboot buttons
(
xmessage -fn '-urw-nimbus sans l-regular-r-normal--13-0-0-0-p-0-iso8859-1' "De certeza que reiniciar o sistema?" -buttons Reiniciar:20,Desligar:21,Cancelar:22 "" -center -title "Reiniciar?";
case $? in
 20)
 sudo /sbin/reboot;;
 21)
 sudo /sbin/shutdown -hP now;;
#;;
 *)
esac
)&
