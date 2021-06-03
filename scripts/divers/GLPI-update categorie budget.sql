select  assign_ent,ID,author  from  glpi.glpi_tracking where ID= 463518

select *  from  glpi_enterprises where `recursive` = 1 and FK_entities=0




select u.ID, u.assign_ent 
from glpi.glpi_tracking u
JOIN glpi_entities  entities ON entities.ID=u.FK_entities 
where 
  entities.name  =  'DWH' and  u.assign_ent=0;
 
 
 
select distinct  
	author.name as 'author_login', 
	author.email as 'author_email',   
	assign_ent , 
	categorie_budgetaire.name as 'Catégorie Budgétaire'
	from glpi.glpi_tracking  glpi
		LEFT join glpi_users as author on author.ID =  glpi.author
		LEFT JOIN glpi_entities  entities ON entities.ID=glpi.FK_entities 
		LEFT JOIN glpi_enterprises as categorie_budgetaire on categorie_budgetaire.ID = glpi.assign_ent
		where 
		entities.name  =  'DWH' 
		and assign_ent!=0
		 and   categorie_budgetaire.recursive = 1 
		 and  categorie_budgetaire.FK_entities=0
		  and 
		 author.name like '%MDEMAS%'
		order BY author.name
		
		
		

/*  cette requete permet de lister tous les GLPI qui n'ont pas de catégories assignées 
 * et donner une proposition d'assignation de */
select author.name, u.ID, u.assign_ent,s.assign_ent 
from glpi.glpi_tracking u
LEFT join ( select  distinct glpi.author, assign_ent 
	from glpi.glpi_tracking  glpi
		JOIN glpi_entities  entities ON entities.ID=glpi.FK_entities 
		JOIN glpi_enterprises as categorie_budgetaire on categorie_budgetaire.ID = glpi.assign_ent
		where 
		entities.name  =  'DWH' 
		and assign_ent!=0
		and categorie_budgetaire.recursive = 1 
		and categorie_budgetaire.FK_entities=0
	 ) as s on s.author = u.author
JOIN glpi_entities  entities ON entities.ID=u.FK_entities 
join glpi_users as author on author.ID =  u.author
where 
 entities.name  =  'DWH' 
 -- and  u.assign_ent=0
 and 		 author.name like '%MEZIAN%'

update   glpi.glpi_tracking u
join ( select distinct   glpi.author,
	assign_ent 
	from glpi.glpi_tracking  glpi
		 JOIN glpi_entities  entities ON entities.ID=glpi.FK_entities 
		 JOIN glpi_enterprises as categorie_budgetaire on categorie_budgetaire.ID = glpi.assign_ent
		where 
		entities.name  =  'DWH' 
		and assign_ent!=0
		and   categorie_budgetaire.recursive = 1 and 
		categorie_budgetaire.FK_entities=0
		) s on s.author = u.author
JOIN glpi_entities  entities ON entities.ID=u.FK_entities 
join glpi_users as author on author.ID =  u.author
set u.assign_ent	= s.assign_ent 
where   
entities.name  =  'DWH' 
and  u.assign_ent=0
and  author.name like '%MROUSSET%'

