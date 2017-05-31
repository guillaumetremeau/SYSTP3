# repo git : https://github.com/guillaumetremeau/SYSTP3.git

#file tp3.sh (affichage)

#!/bin/bash
echo "$2"
if [ $2 == "US" ];then
	BONJOUR="Hello  "
	MESSREP="Default repository   "
	MESSD="Show disk usage                "
	MESSF="Switch default folder         "
	MESSC="Create Folder      "
	MESSE="Edit a text    "
	MESSM="Send a mail    "
	MESSS="Send a mail with an attachment"
	MESSQ="Disconnect    "
	MESSCHOICE="Your Choice (D,F,C,E,M,S,Q) ?"
fi
if [ $2 == "FR" ];then
	BONJOUR="Bonjour"
	MESSREP="Répertoire par defaut"
	MESSD="afficher l'espace disque occupé"
	MESSF="fixer le répertoire par défaut"
	MESSC="créer un répertoire"
	MESSE="Editer un texte"
	MESSM="Envoyer un mail"
	MESSS="Envoyer un fichier par mail   "
	MESSQ="Se Déconnecter"
	MESSCHOICE="Votre Choix (D,F,C,E,M,S,Q) ?"
fi

echo "_____________________________________________________"
PSEUDO=`cat ~/pseudo.cat`
NBESPACE=`wc -c ~/pseudo.cat | cut -d" " -f 1`
NBESPACE=`expr "35" "-" $NBESPACE`
ESPACE=""
while [ $NBESPACE != "0" ]; do
	ESPACE="$ESPACE "
	NBESPACE=`expr $NBESPACE "-" "1"`
done
echo "|        $BONJOUR : $PSEUDO$ESPACE|"
echo "|                                                    |"
REPERTOIRE=$1
NBESPACE=${#REPERTOIRE}
NBESPACE=`expr "50" "-" $NBESPACE`
ESPACE=""
while [ $NBESPACE != "0" ]; do
	ESPACE="$ESPACE "
	NBESPACE=`expr $NBESPACE "-" "1"`
done
echo "| $MESSREP :                            |"
echo "| $REPERTOIRE$ESPACE |"
if [ -f ~/no_D ]; then
	echo "| D) $MESSD                 |"
fi
if [ -f ~/no_F ]; then
	echo "| F) $MESSF                  |"
fi
if [ -f ~/no_C ]; then
	echo "| C) $MESSC                             |"
fi
if [ -f ~/no_E ]; then
	echo "| E) $MESSE                                 |"
fi
if [ -f ~/no_M ]; then
	echo "| M) $MESSM                                 |"
fi
if [ -f ~/no_S ]; then
	echo "| S) $MESSS                  |"
fi
if [ -f ~/no_Q ]; then
	echo "| Q) $MESSQ                                  |"
fi
echo "------------------------------------------------------"
echo "  $MESSCHOICE"


#file menu (gestion du menu et fonctions)

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
