#!/bin/sh
#
#
# En cours de dev par Cdiez50
#
###

# On ajoute la dernière news 
get_last_news=$(curl http://www.lemonde.fr/rss/une.xml) 
news=$(get_last_news |grep "title" | head -3 | tail -1 | sed -e "s/<title>//g" | sed -e "s/<\/title>//g" > info)

# Message de connexion 
sudo pico2wave -l fr-FR -w test.wav "Bonjour `echo $USER`, contente de vous revoir, nous sommes le `  date | awk '{ print $1 echo " " $2 echo " " $3 echo " " $4 echo " " $5 echo " "}'`, je vous souhaite de travailler dans d'agréables conditions, il vous reste ` acpi | grep -o '\w*%'` de batterie. Démarrage système depuis le ` who -b | awk '{print $3 echo " à " $4}'`.. Un point d'actualité sur la dernière niuze.`cat info`"

# On le joue
play test.wav

# On le supprime
rm -f test.wav
# et le point news
rm -f info

# On quitte
exit
