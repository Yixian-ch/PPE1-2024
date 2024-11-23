#!/bin/bash
# attention, pour appeler un script qui est en fait une commande/fichier exécutable et dans bash, toutes les choses qu'on va taper va d'abord être interprétés comme une commande (ou dans le monde de bash, tout est commande)
# echo variable et ce qu'on veut
nombre_de_mot=$2
# pour avoir un argument positionnel, en d'autres mots, ça veut dire si on a cet argument, on fait ça, sinon on fait d'autres choses
if [ -z $nombre_de_mot ]
then
	./$1 | sort | uniq -c | sort -n | tail -n 25
else
	./$1 | sort | uniq -c | sort -n | tail -n $nombre_de_mot
fi
