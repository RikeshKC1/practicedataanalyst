-- removing duplicate rows
select * from layoffs;

create table pen like layoffs;

select * from pen;

insert into pen
select * from layoffs;

select * from pen;

select row_number() over(partition by company, location, industry, total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions ) as row_num from pen;

with duplicate_cte as (
  select *,row_number() over(partition by company, location, industry, total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions ) as row_num from pen
)
select * from duplicate_cte where row_num>1;

CREATE TABLE `pen1` (
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

select * from pen1;

insert into pen1
select *,row_number() over(partition by company , location, industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from pen;

delete from pen1 where row_num>1;

select * from pen1 where row_num>1;

-- strandize data


