#!/bin/bash
#
#####   تم عمل الشيل سكربت لتوزيعة كالي لينكس 2019.4 64 بت بصلحية الروت   #####
#
#
#
#chmod +x Install_Tools_GPS_Spoofing.sh
########################" ﻹحداثية ثابته GPS Spoofing تنفيذ "########################
### https://www.google.com.sa/maps/@/data=!3m1!1e3
### cd gps-sdr-sim && ./gps-sdr-sim -b 8 -e brdc0140.20n -l 38.897700,-77.036443,100 -o 0X001337.bin
### hackrf_transfer -t 0X001337.bin -f 1575420000 -s 2600000 -a 1 -x 15 -R
########################" ﻹحدثيات متحركة GPS Spoofing تنفيذ "########################
### google-earth-pro
### wine SatGenNMEA.exe
### cd gps-sdr-sim/satgen && ./nmea2um 0x00.txt 0x00.csv && mv 0x00.csv ~/gps-sdr-sim/ && cd ..&&ls
### ./gps-sdr-sim -b 8 -e brdc0140.20n -u 0x00.csv -o 0x00.bin
### hackrf_transfer -t 0x00.bin -f 1575420000 -s 2600000 -a 1 -x 15 -R
########################################################################################################
#Colors
white="\033[1;37m"
grey="\033[0;37m"
purple="\033[0;35m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
Purple="\033[0;35m"
Cyan="\033[0;36m"
Cafe="\033[0;33m"
Fiuscha="\033[0;35m"
blue="\033[1;34m"
transparent="\e[0m"
while :
do
clear
echo -e $transparent"PC Name - $red$(hostname)$transparent"
echo "+--------------------------------------+"
echo -e "|     " $white"INSTALL""$yellow TOOLS"  $red"GPS Spoofing"$transparent"      |"
echo "+--------------------------------------+"
echo -e $yellow"["$red"0"$yellow"]"$red" ::.Exit.::"$transparent
echo -e $red"["$yellow"1"$red"]"$transparent" PC Update."
echo -e $red"["$blue"2"$red"]"$transparent" GPS-SDR-SIM."
echo -e $red"["$yellow"3"$red"]"$transparent" Install Wine Wine32."
echo -e $red"["$blue"4"$red"]"$transparent" Google Earth Pro"
echo -e $red"["$yellow"5"$red"]"$transparent" SatGenNMEA"
echo -e $red"["$blue"6"$red"]"$transparent" GNSS Data"
echo -e $Fiuscha "Enter your choice $yellow[$red 0$blue -$yellow 6 ] $transparent" $green ;  read -p  "Number: " choice
 case $choice in
#update
1)
apt install apt-transport-https -y && apt update && apt -y full-upgrade && apt-get upgrade -y && apt-get dist-upgrade -y
echo -e $yellow"Done"$transparent
read -p "Press [Enter] key to continue..."
readEnterKey
;;
#GPS-SDR-SIM
2)
git clone https://github.com/osqzss/gps-sdr-sim.git && cd gps-sdr-sim && make;
gcc gpssim.c -lm -O3 -o gps-sdr-sim;
cd satgen && make;
echo -e $yellow"Done"$transparent
read -p "Press [Enter] key to continue..."
readEnterKey
;;
#Install Wine Wine32 Wine64
3)
apt install wine -y;
dpkg --add-architecture i386 && apt-get update -y; apt-get -f install -y; 
apt install wine32 -y;
echo -e $yellow"Done"$transparent
read -p "Press [Enter] key to continue..."
readEnterKey
;;
#Google Earth Pro
4)
wget -O /root/google-earth-pro_amd64.deb https://dl.google.com/dl/earth/client/current/google-earth-pro-stable_current_amd64.deb;
cd && dpkg -i google-earth-pro_amd64.deb;
apt-get -f install -y;
rm google-earth-pro_amd64.deb;
echo -e $yellow"Done"$transparent
read -p "Press [Enter] key to continue..."
readEnterKey
;;
#SatGenNMEA
5)
wget -O /root/SatGenNMEA.exe https://archive.org/download/0X001337/SatGenNMEA.exe;
echo -e $yellow"Done"$transparent
read -p "Press [Enter] key to continue..."
readEnterKey
;;
#GNSS Data
6)
cd gps-sdr-sim; wget ftp://cddis.gsfc.nasa.gov/gnss/data/daily/2020/brdc/brdc0140.20n.Z && 7z e brdc0140.20n.Z && rm brdc0140.20n.Z
echo -e $yellow"Done"$transparent
read -p "Press [Enter] key to continue..."
readEnterKey
;;
0)
echo -e $red "Bye ):" $transparent
exit 0
;;
*)
echo -e $red"Error: Invalid option..."$transparent
read -p "Press [Enter] key to continue..."
readEnterKey
;;
esac


done
