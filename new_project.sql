-- removing duplicate rows and also checking is there any
select * from employees_dirty;

create table employees1 like employees_dirty;

insert into employees1 
select * from employees_dirty;

select * from employees_dirty;

select *,row_number() over(partition by EmployeeID , FullName,Email,Department,Salary,JoinDate) as row_num
from employees_dirty;

-- there is not any extra row so we are clear into next step

-- standarize data

select distinct EmployeeID from employees1 order by 1;
update employees1 
set EmployeeID = trim(EmployeeID);


select * from employees1;

update employees1
set FullName = trim(FullName);

select * from employees1 where Department = 'hr';

update employees1 
set Department = 'HR' where 
Department = 'hr';

select distinct FullName from employees1 order by 1;