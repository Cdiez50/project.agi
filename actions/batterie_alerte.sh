#!/bin/bash
# Dev par Cdiez

# Si le retour de la commande suivante est inférieure à 20
a=$(acpi | tr ' ' ':' | cut -d ':' -f 5 | tr -d '%,')
b="111"

	if [ "$a" -lt "$b" ]  
		
	then	
		# On demande à LN de nous alerter sur la batterie :
		sudo pico2wave -l fr-FR -w ../tmp/test.wav "Message Système. Attention, il reste ` acpi | grep -o '\w*%'` de batterie"

		# On lit le retour enregistré 
		play ../tmp/test.wav

		# On supprime le retour 
		rm -f ../tmp/test.wav
	
	else
		echo "ok" > /dev/null 		
fi

