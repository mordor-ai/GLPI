/*
 * AUTHOR :  Emmanuel Pellegrin
 * Name : GLPI - tracking_list_open_GLPI.sql
 * description: this script lists all opened tickets by creation date 
 * COPYRIGHTS ORCHESTRA 2019 */
select  
tracking.ID, 
entities.name,
CASE tracking.status WHEN "old_done" THEN "Fermé" WHEN "assign" THEN "Attribué" WHEN "new" THEN "Nouveau" WHEN "waiting" THEN "En attente" WHEN "old_notdone" THEN "Non fermé" END as 'status_FR',
tracking.status  as 'status_EN',
tracking.`date` as 'creation_date',  
EXTRACT(YEAR_MONTH FROM tracking.date)*100+DAY(tracking.date) as 'creation_date_INT',
{fn month(( tracking.date ))} as 'creation_date_MONTH',
{fn year(( tracking.date ))} as 'creation_date_YEAR',
{fn week(( tracking.date ))} as 'creation_date_WEEK',
 tracking.closedate as 'close_date', 
EXTRACT(YEAR_MONTH FROM tracking.closedate)*100+DAY(tracking.closedate) as 'close_date_INT',
{fn month(( tracking.closedate ))} as 'close_date_MONTH',
{fn year(( tracking.closedate ))} as 'close_date_YEAR',
{fn week(( tracking.closedate ))} as 'close_date_WEEK',
category.name as 'category_name',
category.completename as 'category_completename',
assigned.name as 'assigned_login',
assigned.realname as 'assigned_name', 
author.name as 'author_login', 
author.realname as 'author_name',
g.name as 'author_group', 
groups.name  as 'group_name'
from  glpi.glpi_tracking tracking
JOIN glpi_entities  entities ON entities.ID=tracking.FK_entities
LEFT JOIN glpi_dropdown_tracking_category as category on category.ID =  tracking.category
LEFT join glpi.glpi_entities e  on e.ID =  tracking.FK_entities
LEFT join glpi_users as author on author.ID =  tracking.author
LEFT JOIN glpi.glpi_users_groups ug on ug.FK_users=  tracking.author 
LEFT join glpi_groups g on g.ID = ug.FK_groups
LEFt join glpi_users as assigned on assigned .ID =  tracking.assign
LEFT join glpi_groups groups on groups.ID = tracking.assign_group
where 
  entities.name  =  'DWH'
  
ORDER BY tracking.`date`
  