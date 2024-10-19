#!/bin/bash
#read -p "put your number" number
#echo $number
for (( n=2016;n<=2018;n++))
do
        path=$HOME/Desktop/Exercice1/ann/$n/*.ann
        echo "annotation of location in $n"
        cat $path | egrep "Location" | cut --f=3 | wc -l
done
echo "le résultat de l'exécution du dernier programme=$?"
# read -p "information" n_variable egale input, -p "", print un message.
# Read assaigne ce que l'utilisateur a tapé avant enter à n_variable
# $! permet d'indiquer le fonctionnement du dernier programme exécuté en retournant 0
