#!/bin/sh
# nettoyer le texte et lister les mots (sans répétition)
# comment utiliser tr -d pour supprimer un texte par rapport à sa position dans un texte
# comment utiliser tr pour remplacer les majuscules en miniscules ?
# logique d'abord avec tr on nettoie le texte, puis on utilise grep pour lister tous les mots
# nettoyage : supprimer les ponctuations, tout en minuscule, supprimer les textes inutiles qui n'a pas de rapport avec notre texte, par exemple la licence.
# dans tr, il exsite l'expression [:punct:] pour toutes les ponctuations
# tr -d [:punct:]
# et tr a une autre fonction de translate par défaut si on n'ajout pas d'options, syntaxe : tr pattern replacement, le premier argument on met ce qu'on veut trouver, et le deuxième est son remplacement 
# tr '[:upper:]' '[:lower:]' permet de remplacer les upper cases par les lower case ou tr [A-Z] [a-z]
# mais il peut pas de remplacer les carctères dracrités en capitale.
# maintenant il faut ajouter le grep pour trier les résultats
tr [A-Z] [a-z] < ./candide.txt | tr -d [:punct:] | grep -i -o -E "\b[a-z]+\b\s+?\b[a-z]+\b"
# on peut pas stocker le résultat dans une variable, ça va détruire la forme du texte
# dans ce cas-là ce script va return le résultat des commadnes comme dans Python
