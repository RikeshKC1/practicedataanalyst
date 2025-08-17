-- Removing duplicates
select * from layoff_stagging;

create table rikesh like layoff_stagging;

INSERT INTO rikesh
select * from layoff_stagging;

select * from rikesh;

SELECT *, ROW_NUMBER() OVER(
partition by company , location , industry, total_laid_off,percentage_laid_off,`date`, stage, country, funds_raised_millions
) as row_num FROM rikesh;

With duplicate_cte as(
SELECT *, ROW_NUMBER() OVER(
partition by company , location , industry, total_laid_off,percentage_laid_off,`date`, stage, country, funds_raised_millions
) as row_num FROM rikesh
)
SELECT * FROM duplicate_cte where row_num >1;

SELECT * FROM rikesh where company = 'Casper';

SELECT * FROM rikesh where company = 'Cazoo';


With duplicate_cte as(
SELECT *, ROW_NUMBER() OVER(
partition by company , location , industry, total_laid_off,percentage_laid_off,`date`, stage, country, funds_raised_millions
) as row_num FROM rikesh
)
DELETE FROM duplicate_cte where row_num >1;

CREATE TABLE `layoff_stagging2` (
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


select * from layoff_stagging2;

insert into layoff_stagging2
SELECT *, ROW_NUMBER() OVER(
partition by company , location , industry, total_laid_off,percentage_laid_off,`date`, stage, country, funds_raised_millions
) as row_num FROM rikesh;


select * from layoff_stagging2;


SET SQL_SAFE_UPDATES = 0;

delete
from layoff_stagging2 where row_num >1;

select * from layoff_stagging2 where row_num >1;

select * from layoff_stagging2;

-- first step complete 

-- Standarizing Data
