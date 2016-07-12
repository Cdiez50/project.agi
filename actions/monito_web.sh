#!/bin/sh
# Dev par Cdiez

# Si on a un open 
a=$(nmap -p 443 NDD.com | tail -3 | head -1 | tr " " ":" | cut -d ":" -f 2)
b="open"

c=$(ping -i 0.2 -c 1 NDD.com | head -2 | tail -1 | tr " " ":" | cut -d ":" -f 9 | cut -d "=" -f 2)

# On analyse le retour

	if [ "$a" != "$b" ]
	then
		sudo pico2wave -l fr-FR -w test.wav "Message Monitoring. Attention, le serveur NDD n'est plus disponible"
	
	play test.wav

	rm -f test.wav

	else
		sudo pico2wave -l fr-FR -w test.wav "Message Monitoring. Aucune alerte pour le serveur NDD. Temps de réponse du serveur. `echo $c` mili seconde"

	play test.wav

	rm -f test.wav

fi
