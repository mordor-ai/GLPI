select  
d.date_YEAR,
d.date_WEEK,
d.date_YEAR_WEEK,
tracking.ID , 
tracking.status,
groups.name  as 'group_name',
category.name as 'category_name',
assigned.name as 'assigned_login',
assigned.realname as 'assigned_name', 
author.name as 'author_login', 
author.realname as 'author_name'
from  glpi.glpi_tracking tracking
JOIN 
(
select distinct 
{fn year(( gen_date ))} as 'date_YEAR',
{fn week(( gen_date ))} as 'date_WEEK' ,
{fn year(( gen_date ))} *100+{fn week(( gen_date ))} as 'date_YEAR_WEEK'
from 
(select adddate('1970-01-01',t4*10000 + t3*1000 + t2*100 + t1*10 + t0) gen_date from
 (select 0 t0 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
 (select 0 t1 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
 (select 0 t2 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
 (select 0 t3 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
 (select 0 t4 union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) v
	where gen_date between '2017-01-01' and  CURDATE() 
) d ON  {fn year(( tracking.`date` ))} *100+{fn week(( tracking.`date` ))} <= d.date_YEAR_WEEK  
        and ( {fn year(( tracking.`closedate` ))} *100+{fn week(( tracking.`closedate` ))} > d.date_YEAR_WEEK   OR  tracking.closedate IS NULL)
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
  AND date_YEAR_WEEK =201830
 -- and tracking.ID='343897'
 GROUP BY 
d.date_YEAR,
d.date_WEEK,
d.date_YEAR_WEEK,
tracking.ID , 
groups.name  ,
category.name,
assigned.name,
assigned.realname , 
author.name , 
author.realname ,
tracking.status
 



