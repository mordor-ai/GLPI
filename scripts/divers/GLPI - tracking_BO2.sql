SELECT
  glpi_tracking.date,
  glpi_tracking.closedate,
  glpi_tracking.name,
  CASE glpi_tracking.status WHEN "old_done" THEN "Fermé" WHEN "assign" THEN "Attribué" WHEN "new" THEN "Nouveau" WHEN "waiting" THEN "En attente" WHEN "old_notdone" THEN "Non fermé" END,
  usr_author.realname,
  usr_author.firstname,
  usr_author.email,
  {fn left(glpi_tracking.contents,1000)},
  glpi_tracking.ID,
  usr_recipient.firstname,
  usr_recipient.realname,
  {fn month(( glpi_tracking.date ))},
  {fn year(( glpi_tracking.date ))},
  {fn month(( glpi_tracking.closedate ))},
  {fn year(( glpi_tracking.closedate ))},
  {fn week(( glpi_tracking.closedate ))},
  {fn week(( glpi_tracking.date ))}
FROM
  (((glpi_entities INNER JOIN glpi_tracking ON (glpi_entities.ID=glpi_tracking.FK_entities) ) LEFT OUTER JOIN glpi_users  usr_author ON (usr_author.ID=glpi_tracking.author) ) LEFT OUTER JOIN glpi_users  usr_recipient ON (glpi_tracking.assign=usr_recipient.ID) )
WHERE
  ( 
  glpi_entities.name  =  'DWH')
  and 

