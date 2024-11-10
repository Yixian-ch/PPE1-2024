#!/bin/bash
#annee=$1
#mois=$2
#lieux=$3
#if ! [ $# = 3 ]
# then
#         echo "must and only 3 arguments"
#         exit 3
# fi
read -p "choisir une annee, si vous tapez *, ça veut dire toutes les années: " annee
if ! [[ $annee =~ ^[0-9]{4}$ ]]
then
        echo "année invalide"
        exit 0
fi

read -p "choisir un mois, si vous tapez *, ça veut dire tous les mois, l'exemple de format 03 : " mois
if ! [[ $mois =~ ^[0-9]{2}$ ]]
# `$` ensures that the regex ends exactly with 2 int
then
        echo "mois invalide, format XX"
        exit 1
fi

read -p "choisir le nombre de lieux à afficher, l'exemple de format 1 :" lieux
if ! [[ $lieux =~ ^[0-9]+$ ]]
then
	echo "lieux invalide"
	exit 2
fi
path=$HOME/Desktop/S5/Exercice1/ann/$annee/$annee"_"$mois
grep Location $path*.ann | cut --f=3 | sort | uniq -c | sort -n | tail -$lieux 
# argument donne s'il est *, faut ajouter '', comme 'a'
