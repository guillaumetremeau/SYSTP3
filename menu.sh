#!/bin/bash
trap "" SIGINT SIGQUIT
LANGUAGE="FR"
if [ $LANGUAGE == "US" ];then
	MESSFIXREP="Wich repository ? ('..' parent repository)"
	MESSCREERREP="Enter your new folder name"
	MESSEDITTEXT="Enter the file name"
	MESSDEST="Enter the receiver mail (ex: user.hello.com) : "
	MESSSUBJECT="Enter the object of your mail : "
	MESSBODY="Enter the body of your mail : "
	MESSFILE="Enter your file path : "
fi
if [ $LANGUAGE == "FR" ];then
	MESSFIXREP=	echo "Quel repertoire ? ('..' pour le parent)"
	MESSCREERREP="Entrez le nom de votre repertoire"
	MESSEDITTEXT="Entrez le nom du fichier que vous souhaitez modifier"
	MESSDEST="Entrez le destinataire (ex: user@hello.com) : "
	MESSSUBJECT="Entrez l'objet du mail : "
	MESSBODY="Entrez le contenu du mail : "
	MESSFILE="Entrez le chemin du fichier à éditer : "
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
	echo $MESSFIXREP
	read USERREP
	cd $USERREP
}
creerRepertoire()
{
	USERREP="defaultRep"
	clear
	echo $MESSCREERREP
	read USERREP
	mkdir $USERREP
}
editerTexte()
{
	USERREP=""
	clear
	ls
	echo $MESSEDITTEXT
	read USERREP
	vim $USERREP
}
envoiMail()
{
	ADDRESS=""
	echo $MESSDEST
	read ADDRESS
	SUBJECT=""
	echo $MESSSUBJECT
	read SUBJECT
	BODY=""
	echo $MESSBODY
	read BODY
	echo $body | mail -s $SUBJECT $ADDRESS
}
envoiMailFichier()
{
	ADDRESS=""
	echo $MESSDEST
	read ADDRESS
	SUBJECT=""
	echo $MESSSUBJECT
	read SUBJECT
	BODY=""
	echo $MESSBODY
	read BODY
	NOMFIL=""
	echo $MESSFILE
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
trap SIGINT SIGQUIT
