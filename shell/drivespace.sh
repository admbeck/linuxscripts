#!/usr/bin/env bash
#Script for showing drive space
#color parameters
Red='\e[31m'
Green='\e[32m'
Yellow='\e[33m'
Magenta='\e[35m'
Lgreen='\e[92m'
Lcyan='\e[96m'
Nocol='\e[39m'
Line='\e[8m-\e[0m'

#funcitons
Sort(){
	echo "-----------------"

	Col=`echo ${drive[4]} | awk -F '%' '{print $1}'` #Takes % of the used drive space
	if [ $Col -le 49 ]; then 	#0-49% - print green
		Percent="${Green}"
	elif [ $Col -le 79 ]; then	#50-79% - print yellow
		Percent="${Yellow}"
	else 
		Percent="${Red}"	#59-100% - print red
	fi
		#Long and ugly line to print and colors the text	
	echo -e "${Red}Drive:${Line}${Red}${drive[0]}${Nocol}\n${Yellow}Mount:${Line}${Yellow}${drive[5]}${Nocol}\n${Lgreen}Total:${Line}${Lgreen}${drive[1]}${Nocol}\n${Lcyan}Empty:${Line}${Lcyan}${drive[3]}${Nocol}\n${Magenta}Used:${Line}${Line}${Magenta}${drive[2]}${Line}${Line}${Line}$Percent${drive[4]}$Nocol"
}

#variables
List=(`df | grep sd | awk {'print $1'} | awk -F '/' {'print $3'}`)
len=${#List[@]}
top -bn 1 | grep zombie | awk '{print $10" "$11}'

for ((i=0;i<$len;i++));do	#Counts how much items are in the list and repeats script that many times
drive=(`df -h | grep ${List[$i]}`)
Sort $drive
done
echo "-----------------"
