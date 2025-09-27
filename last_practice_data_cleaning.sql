-- removing row
-- standarizing data
-- removing blank and null value
-- removing unnecessaey column
select * from layoffs;

create table last_practice like layoffs;

select * from last_practice;

insert into last_practice
select * from layoffs; 
 
 select * from last_practice;
 
 select *,row_number() over(partition by company,location, industry , total_laid_off,percentage_laid_off,`date`,stage,country,
 funds_raised_millions) as row_num from last_practice;
 
 with duplicate_cte as (
 select *,row_number() over(partition by company,location, industry , total_laid_off,percentage_laid_off,`date`,stage,country,
 funds_raised_millions) as row_num from last_practice
 )
select * from duplicate_cte where row_num>1;

select * from last_practice where company = 'Casper';


CREATE TABLE `last_practice1` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from last_practice1;

insert into last_practice1
 select *,row_number() over(partition by company,location, industry , total_laid_off,percentage_laid_off,`date`,stage,country,
 funds_raised_millions) as row_num from last_practice;
 
 select * from last_practice1 where row_num >1;
 
 delete from last_practice1 where row_num >1;
 
 alter table last_practice1 drop column row_num;
 
 -- standarizing data
 
 select * from last_practice1;
 
 select distinct company ,trim(company) from last_practice1 order by 1;
 
 update last_practice1
 set company = trim(company);
 
 --  we don't find any problem in location
 select distinct location from last_practice1 order by 1;

-- we find problem that there are same industry name but there are 2 name so we have to chanage 
select distinct industry from last_practice1 order by 1;
 
select * from last_practice  where industry like 'CryptoCurrency'; 

update last_practice1 
set industry = 'Crypto'
where industry = 'CryptoCurrency';

