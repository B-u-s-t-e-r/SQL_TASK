
use demo27;

-- creating tables 
create table employeeinfo (EmpID int primary key,
                          EmpFname varchar(20),
                          EmpLname varchar(20),
                          Department varchar(10),
                          project char(2),
                          Address varchar(30),
                          DOB date,
                          gender char(1));
alter table  employeeinfo modify gender varchar(5);
alter table employeeinfo modify project varchar(5);
                          
create table employeeposition (EmpID int,
							  foreign key(EmpID) references employeeinfo(EmpID),
                              EmpPosition varchar(20),
                              DateOfJOinning date,
                              salary int);

-- inserting values
insert into employeeinfo values(1,'Sanjay','Mehra','HR','P1','Hyderabad(HYD)','1976-12-01','M'),
                                (2,'Ananya','Mishra','Admin','P2','Delhi(DEL)','1968-05-02','F'),
                                (3,'Rohan','Diwan','Account','P3','Mumbai(BOM)','1980-01-01','M'),
                                (4,'Sonia','Kulkarni','HR','P1','Hyderabad(HYD)','1962-05-02','F'),
                                (5,'Ankit','Kapoor','Admin','P2','Delhi(DEL)','1994-07-03','M');
                                
insert into employeeposition values (1,'Manager','2022-05-01',50000),
                                    (2,'Executive','2022-05-02',75000),
                                    (3,'Manager','2022-05-01',90000),
                                    (2,'Lead','2022-05-02',85000),
                                    (1,'Executive','2022-05-01',300000);
                                    
-- 1. Write a query to fetch the EmpFname from the employeeinfo table in uppercase and use the allias name as EmpName
select upper(EmpFname) as EmpName
from employeeinfo;

-- 2.write a query to fetch the number of employees working in the department 'HR'
select count(EmpID) as no_of_emp
from employeeinfo
where department = 'HR';

-- 3. write a query to get current date
select curdate();

-- 4.Write a query to retrive first four characters of EmpLname from the employeeinfo table
select substr(EmpLname,1,4) as short_name
from employeeinfo;

-- 5.write a query to create new table which consist of data and structered copied from other table
create table newEmployeeinfo like employeeinfo;

-- 6.write a query to find all employees whoes salary is between 50000 to 100000
select *
from EmployeePosition
where salary between 50000 and 100000;

-- 7.write a query to find the names of employees that begin with 'S'
select EmpFname 
from Employeeinfo
where EmpFname like 's%';

-- 8.write a query to fetch top 4 record from employeeinfo table
select * from Employeeinfo limit 4;

-- 9.write a query to retrive EmpFname and EmpLname in single column as 'FullName' and it should be seperated with space
select concat(EmpFname,' ',EmpLname) as FullName
from employeeinfo;

-- 10.write a query to find number of employees whoes dob is between 02/05/1970 to 31/12/1975 and are grouped according to gender
select gender,count(*) as no_of_emp
from Employeeinfo
where DOB between '1970-05-02' and '1975-12-31'
group by gender;

-- 11.Write a query to fetch all records from employeeinfo table order by EmpLname in desceding order and department in asceding order
select * 
from employeeinfo
order by EmpLname desc ,department asc;

-- 12.write a query to fetch detais of employees whoes EmpLname ends with an alphabet 'A' and contains five alphabet
select * 
from employeeinfo 
where EmpLname like '_____A';

-- 13.write a query to fetch details of all employees excludind the employees with first name 'sanjay' and 'sonia' from employeeinfo table
select * 
from employeeinfo 
where EmpFname != 'Sanjay' and EmpFname != 'Sonia';

-- 14. write a query to fetch the detais of employees with the address of DELHI(DEL)
select * 
from employeeinfo 
where address = 'Delhi(DEL)';

-- 15.write a query to fetch all employees who also hoid the managerial position
select * 
from employeeinfo
where EmpID in(select EmpID from employeeposition where EmpPosition = 'Manager');

-- 16.write a query to fetch the department wise count of employees sorted by departments count in asceding order
select count(EmpID) as no_of_emp,department
from employeeinfo 
group by department
order by no_of_emp;

-- 17.write a query to retrive two minimum and maximum salaries from the employeeposition table
-- minimum salaries
select salary
from employeeposition 
order by salary limit 2;

-- maximmum salaries
select salary
from employeeposition 
order by salary desc limit 2;

-- 18.write a query to find fifth highest salary from the table
select salary
from employeeposition 
order by salary desc limit 4,1;

-- 19. write a query to retrive duplicate records from the table
select EmpID,EmpFname
from employeeinfo
where EmpFname in (select EmpFname from employeeinfo group by EmpFname having count(*) > 1);

-- 20.write a query to retrive list of employees working in admin deprtment
select EmpID,EmpFname,EmpLname
from employeeinfo
where department = 'Admin';

-- 21.write a query to find third highest salary from employeeposition table
select salary 
from employeeposition 
order by salary desc 
limit 2,1;

-- 22.write a query to display first and last record from the employeeinfo table
select * from employeeinfo limit 1;
select * from employeeinfo limit 4,1;

-- 23.write a query to retrive departments who have less then two employees working on it
select department,count(EmpID) as emp_count 
from employeeinfo 
group by department 
having emp_count < 2;

-- 24.write a query to retrive empposition along with total salaries paid for each of them
select EmpPosition , sum(salary) as total_sal
from employeeposition 
group by empposition;

-- 25 write a query to fetch 50% record from the employeeinfo table
select Top('50%') from employeeinfo;
















                                
