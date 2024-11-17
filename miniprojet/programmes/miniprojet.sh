#!/bin/sh
#path_file=$1
# pas d'espace entre le =
# read -p "enter the path of your list of URL: " path_file$
#if [ $# -ne 1 ]
#then
#	echo "un et un seul argument"
#	exit 0
	# dans cette étape si il y a plusieurs arguments, le if va retourner 0 et le reste codes ne va pas être exécutés
#fi
nombre_de_ligne=1
while read -r line;
# `read`, lire un texte ou un fichier phrase par phrase, `-r` permet de traiter l'antislash comme un caractère normal mais pas un wildcard
do
if [[ $line =~ ^https?:// ]]
then
	code_HTTP=$(curl -sI -L -w '%{http_code}\n' $line | egrep -io 'HTTPs?\/{1}[0-9]*\.*[0-9]*\s[0-9]{3}' | cut -d ' ' --f=2)
	# `code_HTTP=$(curl -sI $line | egrep HTTP)` c'est pas parfait, on aura des résultats comme HTTP/2 200 ..., je veut seulement les codes, donc comme on a fait pour ann, j'utilise cut avec -d ' ' --f=2 qui délimite le séparateur est espace et selectionne la deuxième colonne
	# -s silence permet de ne pas afficher les infos de precessus -I que les en-têtes HTTP
	# -L suivre les redirections si possibles
	# -w write out une partie spécifique avec les mots cles. `'${content_type}'`
	encodage=$(curl -sI -w '%{content_type}\n' $line | tail -n 1 | egrep -io 'charset=[a-zA-Z0-9-]+' | cut -d '=' --f=2)
# curl -s -I -L -w "%{http_code}" -o dev/null $line
# -w output the format with keywords
# -L redirection
# -o dev/null ???
# if [ -z $string ] -z pour voir si la chaîne est vide ou pas
# cette fois on sait que le format de output est `charset=UTF-8`, donc il faut utiliser `=` comme le séparateur.
# grep -Po -P ? -o only matching
	# encoding=${encoding:-"N/A"}. ${variable:-valeur}. si la variable est vide, il va etre remplacer par une nouvelle valeur.
	if [[ $encodage =~ UTF-8 ]]
# si l'encodage est en UTF-8, nous allons extracter le texte
	then
		nombre_mots=$(lynx -dump -nolist $line | wc -w)
		# lynx -dump -nolist, avoir le contenu de la page en se déparrassant des HTTP
			# si on veut stocker le résultat des commandes dans une variable il faut utiliser $(commanndes) pour que bash puisse comprendre qu'on veut affecter le résultat de commandes à notre variable
			# exemple B=echo help et B=$(echo help), dans le premier on n'a pas affecté une valeur à notre variable, elle n'existe pas si on veut l'imprimer, parce qu'elle va devenir une variable temporelle/argument pour la commande qui suit, une fois elle est exécutée, cette variable va disparaître
			# wc -w combien de mots
		echo $nombre_de_ligne   $line   $code_HTTP	$encodage	$nombre_mots
	else
# sinon, seulement un message
		echo $nombre_de_ligne  $line   $code_HTTP	"encodage non UTF-8"
	fi
else
	echo "$nombre_de_ligne $line format non conforme"
fi
	nombre_de_ligne=$(expr $nombre_de_ligne + 1)
	# pour faire les additions, opérateur est $(expr )
done < "/home/xingyuchen/Desktop/PPE_2024/PPE1-2024/miniprojet/urls/fr.txt";
	# "<" permet de donner comme input pour cette boucle
#================================================= QUESTION 1 ===================================================
# avec cat on peut faire la même chose... c'est le fonctionnement qui est différent je pense, j'ai joint le script de cat
# cat lire un fichier et imprime ce qu'il concatène de ce fichier dans la sortie standard, c'est-à-dire il retourne qqch sans d'autres opérations spécifiques
# mais read, si on lui donne l'aderesse du fichier, il va retourner une erreur, il ne permet pas d'afficher le fichier, mais il le stock et il attend à l'assignher aux variables
