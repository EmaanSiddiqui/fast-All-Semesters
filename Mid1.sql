select departments.department_name, count(employees.department_id) as "NO. of Emp", 
round(avg(salary),2)
from departments join employees
on employees.department_id = departments.department_id
GROUP BY (departments.department_name)
ORDER BY count(employees.department_id) asc;

select department_name,salary
from employees join departments
on employees.department_id=departments.department_id
where department_name like 'A%';

Create table tab1 
(
    id1 int PRIMARY KEY
    
    
);
 insert into tab1 values(2,'emaan');
 update tab1
 set id1=3
 where id1=2;
 
 delete from tab1 
 where id1=1;
 select * from tab1;
 
 Alter table tab1
 rename column id1 to id2;
 
alter table tab1
add name varchar(20);

 alter table tab1
 drop column id2; 

alter table tab1
add constraint notNullName UNIQUE(NAME);

Create table tab2
(
    idd int PRIMARY KEY,
    age int unique,
    namme varchar(20), 
    Foreign key (namme) references tab1(name)on delete cascade
    
);
select * from tab2;
drop table tab2;
