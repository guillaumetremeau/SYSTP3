#!/bin/bash
LANGUAGE="FR"
if [ $LANGUAGE == "US" ];then
	MESSFIXREP="Wich repository ? ('..' parent repository)"
	MESSCREERREP="Enter your new folder name"
	MESSEDITTEXT="Enter the file name"
fi
afficheEspaceDisque()
{
	clear
	df
	read
}

fixerRepertoire()
{
	USERREP="."
	clear
	ls
	echo "Quel repertoire ? ('..' pour le parent)"
	read USERREP
	cd $USERREP
}
creerRepertoire()
{
	USERREP="defaultRep"
	clear
	echo "Entrez le nom de votre repertoire"
	read USERREP
	mkdir $USERREP
}
editerTexte()
{
	USERREP=""
	clear
	ls
	echo "Entrez le nom du fichier que vous souhaitez modifier"
	read USERREP
	vim $USERREP
}
envoiMail()
{
	ADDRESS=""
	echo "Entrez le destinataire (ex: user@hello.com) : "
	read ADDRESS
	SUBJECT=""
	echo "Entrez l'objet du mail : "
	read SUBJECT
	BODY=""
	echo "Entrez le contenu du mail : "
	read BODY
	echo $body | mail -s $SUBJECT $ADDRESS
}
envoiMailFichier()
{
	ADDRESS=""
	echo "Entrez le destinataire (ex: user@hello.com) : "
	read ADDRESS
	SUBJECT=""
	echo "Entrez l'objet du mail : "
	read SUBJECT
	BODY=""
	echo "Entrez le contenu du mail : "
	read BODY
	NOMFIL=""
	echo"Entrez le chemin du fichier à éditer : "
	read $NOMFIL
	echo $body | mutt -a $NOMFIL -s $SUBJECT -- $ADDRESS
}
USER="A"
while [ $USER != "Q" ]; do
	clear
	REPERTOIRE=`pwd`
#repertoire du fichier source
	~/Cours/SYSTEME/SYSTP3/tp3.sh $REPERTOIRE $LANGUAGE
	read USER
	case $USER in
		"D")
			afficheEspaceDisque
			;;
		"F")
			fixerRepertoire
			;;
		"C")
			creerRepertoire
			;;
		"E")
			editerTexte
			;;
		"M")
			envoiMail
			;;
		"S")
			envoiMailFichier
			;;
		"Q")
			
			;;
	esac
done
clear
