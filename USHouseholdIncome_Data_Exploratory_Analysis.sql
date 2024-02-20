select *
from us_household_income
;


select *
from us_household_income_statistics
;



select State_Name,
       sum(ALand),
       sum(AWater)
from us_household_income
group by State_Name
order by 2 desc
;


select State_Name,
       sum(ALand),
       sum(AWater)
from us_household_income
group by State_Name
order by 3 desc
;


select State_Name,
       sum(ALand),
       sum(AWater)
from us_household_income
group by State_Name
order by 2 desc
limit 10
;


select State_Name,
       sum(ALand),
       sum(AWater)
from us_household_income
group by State_Name
order by 3 desc
limit 10
;


select *
from us_household_income u
inner join us_household_income_statistics us
	on u.id = us.id
where Mean <> 0
;



select u.State_Name,
       Round(avg(Mean),1) as 'Avg Mean Income',
       Round(avg(Median),1) as 'Avg Median Income'
from us_household_income u
inner join us_household_income_statistics us
	on u.id = us.id
where Mean <> 0
group by u.State_Name
order by 2
Limit 5
;



select Type,
       count(Type),
       Round(avg(Mean),1) as 'Avg Mean Income',
       Round(avg(Median),1) as 'Avg Median Income'
from us_household_income u
inner join us_household_income_statistics us
	on u.id = us.id
where Mean <> 0
group by 1
order by 4 desc
;



select *
from us_household_income
where Type = 'Community'
;


select Type,
       count(Type),
       Round(avg(Mean),1) as 'Avg Mean Income',
       Round(avg(Median),1) as 'Avg Median Income'
from us_household_income u
inner join us_household_income_statistics us
	on u.id = us.id
where Mean <> 0
group by 1
having count(Type) > 100
order by 4 desc
;




select u.State_Name,
	   City,
       round(avg(Mean),1)
from us_household_income u
inner join us_household_income_statistics us
	on u.id = us.id
group by u.State_Name, City
order by 3 desc
;
