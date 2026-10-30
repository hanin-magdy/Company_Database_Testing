use company;
create table student (ID INT auto_increment primary key , first_name varchar(10) Not null , last_name varchar(10) Not Null , address varchar(20) , city varchar(10) ,
 country varchar(20) , DOB date default (current_date()), grade int default(0) , gender enum('male' , 'femal'));
 
 alter table student add column postal_code int ;
 
 alter table student drop column country; 
 
 alter table student rename column postal_code to postalCode; 
 
 truncate table student;
 drop table student;
 
  
 INSERT INTO employee (fname, lname, ssn, bdate, address, gender, salary, superssn, dno) 
 VALUES ('Ahmed', 'Hassan', '102737', '1991-09-12', '30 gamal abdelnasser street', 'm', 5000, '102672', 30);
 
 INSERT INTO employee VALUES ('102738' , 'Ahmed', 'Khaled', '1991-09-12', '30 gamal abdelnasser street', 'm', 7000, '102672', 30);
 
 INSERT INTO employee (fname, lname, ssn, bdate,  gender, dno) 
 VALUES ('Asmaa' ,'Ali', '102888', '1967-08-11','F', 10);
 
 update employee set salary = 1200 where ssn = '102737'; 
 update employee set salary = 1700 , dno = 10 where ssn = '102737';
 
 delete from employee where ssn = '102737' ;
 set sql_safe_updates = 0;
 
 
 select * from department;
 select ssn ,fname ,dno from employee;
 select * from department where mgrssn = 223344;
 select * from employee where salary > 1000;
 select fname ,salary from employee where salary >=5000 and salary <=7000 ;
 select fname ,salary from employee where salary between 5000 and 7000;
 select ssn ,fname from employee where superssn = 102672 or superssn = 102672 ;
 select ssn ,fname from employee where superssn in (102672 , 102672) ;
 select fname ,lname from employee where fname like '_s%';                   # ? one character *zero or more
 select * from employee where fname like 'Ahm_d';
 select fname , lname from employee where fname like 'ah%';
 select * from employee where address like'%street';
 select *from employee where address like '%gamal%';
 select *from employee where codes like 'A_';
 select * from employee where fname like '%m%' and  salary >1500; 
 select * from employee where fname not like 'a%'; 
 select fname as firstName , salary*0.1 as bonus from employee; 
 select concat(fname ,' ', lname) as `full Name` from employee where salary*12 >7000;
 select fname , ssn from employee order by fname;
 select fname , ssn from employee order by fname desc;
 select * from employee order by dno , salary desc;
 select distinct dno from employee where dno is not null;
 select distinct dno , superssn from employee where dno is not null and superssn is not null order by dno;
 select fname , dname from employee , department where ssn = mgrssn;
 select fname , dname from employee inner join department on ssn = mgrssn;
 select fname , dname from employee as e, department as d where e.dno = d.dno;
 select fname , dname from employee as e inner join  department as d on e.dno = d.dno;
 select fname , pname ,weekly_hours from employee , project , works_on where ssn = essn and  works_on.pno = project.pno;
 select fname , dname from employee as e left outer join  department as d on e.dno = d.dno;
 select fname , dname from employee as e right outer join  department as d on e.dno = d.dno;
 
 select fname , dname from employee as e left outer join  department as d on e.dno = d.dno union
 select fname , dname from employee as e right outer join  department as d on e.dno = d.dno;
 
 select e.fname as employee , s.fname as supervisor from employee as e , employee as s where s.ssn = e.superssn ;
 
 select *from employee where salary > (select salary from employee where fname = 'Sara' and lname = 'Mahmoud');
 
 select *from employee where salary > all (select salary from employee where dno =20 );
 select *from employee where salary > (select max(salary) from employee where dno =20 );
 
 select *from employee where salary > any (select salary from employee where dno =20 );
 select *from employee where salary > (select min(salary) from employee where dno =30 );
 
 select max(salary) as max_salary , min(salary) as min_salary from employee;
 select count(*) as employee_count , count(salary) as salary_count from employee;
 select avg(salary) as average_salary ,dno ,fname from employee group by dno ,fname having dno is not null and max(salary)>2000;
 select count(salary) as average_salary ,dno ,fname from employee group by dno ,fname having dno is not null and max(salary)>2000;
 select dname as department_name , max(salary) from employee as e , department as d where e.dno = d.dno group by dname having avg(salary)> 1200 order by dname;
 
 
 create view employee_project_hours as select fname , pname , weekly_hours from employee , project , works_on where ssn = essn  and project.pno = works_on.pno;
 select *from employee_project_hours;
 
 create view employee_salaries as select fname , ssn , salary from employee;
 set SQL_SAFE_UPDATES = 0;
 update employee set salary = 11000 where ssn = 102700;
 select *from employee_salaries where salary;
 
 update employee_salaries set salary = 9000 where ssn = 102700;
 select *from employee;
 
 create or replace view employee_salaries as select fname , ssn , salary from employee where salary >5000;
 select *from employee_salaries;
  
 update employee_salaries set salary = 4000 where ssn = 102700;
 
 create or replace view employee_salaries as select fname , ssn , salary from employee where salary >5000 with check option;
 update employee_salaries set salary = 6000 where ssn = 102738;
   
 drop view employee_salaries;
 
 
 create index emp_salary on employee(salary);
 show index from employee;
 drop index emp_salary on employee;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  
  
 
  
 
 
  
 
 
 
 
 
 
 
  
  
 
 

  
  
   
 
 
 
 
  
 
 
 