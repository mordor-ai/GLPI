select  
COUNT(tracking.ID), 
entities.name,
CASE tracking.status WHEN "old_done" THEN "Fermé" WHEN "assign" THEN "Attribué" WHEN "new" THEN "Nouveau" WHEN "waiting" THEN "En attente" WHEN "old_notdone" THEN "Non fermé" END as 'status_FR',
tracking.status  as 'status_EN',
tracking.closedate as 'date', 
 EXTRACT(YEAR_MONTH FROM tracking.closedate)*100+DAY(tracking.closedate) as 'date_INT',
 {fn month(( tracking.closedate ))} as 'date_MONTH',
{fn year(( tracking.closedate ))} as 'date_YEAR',
{fn week(( tracking.closedate ))} as 'date_WEEK',
category.name as 'category_name',
category.completename as 'category_completename',
assigned.name as 'assigned_login',
assigned.realname as 'assigned_name', 
author.name as 'author_login', 
author.realname as 'author_name',
g.name as 'author_group', 
groups.name  as 'group_name'
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
  AND tracking.status='old_done'
  GROUP BY
entities.name,
CASE tracking.status WHEN "old_done" THEN "Fermé" WHEN "assign" THEN "Attribué" WHEN "new" THEN "Nouveau" WHEN "waiting" THEN "En attente" WHEN "old_notdone" THEN "Non fermé" END ,
tracking.status  ,
tracking.`date`,  
EXTRACT(YEAR_MONTH FROM tracking.date)*100+DAY(tracking.date) ,
{fn month(( tracking.date ))} ,
{fn year(( tracking.date ))} ,
{fn week(( tracking.date ))} ,
tracking.closedate, 
 EXTRACT(YEAR_MONTH FROM tracking.closedate)*100+DAY(tracking.closedate) ,
 {fn month(( tracking.closedate ))} ,
{fn year(( tracking.closedate ))} ,
{fn week(( tracking.closedate ))} ,
category.name ,
category.completename ,
assigned.name ,
assigned.realname , 
author.name , 
author.realname ,
g.name , 
groups.name  
UNION ALL
select  
COUNT(tracking.ID), 
entities.name,
"Nouveau" as 'status_FR',
tracking.status  as 'status_EN',
tracking.`date`,  
EXTRACT(YEAR_MONTH FROM tracking.date)*100+DAY(tracking.date) as 'date_INT',
{fn month(( tracking.date ))} as 'date_MONTH',
{fn year(( tracking.date ))} as 'date_YEAR',
{fn week(( tracking.date ))} as 'date_WEEK',
category.name as 'category_name',
category.completename as 'category_completename',
assigned.name as 'assigned_login',
assigned.realname as 'assigned_name', 
author.name as 'author_login', 
author.realname as 'author_name',
g.name as 'author_group', 
groups.name  as 'group_name'
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
  -- AND tracking.status!='old_done'
  GROUP BY
entities.name,
CASE tracking.status WHEN "old_done" THEN "Fermé" WHEN "assign" THEN "Attribué" WHEN "new" THEN "Nouveau" WHEN "waiting" THEN "En attente" WHEN "old_notdone" THEN "Non fermé" END ,
tracking.status  ,
tracking.`date`,  
EXTRACT(YEAR_MONTH FROM tracking.date)*100+DAY(tracking.date) ,
{fn month(( tracking.date ))} ,
{fn year(( tracking.date ))} ,
{fn week(( tracking.date ))} ,
tracking.closedate, 
 EXTRACT(YEAR_MONTH FROM tracking.closedate)*100+DAY(tracking.closedate) ,
 {fn month(( tracking.closedate ))} ,
{fn year(( tracking.closedate ))} ,
{fn week(( tracking.closedate ))} ,
category.name ,
category.completename ,
assigned.name ,
assigned.realname , 
author.name , 
author.realname ,
g.name , 
groups.name  