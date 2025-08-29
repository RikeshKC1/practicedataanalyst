-- removing duplicate
select * from layoffs;


create table helloworld like layoffs;


insert into helloworld
select * from layoffs;

select * from helloworld;

select *,row_number() over(partition by company , location, industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from helloworld;

with duplicate_cte as (
select *,row_number() over(partition by company , location, industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from helloworld
)
select * from duplicate_cte where row_num>1;

select * from helloworld where company = 'Casper';

CREATE TABLE `helloworld1` (
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


select * from helloworld1;
insert into helloworld1
select *,row_number() over(partition by company , location, industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from helloworld;

select * from helloworld1;


delete from helloworld1 where row_num >1;

select * from helloworld1 where company = 'Casper';

select * from helloworld1;

-- Standarizing data
select company,trim(company) from helloworld1;

update helloworld1
set company = trim(company);

select * from helloworld1;

select distinct industry from helloworld1 order by 1;

select * from helloworld1 where industry like 'Crypto%';

update helloworld1 
set industry = 'Crypto' where 
industry like 'Crypto%';

select distinct location from helloworld1;

select * from helloworld1;

select distinct country,  trim(trailing '.' from country)   from helloworld order by 1;

-- 1st method
update helloworld1
set country = 'United States'
where country like 'United States%';

-- 2nd method
update helloworld1 
set country =  trim(trailing '.' from country);