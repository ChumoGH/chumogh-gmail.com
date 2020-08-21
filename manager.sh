#!/bin/bash
if [ -f /bin/ejecutar/mn ];
then
cowsay -f stegosaurus "BIENVENIDO Y GRACIAS POR UTILIZAR - - - - - - - -【 ★ ChumoGH ★ 】 ADM 2020 "| lolcat
else
cat /root/manager.sh > /bin/ejecutar/mn
fi
#FUNCION DE BARRA INSTALA
fun_bar () {
comando[0]="$1"
comando[1]="$2"
(
[[ -e $HOME/fim ]] && rm $HOME/fim
${comando[0]} -y > /dev/null 2>&1
${comando[1]} -y > /dev/null 2>&1
touch $HOME/fim
) > /dev/null 2>&1 &
tput civis
echo -ne "  \033[1;33mESPERE \033[1;37m- \033[1;33m["
while true; do
for((i=0; i<18; i++)); do
echo -ne "\033[1;31m#"
sleep 0.1s
done
[[ -e $HOME/fim ]] && rm $HOME/fim && break
echo -e "\033[1;33m]"
sleep 1s
tput cuu1
tput dl1
echo -ne "  \033[1;33mESPERE \033[1;37m- \033[1;33m["
done
echo -e "\033[1;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
tput cnorm
}
#FIN FUNCION BARRA INSTALA
DATE=$(date +"%d-%m-%y")
TIME=$(date +"%T")
if [ -f /bin/ejecutar/date ];
then
echo "CADUCIDAD AGREADA ANTERIORMENTE, NO SE DEBE MODIFICAR"
echo -e 
echo -e 'DATE=$(date +"%d-%m-%y");' > /bin/ejecutar/new.sh
echo -e 'TIME=$(date +"%T");' >> /bin/ejecutar/new.sh
echo -e 'echo 'Fecha Instalación : ' $(cat < /bin/ejecutar/dateI) 'Fecha CADUCA : ' $(cat < /bin/ejecutar/date) ' >> /bin/ejecutar/new.sh
echo -e 'if cat /bin/ejecutar/date | grep $DATE $TIME  ; then' >> /bin/ejecutar/new.sh
echo -e 'echo -e " Aceptado el " $DATE $TIME >> /root/ok.log' >> /bin/ejecutar/new.sh
echo -e 'sed '/new.sh/ d' /etc/crontab > /bin/ejecutar/crontab' >> /bin/ejecutar/new.sh
echo -e 'cat /bin/ejecutar/crontab > /etc/crontab' >> /bin/ejecutar/new.sh
echo -e 'sed '/MODIFICADO/ d' /etc/crontab > /bin/ejecutar/crontab'  >> /bin/ejecutar/new.sh
echo -e 'cat /bin/ejecutar/crontab > /etc/crontab'  >> /bin/ejecutar/new.sh
echo -e 'else'  >> /bin/ejecutar/new.sh
echo -e 'echo " Analizando... " $DATE $TIME >> /root/time.log' >> /bin/ejecutar/new.sh
echo -e 'fi' >> /bin/ejecutar/new.sh
	#chmod +x /bin/ejecutar/new.sh
else 
SHELL=/bin/sh 
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
clear
export PATH=$PATH:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/sbin:/bin:/usr/games
cowsay -f stegosaurus " Fecha : $DATE | | | Hora : $TIME - - - - -【 ★ ChumoGH ★ 】 ADM 2020 - - - - "| lolcat
echo 'Ingrese la Fecha de Caducidad en Formato : ' $DATE '  Ejemplo > DD-MM-AA ' 
echo -ne " Fecha › : "; read cadu
fun_bar
echo 'Ingrese la HORA de Caducidad en Formato : ' $TIME '  Ejemplo > HH-MM-01' 
echo -ne " HORA  › : "; read cadu1
fun_bar
echo $cadu $cadu1 > /bin/ejecutar/date
echo $DATE $TIME > /bin/ejecutar/dateI
cp /etc/crontab /bin/ejecutar/crontab.original
sed '/new.sh/ d' /etc/crontab > /bin/ejecutar/crontab
cat /bin/ejecutar/crontab > /etc/crontab
echo "#MODIFICADO" >> /etc/crontab
echo -e 'DATE=$(date +"%d-%m-%y");' > /bin/ejecutar/new.sh
echo -e 'TIME=$(date +"%T");' >> /bin/ejecutar/new.sh
echo -e 'echo 'Fecha Instalación : ' $(cat < /bin/ejecutar/dateI) 'Fecha CADUCA : ' $(cat < /bin/ejecutar/date) ' >> /bin/ejecutar/new.sh
echo -e 'if cat time.log  | grep $(cat < /bin/ejecutar/date)  ; then' >> /bin/ejecutar/new.sh
echo -e 'echo -e " Aceptado el " $DATE $TIME >> /root/ok.log' >> /bin/ejecutar/new.sh
echo -e 'sed '/new.sh/ d' /etc/crontab > /bin/ejecutar/crontab' >> /bin/ejecutar/new.sh
echo -e 'cat /bin/ejecutar/crontab > /etc/crontab' >> /bin/ejecutar/new.sh
echo -e 'sed '/MODIFICADO/ d' /etc/crontab > /bin/ejecutar/crontab'  >> /bin/ejecutar/new.sh
echo -e 'cat /bin/ejecutar/crontab > /etc/crontab'  >> /bin/ejecutar/new.sh
echo -e ' ' >> /bin/ejecutar/new.sh
echo -e 'else'  >> /bin/ejecutar/new.sh
echo -e 'echo " Analizando... " $DATE $TIME >> /root/time.log' >> /bin/ejecutar/new.sh
echo -e 'fi' >> /bin/ejecutar/new.sh
echo '*/1 * * * *	root	bash /bin/ejecutar/new.sh' >> /etc/crontab
#
#/etc/init.d/cron restart
echo 'Fecha Instalación : ' $(cat < /bin/ejecutar/dateI) 'Fecha CADUCA : ' $(cat < /bin/ejecutar/date)
fun_bar
echo -e "Finalizando activacion"
fi
rm -f manager.*
