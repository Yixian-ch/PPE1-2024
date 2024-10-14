"tu ne me trouveras jamais"
"il doit rester après la correction"
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
