README
======
# Organisation des dossiers
* REINIT-DWH-TEST01:  contient les batch de recréation automatique des bases pour le serveur DWH-TEST01. Il n'y a pas besoin de remplir des paramètres
* REINIT-FRMTPDWH01:  idem pour FRMTPDWH01
* REINIT-FRMTPTST57:  idem pour FRMTPTST57

  
# Automatisation
## Création des bases de données 
## Création de GLPI
```bash
script_create_Database.bat
```
utilisé pour créer la base de données DWH_OP
ce script demande un certain nombre de paramètres : 

* le nom de la base de données
* l'instance du serveur de base de données
* le login/mdp du serveur 
* le répertoire où  créer les fichiers physiques utilisés pour les données des tables
* le répertoire où  créer les fichiers physiques utilisés pour les index des tables
* le répertoire où  créer les fichiers physiques utilisés pour les logs



## Réinitialisation de la base de données existante
**Attention:**  ces scripts détruisent les bases existantes !!!

Le script suivant détruit la base GLPI et la recrée
`script_batch_reinit_DWH_Database`



