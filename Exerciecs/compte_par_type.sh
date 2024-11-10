#!/bin/bash
read -p "enter year from 2016 to 2018: " YEAR
read -p "enter the type annotation u want to count: " TYPE
if ! [[ $YEAR =~ [0-9]{4} ]]
then
	echo "annee invalide"
	exit 0	
fi	
path=$HOME/Desktop/S5/Exercice1/ann/$YEAR
grep $TYPE $path/*.ann | wc -l
# if pour verifier les inputs 
# essayer de simplifier les codes, moins de profondeurs 
# if [[  ]]
