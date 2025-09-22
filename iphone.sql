-- removing rows
select * from layoffs;

create table test like layoffs;

select * from test;

insert into test
select * from layoffs;

select * from test;

select *,row_number() over(partition by company, location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num from test;

with duplicate_cte as (
  select *,row_number() over(partition by company, location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,
  funds_raised_millions) as row_num from test
)
select * from duplicate_cte where row_num>1;


CREATE TABLE `iphone` (
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

select * from iphone;

insert into iphone
  select *,row_number() over(partition by company, location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,
  funds_raised_millions) as row_num from test;

select * from iphone;

delete from iphone where row_num>1;

-- standarize data
select * from iphone;

select distinct company from iphone order by 1;

update iphone 
set company = trim(company);

select * from iphone;

-- searching in location if there is any error 
select distinct location from iphone order by 1;

select distinct industry from iphone order by 1;

select * from iphone where industry like 'Crypto%';

update iphone 
set industry = 'Crypto'
where industry like 'Crypto%';

select distinct country from iphone order by 1;

update iphone 
set country = 'United States'
where country like 'United States';

select country, trim(trailing '.' from country) from iphone order by 1;

update iphone 
set country = trim(trailing '.' from country);

select * from iphone;


select `date`,str_to_date(`date`,'%m/%d/%Y') from iphone;

update iphone
set `date` = str_to_date(`date`,'%m/%d/%Y');


alter table iphone
modify column `date` DATE;


-- we have to remove null and blank value and data cleaning process is fiinalize

select * from iphone where total_laid_off is null and percentage_laid_off is null;

-- we have to scan is there are null or blank  in all column by this code
select * from iphone where industry is null or industry = '';

select * from iphone where company = 'Airbnb';
                                            
