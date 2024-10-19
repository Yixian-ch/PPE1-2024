#!/bin/bash
read -p "choisir une annee, si vous tapez *, ça veut dire toutes les années: " annee
read -p "choisir un mois, si vous tapez *, ça veut dire tous les mois: " mois
read -p "choisir le nombre de lieux à afficher :" lieux
path=$HOME/Desktop/Exercice1/ann/$annee/$annee"_"$mois
grep Location $path*.ann | cut --f=3 | sort | uniq -c | sort -n | tail -$lieux 
echo "le chiffre est $? si le dernier programme a été bien exécuté"
