-- Returns the date '2022-01-30' and extracts its day of the week (0=Sunday, ..., 6=Saturday)
select 
'2022-01-30':: date, 
 extract('dow' from '2022-01-30':: date)

-- Returns the current date and extracts its day of the week
select 
	current_date, 
 	extract('dow' from current_date)
	
-- Counts the number of visits grouped by day of the week from the sales.funnel table
select
	EXTRACT('dow' from visit_page_date) as dia_da_semana,
	count (*)
from sales.funnel
group by dia_da_semana
order by dia_da_semana
 

	