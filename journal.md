# Journal de bord du projet encadré
## Création de la clé de sécurité Ed25519  Le 03/10/2024
> Travail sur Git:
- `ssh-keygen -t ed25519` (permet de créer la clé)
- `$ eval "$(ssh-agent -s)"` (affichera "Agent pid password" si l'agent SSH tourne bien)
- `ssh-qdd git add pathid` (ex : ~/.ssh/id_ed25519)
- et on copie tout le texte de la clé public puis l'ajoute à GitHub via les settings
> codes généraux de git :
- `git <sous-command>` [-options...] [arguments...]
- `git config -global` user.email "EMAIL" (lier un dépôt de travail local à son compte GitHub)
- `git clone [options...] <URL>` (permet de  créer une copie d'un dépôt sur sa machine 
- `git status` (vérier les modifications, les mises à jours de dossiers par rapport à la version du dépôt)
- `git fetch` (il permet de récupérer les modifications du dépôt distant vers notre répertoire local sans les intégrer/appliquer dans notre branche actuelle)
- `git pull` (à la différence de fetch, il récupère et intègre les modifications depuis dépôt distant dans notre branche ), le fetch permet de vérifier les conflits avant utiliser pull
- `git add <FILE...>` (on ajoute les modifications faites sur des fichiers avant validation, cette étape est applée la mise-en-place/staging)
- `git r, <FILE...>` (retier/supprimer un fichier)
- `git commit [-m message]` (valider les modifications des fichiers suivis/ayant subi des modifications, -m utilisé pour décrire les changements que l'on fait)
- `git push` (envoyer les modifications mises en place après commit vers le dépôt disant, la validation finale)
- `git log` (permet de voir l'ensemble des commits ayant effectués sur le dépôt du plus récent au plus ancien avec les auteur)
> Les étiquettes (tag) : 
- `git tag [-a] <tagname> [référence de commit] -m [message]` (le tag est utilisé pour mise en valeur/highlight le commit qu'on veut indiquer, -a permet d'annoter un tage avec un message donné par -m)
:q
- `git push origin` pousser un tag vers GitHUb, origin désigne le dépôt distant cloné
## Ex1 : configuration de Git
- Création de dépôt depuis GitHub
- Lier/cloner nos dossiers au dépôt distant (git clone <URL>)
- Création du journal de bord et la synchronisation
- Création du tag "Séance1"
## Séance 2 
- pour copier un code faut utiliser `code
> Commandes vim :
- passer du mode normal à intertion : `e`
- retourner au mode normal : `ESC`
- sauvegarder : `:w`
- quitter : `:q`
## Séance 3
> Exercice2
- Problème : pour faire le classement des lieux, je suis bloqué dans l'étape où j'ai déjà récupéré les comptages de chaque lieu avec la commande `cat PATH/*.ann | egrep "Location" | cut -f 3 | uniq -c | sort -nr` mais le problème c'est que les lieux identiques ne sont pas regroupés ensemble.
- Difficulté d'utiliser `echo`; peut-il prendre les inputs et les imprise ? j'ai éssayé la commande suivant `cat PATH/*.ann | wc -l > output.txt | echo`; mais le résultat c'est pas le contenu du texte output mais son titre seulement. echo est un peut comme print
- j'ai réussi à résoudre le premier problème, en fait avant de classer, il faut ranger les réultats de lieux selon lon alphabet après egrep, comme ça les lieux répétés sont groupés ensemble, la commande est `sort -d`, et la commande `uniq -c` peut les compter comme dans une seule ligne. 
- pour la dernière question, classer les lieux selon le moi des années confudues, j'ai dû copié les fichiers `.ann` d'années différentes dans un dossier, comme ça je peux les sélectionner dans la même adresse.
> Notes
- `https://www.notion.so/Programmation-et-Projet-encadr-10c8e2084b0d80e3a62ed664e64a895a?pvs=4` lien vers mes notes
- pour pousser un tag il faut ajouter le nom du tage que tu veux, EX : `git push origin tag_name`. Sinon, le tag ne sera pas envoyé.
- `git commit - "message" <chemin_du_fichier>` pour laisser un message au fichier spécifique.
> Git more exercices
- j'ai d'abord ajouter une nouvelle ligne qui contient des erreurs, pusi `add journal`, puis `commit` avec le message I AM ERROR
- puis j'ai ajouté une autre ligne qui doit rester après la correction de l'erreur, pareil, j'ai add and commut
- maintenant, j'ai push, et oh là, je dois retirer la mauvaise information en gardant le bon changement, donc avec `git log` j'ai récupéré le SHA du mauvais changement, avec `git revert SHA`, j'ai rencontré une erreur qui indique `Auto-merging journal.md CONFLICT (content): Merge conflict in journal.md. error: could not revert 58c6c0b... I AM ERROR` 
- donc j'ai dû modifié manuellement le contenu dans le journal, puis add journal et `revert --continue`.
> Git conflits
- `2141  git commit -m "creation de conflit" journal.md 
 2142  git status 
 2143  git stash push -m "Conservation des changements séance 3"
 2144  git log
 2145  git 
 2146  git reset 64ff1f8b0b260adad6d1e8c3a77d8841f4eef735
 2147  git status
 2148  got pull
 2149  git pull
 2150  commit journal.md 
 2151  git commit journal.md 
 2152  git pull
 2153  git stash push -m "Conservation des changements séance 3"
 2154  vim journal.md 
 2155  git stash push -m "Conservation des changements séance 3"
 2156  git status 
 2157  git add journal.md 
 2158  git commit journal.md 
 2159  git stash push -m "Conservation des changements séance 3"
 2160  git status

 2161  git stash main push -m "Conservation des changements séance 3"
 2162  git stash list


 2163  git status

 2164  git rebase --continue

 2165  l

 2166  git stash push -m "Conservation des changements séance 3"

 2167  git log

 2168  git reset HEAD~

 2169  vim journal.md
 
 2170  git status
 
 2171  git log

 2172  git stash push -m "Conservation des changements séance 3"

 2173  git stash list

 2174  git stash pop 0

 2175  vim journal.md 
- "cette ligne va être mis de côté"
## Séance 4 
> Correction des exercices pipelines et more git
- `echo` est utilisé pour écrire des messages dans un fichier, et par défaut, il va retourner à la ligne quand il y a une nouvelle ligne.
- `grep` a la fonction de `cat`, parce qu'il cherche d'abord les fichiers et les filtre ensuite. Ex : `egrep location PATH`
- `uniq` cherche les lignes qui se répètent et se suivent les unes après les autres. Donc il vaut mieux grouper avant les entrées standards. Ex : `egrep Location PATH | sort | uniq -c`  
- `sort` par défaut suit l'odrdre alphabétique
- `tail -n` par défaut nous donne 10 dernières lignes
## Séance5
> explication du code vu au cours
- `#!/usr/bin/bash` c'est la tête de ce fichier qui indique à l'interpréteur bash que ce fichier doit être interprété comme bash
- `if [ $# -ne 1 ]` [ ], tout ce qui est dedans, c'est la condition de l'instruction if. $# est un variable préterminé qui a la fonction de compter le nombre d'arguments donnés, il exite aussi $$ qui peut savoir le PID du programme en exécution; $! permet de vérifier si le programme a été bien exécuté ou pas, si $! est 0, c'est oui, sinon c'est non. -ne est un opérateur de condition qui vérifie si le nombre d'argumets n'égale à 1, si oui, la condition est vraie, il va exécuter les coomandes dans if, sinon il va pas l'exécuter
- then est d'après moi une barière qui sépare if et les commandes au dessus; et sémantiquement, il indique aux programmeurs d'entrer les commandes au-dessus
-`echo "..."`; echo égale imprimer, il va imprimer tout ce qui est dans les guillemets par la sortie standard
- `exit` signifie quitter if, bienqu'il reste des commandes à exécuter 
- `fi` signigie la fin de if
- `FICHIER_URLS=$1`, ici, on donne la valeur du premier argument positionnel au variable nommé FICHEIR_URLS. Argument positionel : argument donné de l'extérieur du script, par exemple via le terminal, il est changeable
- `OK=0; NOK=0`, on donne la valeur d'entier 0 aux variable OK et NOK
- `while` est une boucle qui va se répéter tant que la condition est vraie, le ";" est-il nécessaire ?
- `read -r LINE` est comme input dans Python, il demande intéractivement à l'utilisateur de donner une valeur au variable nommé LINE, -r est utilisé pour conservé le blackflash de l'entrée. (réponse venue de fameux CHATGPT, digérée par moi)
- `do` comme then
- if la valeur du variable LINE contient à l'expression réguière https://, l'opérateur ^ indique que le mot doit apparaître au début de la phrase, de l'entrée, s? signgie un s optionnel. =~ signigie la correspondance
- pour les regex ils sont exprimés dans les crochets [regex]
- `then echo`, puis imprime
- `OK=$(expr $OK + 1)`, donne la value de $OK + 1 à OK, dans bash pour l'opération il faut utiliser soit $(expr ) soit $[] soit $(())
- `else` si la condition if n'est pas remplie, alors exécute les commades au dessus d'else
- `echo; NOK..` imprime, la valeur de NOK + 1
- `fi` fin de if
- `done` fin de boucle while, donne la valeur de $FHCHIER_URLS à LINE
- `echo` imprime le nombre d'entrées qui sont le URL et le nomdre des autres qui ne le sont pas.
