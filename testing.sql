-- removing duplicate values
select * from layoffs;
create table amisha like layoffs;

select * from amisha;

insert into amisha 
select * from layoffs;

select * from amisha;

select *,row_number() over( partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num from amisha;

with duplicate_cte as (
select *,row_number() over( partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num from amisha
)
select * from duplicate_cte where row_num >1;

CREATE TABLE `amisha1` (
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

select * from amisha1;
insert into amisha1
select *,row_number() over( partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num from amisha;

select * from amisha1;


delete from amisha1 where row_num>1;

select * from amisha1 where row_num>1;

select *from amisha1;

-- strandaization
select distinct company, trim(company) from amisha1 order by 1;

update amisha1
set company = trim(company);

select * from amisha1;

select distinct industry from amisha1;

select * from amisha1 where industry like 'Crypto%';



update amisha1 
set industry = 'Crypto'
where industry like 'Crypto%';

-- we don't find any error in location we dont need  to trim and update the name
select distinct location from amisha1;

select distinct country from amisha1 order by 1;


-- 1st method
update amisha1 
set country = 'United States'
where country like 'United States%';


-- 2nd method
update amisha1
set country =  trim(trailing '.' from country);

select distinct country from amisha1 order by 1;



