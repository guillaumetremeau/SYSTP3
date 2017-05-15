#!/bin/bash

echo "_____________________________________________________"
PSEUDO=`cat ~/pseudo.cat`
NBESPACE=`wc -c ~/pseudo.cat | cut -d" " -f 1`
NBESPACE=`expr "35" "-" $NBESPACE`
ESPACE=""
while [ $NBESPACE != "0" ]; do
	ESPACE="$ESPACE "
	NBESPACE=`expr $NBESPACE "-" "1"`
done
echo "|        Bonjour : $PSEUDO$ESPACE|"
echo "|                                                    |"
REPERTOIRE=$1
NBESPACE=${#REPERTOIRE}
NBESPACE=`expr "50" "-" $NBESPACE`
ESPACE=""
while [ $NBESPACE != "0" ]; do
	ESPACE="$ESPACE "
	NBESPACE=`expr $NBESPACE "-" "1"`
done
echo "| Répertoire par defaut :                            |"
echo "| $REPERTOIRE$ESPACE |"
echo "| D) afficher l’espace disque occupé                 |"
echo "| F) fixer le répertoire par défaut                  |"
echo "| C) créer un répertoire                             |"
echo "| E) Editer un texte                                 |"
echo "| M) Envoyer un mail                                 |"
echo "| S) Envoyer un fichier par mail                     |"
echo "| Q) se déconnecter                                  |"
echo "------------------------------------------------------"
echo "  Votre choix (D,F,C,E,M,S,Q) ?"
