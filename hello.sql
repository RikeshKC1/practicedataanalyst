-- data cleaning 

-- removing rows
select * from layoffs;

create table  hello like layoffs;

select * from hello;

insert into hello select * from layoffs;

select *,row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, 
`date`,stage,country,funds_raised_millions)
 as row_num from hello;
 
 with duplicate_cte as (select *,row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, 
`date`,stage,country,funds_raised_millions)
 as row_num from hello)
 select * from duplicate_cte where row_num >1;
 
 select * from hello where company = 'Cazoo';
 
 CREATE TABLE `hello1` (
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

select * from hello1;

insert into hello1
select *,row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, 
`date`,stage,country,funds_raised_millions)
 as row_num from hello;
 
 select * from hello1;
 
delete from hello1 where row_num >1;

 
delete from hello1 where row_num >1;

-- standarization
select distinct company, trim(company) from hello1 order by 1;

update hello1
set company = trim(company);

select * from hello1;

select distinct location from hello1 order by 1;

select distinct industry from hello1 order by 1;

update hello1
set industry = 'Crypto'
where industry like 'Crypto%';

select * from hello1;

select distinct country, trim(trailing '.' from country) from hello1 order by 1;

update hello1
set country = trim(trailing '.' from country);

select `date`,str_to_date(date, '%m/%d/%Y') from hello1;

update hello1 
set `date` = str_to_date(date,'%m/%d/%Y');


alter table hello1
modify column `date` DATE;

select * from hello1;

-- removing duplicates and null values

select * from hello1 where percentage_laid_off is null and total_laid_off is null;

-- we have to scan each and every column

-- we have to scan is there are null or blank  in all column by this code
select * from hello1 where industry is null or industry = '';

select * from hello1 where company = 'Airbnb';



-- first we have to make null if there is blank values
update hello1 
set industry = null
where industry = '';

select t1.industry, t2.industry 
from hello1 t1
join hello1 t2
  on t1.company = t2.company
where (t1.industry is null or t1.industry = '')
  and t2.industry is not null;


update hello1 t1
join hello1 t2 
on t1.company = t2.company
set t1.industry = t2.industry
where(t1.industry is null or t1.industry = '')
and t2.industry is not null;

select * from hello1 where industry is null or industry = '';


-- there is still one row where there is null 

select * from hello1 where company like 'Bally%';
-- if there is only one row then we have to leave it

-- we have seen that there is null value in this and we checked it 
select * from hello1 where total_laid_off is null and percentage_laid_off is null;

-- if there is not any total values then we have to delete the null column for clean dataset
delete from hello1 where total_laid_off is null and percentage_laid_off is null;


-- this is final clean data
select * from hello1;

-- in last we don't need row_num so we have to drop it
alter table hello1
drop column row_num;
-- data cleaning is also done now for this project							









 
