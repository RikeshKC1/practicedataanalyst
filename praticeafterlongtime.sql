select * from employee_demographics;
select employee_id from employee_demographics;

#selecting age
select age from employee_demographics;

select age,(age+10) as newage from employee_demographics;

#use of distint it only generated unique value and it will use in data analysis as to get unqiue values
select distinct gender from employee_demographics;

select distinct salary from employee_salary;

# using where statement 
select * from employee_demographics;

select * from employee_demographics where first_name = 'Leslie';

# this is used in most of the case as gender for selecting only that row 
select * from employee_demographics where gender = 'Female';

# we used symbol like ! means not equal to here is an demo
select * from employee_demographics where gender !='Female';

#Logical Operators
select * from employee_demographics where first_name='Tom' and age = 36;
select * from employee_demographics where first_name = 'Tom' or age = 36;

#Like statement 
# % is used for anything output like a bata name aauney jati sabai aauney vayo haina 
select * from employee_demographics where first_name like 'a%';

#  ___ this is used for selecting specific value from table
select * from employee_salary where first_name like 'a___';

# used of Group by and it is used to group any data
select gender from employee_demographics group by gender;

select gender,avg(age) as AverageAge,min(age) as MinimumAge, max(age) as MaximumAge, count(age)as COUNT from employee_demographics group by gender;

# used of order by  and it is used for making our table data in asc mean assending order and descing order and it is used ot mark hightest value in data
select * from employee_demographics order by age desc;
select * from employee_demographics order by age asc;


# Limit how much we need table row and column we want only that by using limit
select * from employee_demographics order by age desc limit 4;

select * from employee_demographics limit 2;

# Aliasing we can give any output name by using as syntax

SELECT age, AVG(age) AS AverageAge
FROM employee_demographics
GROUP BY age;


