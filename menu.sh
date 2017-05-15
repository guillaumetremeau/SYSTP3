#!/bin/bash

afficheEspaceDisque()
{
	clear
	df
	read
}

fixerRepertoire()
{
	clear
	ls
	echo "Quel repertoire ? ('..' pour le parent)"
	cd 
}
REPERTOIRE=`pwd`
USER="A"
while [ $USER != "Q" ]; do
	clear
	./tp3.sh $REPERTOIRE
	read USER
	case $USER in
		"D")
			afficheEspaceDisque
			;;
		"F")
			fixerRepertoire
			;;
		"C")
			
			;;
		"E")
			
			;;
		"M")
			
			;;
		"S")
			
			;;
		"Q")
			
			;;
	esac
done
clear
