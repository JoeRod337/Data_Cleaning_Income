SELECT  *
FROM us_household_income
;

SELECT * 
FROM us_household_income_statistics
;


alter table us_household_income_statistics 
rename column `ï»¿id` to `id`
;

SELECT  count(id)
FROM us_household_income
;


SELECT count(id)
FROM us_household_income_statistics
;


select id, count(id)
from us_household_income
group by id
having count(id) > 1
;

select *
from(select row_id,
			id,
			Row_number() over(partition by id order by id) row_num
 from us_household_income) duplucates
 where row_num > 1
 ;
 
 delete from us_household_income
 where row_id in ( select Row_id
                   from (select row_id,
			                    id,
			                    Row_number() over(partition by id order by id) row_num
						from us_household_income) duplucates
                    where row_num > 1)
 ;
 
 
 select *
from(select id,
			Row_number() over(partition by id order by id) row_num
 from us_household_income_statistics) duplucates
 where row_num > 1
 ;
 
 select State_Name,
	    count(State_Name)
 from us_household_income
 group by State_Name
 ;
 
 
 update  us_household_income
 set State_Name = 'Georgia'
 where State_Name = 'georia'
 ;
 
  update  us_household_income
 set State_Name = 'Alabama'
 where State_Name = 'alabama'
 ;
 
 select *
 from us_household_income
 where County = 'Autauga County'
 order by 1
 ;
  select State_ab,
	    count(State_ab)
 from us_household_income
 group by State_ab
 ;
 
 update us_household_income
 set Place = 'Autaugaville'
 where County = 'Autauga County'
 and City = 'Vinemont'
 ;
 
 
 select Type,
        count(Type)
from us_household_income
group by Type
order by 1
;


update us_household_income
set Type = 'Borough'
where Type = 'Boroughs'
;

select distinct AWater
from us_household_income
where AWater = 0 or AWater = '' or AWater is null
;

select distinct Aland,
                AWater
from us_household_income
where (AWater = 0 or AWater = '' or AWater is null)
and (Aland = 0 or Aland = '' or Aland is null)
;

select distinct Aland,
                AWater
from us_household_income
where (Aland = 0 or Aland = '' or Aland is null)
;

