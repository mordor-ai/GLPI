Alimentation GLPI
======

## Présentation

ce programme permet d'extraire les données à  partir de l'outils GLPI  et alimente un dataware dédié.

la base de données est constituée de plusieurs tables: 

* F_GLPI:  la table de faits des tickets
* D_USERS :  la table de dimension des utilisateurs
* D_CALENDRIER:  la table de dimension calendrier
* D_CATEGORIE_BUDGETAIRE:  la table qui regroupe les demandeurs par catégorie budgétaire
* D_GROUPES : correspond aux types de GLPI ( 1 - Incident, 2 - Evolution, 3 - Projet, 4 - Support)



Par ailleurs, le processus utilise le mécanisme TECH_TRAIT , pour extraire les données en mode delta





# Organisation des dossiers
* pentaho:  contient l'ensemble des transformations et de jobs pour exécuter l'extraction es données 

* scripts:  contient différents scripts pour initialiser la base de données ou faire des requêtes

  