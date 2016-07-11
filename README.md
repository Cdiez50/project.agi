# Project AGI

### Description du projet :

La vrai question est surtout pour qui et pour quel besoin. Le projet du AGI serveur est développé et maintenu par une seule personne.	
La finalité réside dans l'échange intelligent de l'homme à la machine dans des fins de monitoring et performances système, scalabilité, maintenabilité et évolution de services. La vision d'un nouvel échange avec les serveurs, en ajoutant un sens non utilisé jusqu'ici, apporterait une humanisation sur les différentes tâches qu'un administrateur système doit assurer pour appliquer la stabilité de sa surcouche applicative. Il faut donc considérer l'outil actuel (ou du moins la vision de ce dernier), comme un lien physique permettant directement l'interaction intelligente. Il est important de souligner ici que nous ne parlons pas d'un outil conscient, la notion d'intelligence artificielle est donc affichée comme la possibilité d'humaniser les actions envers la machine et de rendre également sous forme humaine les retours de cette dernière.

### Description du moyen :

Le moyen d'échange est la voix, le système de communication oral serveur vers humain et humain vers serveur. Le principe est de pouvoir rendre les sorties et archivages système verbeuses en langage courant humain. Il sera possible d'échanger l'individu sous forme d'alertes, indications, communications, par la parole. 
La première élaboration de l'outil est sous forme de client serveur. Il faut considérer trois points : 
Le serveur
Le système client
Un noeud réseau d'archivage d'échanges

On peut noter un SPOF sur le serveur primaire. En effet si ce dernier venait à être indisponible, il faudrait pouvoir automatiser l'échange de l'information. Il faut donc ajouter un quatrième noeud :
Le serveur
Le serveur satellite
Le système client
Le serveur d'archivage d'échanges

Le serveur satellite serait sous forme de système de sondes distantes qui pourraient effectuer la récupération, la génération puis la communication à destination du système client cible. Les écritures ne se feraient donc uniquement sur le système satellite, préservant ainsi la production mère de toute modification par le service (l'autonomie applicative).
Description de l'architecture :

La mise en place actuelle du projet n'est actuellement que disponible sur les système GNU/Linux. 
Il faut appuyer l'application comme un FS (filesystem) indépendant. De fait la branche master serait le dossier source, il faut ensuite ajouter à cela les sous-dossiers : /actions, /tmp, /logs, /clients, /protos. 

    ----DOCUMENTROOT 
        /actions 
        /tmp 
        /protos 
        /logs 
        /clients

### Description du système :

Le principe repose sur l'échange multi-serveurs par un tunnel sécurisé du type VPN (à définir). Chaque entité dispose d'un point d'échange avec son master et/ou sa slave (les deux cas peuvent être possibles dans des configurations particulières). Il faut donc identifier la production critique, relever les services (y compris les versions) actifs en criticités. Sur la partie satellitaire, il faut un socket de connexion sur le service de sonde vers le master. Il faudra la création d'un utilisateur et groupe utilisateur sans droit d'écriture sur le système mère (RO). La lecture d'informations sera à chaud, sauf si la lecture entraîne une action (/actions). Dans ce cas précis, le satellite récupère l'événement pour l'écrire sur son propre système (on peut imaginer un /tmp/event/log). L'archivage écrit entrainera l'action de transformation des données textes en formatage son. C'est à partir de ce moment que le système client (en veille sous forme de "until _event();") va pouvoir se declencher et via un socket unique entre lui et le satellite (et surtout pas direct entre client/master) récupérer les informations sons pour la lecture de l'alerte. Dans le même temps, le serveur satellite va envoyer à un deuxième serveur satellite uniquement les données textes non transformées pour pouvoir effectuer par la suite (via un système webapp) le monitoring et statistiques des événements définis par l'administrateur.
