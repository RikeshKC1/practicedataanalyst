select * from rikeshkopractice;

create table okayxata like rikeshkopractice;

select * from okayxata;

insert into okayxata
select * from rikeshkopractice;

select * from okayxata;

select *,ROW_NUMBER() OVER(partition by company , location , industry, total_laid_off ,percentage_laid_off, `date`,stage,country,
funds_raised_millions) as row_num from okayxata;


with duplicate_cte as (
select *,ROW_NUMBER() OVER(partition by company , location , industry, total_laid_off ,percentage_laid_off, `date`,stage,country,
funds_raised_millions) as row_num from okayxata
)
select * from duplicate_cte where row_num>1;

select * from okayxata where company = 'Casper';

CREATE TABLE `okayxata1` (
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

select * from okayxata1;

insert into okayxata1
select *,ROW_NUMBER() OVER(partition by company , location , industry, total_laid_off ,percentage_laid_off, `date`,stage,country,
funds_raised_millions) as row_num from okayxata;

select * from okayxata1 where row_num>1;


SET SQL_SAFE_UPDATES = 0;

delete 
from okayxata1 where row_num >1;

select * from okayxata1;

-- stadarizing data
select * from okayxata1;

select distinct company , trim(company) from okayxata1 order by 1;

update okayxata1 
set company = trim(company);

select distinct company  from okayxata1;

select * from okayxata1;


-- Everthing are in correct formate in lcoation so we didn't do anythings
select distinct location from okayxata1 order by 1;

select distinct industry from okayxata1 order by 1;
-- we inidcate there are three crypto so we will chanage it and make it one 

select * from okayxata1 where industry like 'Crypto%';

update okayxata1
set industry = 'Crypto' where industry like 'Crypto%';


select distinct  country , trim(trailing '.' from country) from okayxata1 order by 1;
-- we have indicate problem in united states in last there is .

select * from okayxata1 where country like 'United States%'; 

update okayxata1 
set country = trim(trailing '.' from country) where country like 'United States%';

SELECT * FROM okayxata1;






