#!/bin/sh
#Example Router IP : 192.168.1.1
#set ASUS SNMP Option enable
while true
# for interface in `iw dev | grep Interface | cut -f 2 -s -d" "`
  all=""
  do
        echo "" /var/lib/misc/presence.wifi
        echo Scan Devices Addresses...
        # for each interface, get mac addresses of connected stations/clients
        # "iso.3.6.1.2.1.4.22.1.3.8" for IP Address option
        all=`snmpwalk -Oa -c public -v 2c 192.168.1.1 iso.3.6.1.2.1.4.22.1.3.8`
        #echo "$all"
        echo Scan Completed...
        echo "$all" > /var/lib/misc/presence.wifi
        if grep -wc "IpAddress" /var/lib/misc/presence.wifi
        then
                echo Router status - normal
        else
                echo Router status - abnormal
                echo Reboot ASUS RT-AC87U...
                sshpass -p'YOUR_PASSWORD' ssh 'YOUR_ID'@192.168.1.1 -p22 -oStrictHostK$
                sleep 120
        fi

        sleep 60
  done
