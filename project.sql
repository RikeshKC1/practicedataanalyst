SELECT * FROM 
layoffs;

-- 1.remove duplicate if there is any 
-- 2.standarized data means we have to correct name is mistake if
-- 3.null values or black values remove 
-- 4. remove any column


-- creating table dublicate
create table layoff_stagging like layoffs;

INSERT INTO layoff_stagging 
select * from layoffs;

select *,
row_number() over(
partition by company,locationindustry ,total_laid_off,percentage_laid_off,`date`)  as row_num from layoff_stagging;


with duplicate_cte as (
select *,
row_number() over(
partition by company,location,industry ,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions)  as row_num from layoff_stagging
)
select * from duplicate_cte where row_num > 1;

select * from layoff_stagging where company = 'Casper';


with duplicate_cte as (
select *,
row_number() over(
partition by company,location,industry ,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions)  as row_num from layoff_stagging
)
DELETE from duplicate_cte where row_num > 1;