-- ********************************************************************************************
-- SLIDE 1 (DAILY NUMBERS OF CONFIRMED CASES IN ALL CONTINENT)
-- ********************************************************************************************
SELECT date, total_cases, new_cases FROM world WHERE location = 'World' order by 1;

-- ****************************************************************************************************
-- SLIDE 2 (DAILY NUMBERS OF CONFIRMED DEATHS IN ALL CONTINENT)
-- ***************************************************************************************************
SELECT date, new_cases , new_deaths FROM world WHERE location = 'World';

-- **************************************************************************************************
-- -- SLIDE 3 (NUMBER OF deaths and vaccination )
-- **************************************************************************************************
SELECT date,new_deaths, total_vaccinations FROM world WHERE location = 'World' order by 1;

-- ***************************************************************************************************
-- SLIDE 4 (CASES REQUIRING HOSPITALISATION) 
-- ***************************************************************************************************
select date, sum(new_cases) as cases, sum(hosp_patients) as hospitalised from
(select * from asia union all
select * from africa union all
select * from europe union all
select * from south_america union all
select * from north_america union all

select * from oceania)as temp group by 1;
-- ***************************************************************************************************
-- SLIDE 5 (MOST AFFECTED GROUP INCOME WISE) 
-- ***************************************************************************************************
select location, sum(new_cases) as cases, sum(new_deaths)as death from world
where location in ('High income','upper middle income', 'lower middle income' ,'low income'  )
   group by 1 order by 2,3;

-- ***************************************************************************************************
-- SLIDE 6  covid spread, death,vaccination by continent
-- ***************************************************************************************************
-- spread
select continent, round(((max(total_cases)/max(population)) * 100),2) as spread from 
(select * from asia union all
select * from africa union all
select * from europe union all
select * from south_america union all
select * from north_america union all
select * from oceania) as temp group by 1 order by 2;

-- death
select continent, round(((max(total_deaths)/max(population)) * 100),2) as deaths from 
(select * from asia union all
select * from africa union all
select * from europe union all
select * from south_america union all
select * from north_america union all
select * from oceania) as temp group by 1 order by 2;
-- vaccination
select continent, round(((max(total_vaccinations)/max(population)) * 100),2) as vaccination from 
(select * from asia union all
select * from africa union all
select * from europe union all
select * from south_america union all
select * from north_america union all
select * from oceania) as temp group by 1 order by 2;

-- ***************************************************************************************************
-- SLIDE 7 cases by location
-- ***************************************************************************************************
select location , (max(total_cases)/max(population)) *100 as cases , population from
(select * from asia union all
select * from africa union all
select * from europe union all
select * from south_america union all
select * from north_america union all
select * from oceania) as temp1 where population > 100000000 group by 1,3 order by 2 desc ;

-- ***************************************************************************************************
-- SLIDE 8 spread vs gdp
-- ***************************************************************************************************
select location , (max(total_cases)/max(population)) *100  as cases, max(gdp_per_capita) as gdp_per_capita from
(select * from asia union all
select * from africa union all
select * from europe union all
select * from south_america union all
select * from north_america union all
select * from oceania) as temp1 group by 1;

-- ***************************************************************************************************
-- SLIDE 9 death vs gdp
-- ***************************************************************************************************

select location , (max(total_deaths)/max(population)) *100  as cases, max(gdp_per_capita) as gdp_per_capita from
(select * from asia union all
select * from africa union all
select * from europe union all
select * from south_america union all
select * from north_america union all
select * from oceania) as temp1 group by 1;
