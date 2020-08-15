#!/bin/bash
DATE=$(date +"%d-%m-%y")
TIME=$(date +"%T")
if [ -f /bin/ejecutar/date ];
then
echo "CADUCIDAD AGREADA ANTERIORMENTE, NO SE DEBE MODIFICAR"
echo -e 'DATE=$(date +"%d-%m-%y");
	TIME=$(date +"%T");
	
	echo 'Fecha Instalación : ' $(cat < /bin/ejecutar/dateI) 'Fecha CADUXA : ' $(cat < /bin/ejecutar/date) 
	if cat /bin/ejecutar/date | grep $DATE $TIME  ; then
	echo -e " Aceptado el " $DATE $TIME >> /root/ok.log	
	else
	echo " Analizando... " $DATE $TIME >> /root/time.log
	fi' > /bin/ejecutar/new.sh
else 
echo 'Ingrese la Fecha de Caducidad en Formato : ' $DATE
read -p "› : " cadu
echo $cadu $TIME > /bin/ejecutar/date
echo $DATE $TIME > /bin/ejecutar/dateI
echo "* * * * * root /bin/ejecutar/new.sh" >> /etc/crontab
/etc/init.d/cron restart
echo -e "Finalizando activacion"
fi
rm -f manager.*
