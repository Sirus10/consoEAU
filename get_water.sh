#!/bin/sh

if [  $(find "/home/pi/consoEAU/litres_history.txt" -newermt "9 hours ago") ]; then
    echo "Exit, updated less than 9h ago"

else
	echo "Doing my job"
	date >> /tmp/get_water.sh.log
	cd /home/pi/consoEAU
	FILE="/home/pi/consoEAU/litres.txt"
	HISTORY="/home/pi/consoEAU/litres_history.txt"
	dt=$(date '+%d/%m/%Y %H:%M:%S');
	rm -f $FILE
	/home/pi/consoEAU/radian_trx r
	if test -f "$FILE"; then
		value=`cat $FILE`
		echo "$value"
		curl "http://192.168.1.103:8080/json.htm?type=command&param=udevice&idx=22&svalue=$value"

		echo "$dt;$value" >> $HISTORY
		rm -f $FILE
		cp $HISTORY /mnt/freebox/litres_history.txt
		cp /mnt/freebox/litres_history.txt /mnt/freebox/eau/litres_history.csv
	else
		echo "Compteur d'eau pas de valeur relevée" | mail -s "Compteur d'eau" put@your.email
	fi
fi
