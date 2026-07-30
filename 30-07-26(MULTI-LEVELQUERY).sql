use corr_db;

-- in operator --
select * from employee_c
where salary in (select salary 
		from employee_c
        where name='a');
        
-- any operator --
select * from employee_c
where salary =any (select salary 
		from employee_c
        where name='a');

-- any operator --
select * from employee_c
where salary < any (select salary 
		from employee_c
        where name='a');    

-- all operator --
select * from employee_c
where salary =all (select salary 
		from employee_c
        where name='a');
        
-- all operator --
select * from employee_c
where salary > all (select salary 
		from employee_c
        where name='a');    

        