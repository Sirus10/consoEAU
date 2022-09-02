# consoEAU
Télé - Relevé de compteur d'eau pour ajout dans domoticz

Source initiale : 
http://www.lamaisonsimon.fr/wiki/doku.php?id=maison2:compteur_d_eau:compteur_d_eau


1 - Addapter le fichier cc1101.c ligne 672 -> ajouter le numero de serie du compteur a relever

2 - Addapter le fichier get_water.sh 
        -> ajuster l'Ip du server domoticz
        -> remplacer idx=22 par l'ID de votre compteur dans domoticz
        -> remplacer votre adresse email  put@your.email par votre adresse email 
      
3 - compiler : gcc radian_trx.c -o radian_trx -lwiringPi -lpthread -Wall

Executer en mode test : 
./radian_trx  puis tapper H


Executer avec ajout de l'information dans Domoticz : 
./get_water.sh
