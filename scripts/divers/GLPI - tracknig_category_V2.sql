select  tracking.ID,  CONCAT('http://glpi.orchestra.fr/front/tracking.form.php?ID=',CONVERT (tracking.ID , CHAR(100)))  as 'LINK', 
 entities.name,
 entities.completename,
CASE tracking.status WHEN "old_done" THEN "Fermé" WHEN "assign" THEN "Attribué" WHEN "new" THEN "Nouveau" WHEN "waiting" THEN "En attente" WHEN "old_notdone" THEN "Non fermé" END as 'status_FR',
tracking.status  as 'status_EN',
tracking.`date`,  
EXTRACT(YEAR_MONTH FROM tracking.date)*100+DAY(tracking.date) as 'date_INT',
{fn month(( tracking.date ))} as 'date_MONTH',
{fn year(( tracking.date ))} as 'date_YEAR',
{fn week(( tracking.date ))} as 'date_WEEK',
tracking.closedate, 
 EXTRACT(YEAR_MONTH FROM tracking.closedate)*100+DAY(tracking.closedate) as 'closed_date_INT',
 {fn month(( tracking.closedate ))} as 'closed_date_MONTH',
{fn year(( tracking.closedate ))} as 'closed_date_YEAR',
{fn week(( tracking.closedate ))} as 'closed_date_WEEK',
tracking.category as 'categrory_ID', 
category.name as 'category_name',
category.completename as 'category_completename',
tracking.assign,
assigned.firstname, 
assigned.name as 'assigned_login',
assigned.email as 'assigned_email', 
assigned.realname as 'assigned_name', 
author.name as 'author_login', 
author.email as 'author_email', 
author.realname as 'author_name',
g.name as 'author_group', 
tracking.assign_group as 'group_ID', 
groups.name  as 'group_name',
{fn left(tracking.contents,1000)} as 'first_1000_content' ,
tracking.*  
from  glpi.glpi_tracking tracking
LEFT JOIN glpi_dropdown_tracking_category as category on category.ID =  tracking.category
LEFT join glpi.glpi_entities e  on e.ID =  tracking.FK_entities
LEFT join glpi_users as author on author.ID =  tracking.author
LEFT JOIN glpi.glpi_users_groups ug on ug.FK_users=  tracking.author 
LEFT join glpi_groups g on g.ID = ug.FK_groups
LEFt join glpi_users as assigned on assigned .ID =  tracking.assign
LEFT join glpi_groups groups on groups.ID = tracking.assign_group
JOIN glpi_entities  entities ON entities.ID=tracking.FK_entities 
where 
  entities.name  =  'DWH'
-- category.name = 'DWH'
-- and (  EXTRACT(YEAR_MONTH FROM tracking.closedate)*100+DAY(tracking.closedate)>=20180301  OR tracking.closedate  IS NULL )  
-- and assigned.name='jplhostis'
-- AND tracking.ID =  439951

-- select *  from  glpi_tickets where id = 437142