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
echo "| D) $MESSD                 |"
echo "| F) $MESSF                  |"
echo "| C) $MESSC                             |"
echo "| E) $MESSE                                 |"
echo "| M) $MESSM                                 |"
echo "| S) $MESSS                  |"
echo "| Q) $MESSQ                                  |"
echo "------------------------------------------------------"
echo "  $MESSCHOICE"
