
SELECT *
  FROM [GLPI].[dbo].[F_GLPI]
  where assigned_name IS NULL
  and entity='DWH'
  and status_EN not in ('old_done', 'done','old_notdone','waiting')
  order by CAL_KEY_CREATE DESC



/****** Script de la commande SelectTopNRows à partir de SSMS  ******/
SELECT *
  FROM [GLPI].[dbo].[F_GLPI]
  where group_name IS NULL
  and entity='DWH'
  and status_EN not in ('old_done', 'done','old_notdone','waiting')
  order by CAL_KEY_CREATE DESC



  SELECT *
  FROM [GLPI].[dbo].[F_GLPI]
  where 
  --group_name IS NULL and 
  entity='DWH'
  and group_name like  '%volution%' 
  and status_EN not in ('old_done', 'done','old_notdone','waiting')
  order by CAL_KEY_CREATE DESC



  SELECT *
  FROM [GLPI].[dbo].[F_GLPI]
  where group_name IS NULL
  and name like '%arrivant%'