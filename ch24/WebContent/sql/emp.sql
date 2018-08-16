select a.eno eno,
       c.dname dname, 
       a.ename ename,
       b.ename mname, 
       a.hiredate hiredate, 
       a.salary salary 
  from emp1 a, 
       emp1 b, 
       dept c
 where a.manager=b.eno
   and a.dno = c.no
   and a.eno = 7788
   ;
   
select * from dept;  

insert into emp1 select * from emp1 where eno=7788;
create table emp1_temp as

insert into emp1_temp
select distinct * from emp1 
where eno in (select eno from emp1 group by eno having count(*)>1);


truncate table emp1_temp;
select * from emp1_temp;

delete from emp1 where eno=7788;
insert into emp1 select * from emp1_temp;


alter table emp1 modify eno number(4) not null;

-- alter table 테이블명 add constraint 키명 primary key(칼럼)
alter table emp1 add constraint emp1_pk primary key (eno);


select * from dept;

select eno, ename 
  from emp1 
 where eno in (select distinct manager from emp1)
 order by eno
 ;

 
select distinct manager from emp1;

select * from emp1 where eno = 7369;

create table privs(password varchar2(10));
insert into privs values('1234');
select * from privs;



select * from emp where eno = 7369
union all
select * from emp1 where eno = 7369


select object_name, status from user_objects where object_type='TRIGGER';
select status,trigger_name,trigger_type,triggering_event,table_name, trigger_body 
from user_triggers;


drop table emp1_history;
create table emp1_history as select * from emp1 where rownum =0; 
select * from emp1_history;

select lower(column_name)||',' from cols where table_name='EMP1_HISTORY';

alter table emp1_history add  changedate date;

drop  trigger trg_emp1_d;

--사원정보 삭제 트리거
create trigger trg_emp1_d
after delete on emp1
for each row
begin
	insert into emp1_history(eno, ename, job, manager, 
	                         hiredate, salary, commission,
	                         dno, changedate) 
	                  values(:old.eno,:old.ename,:old.job,
	                         :old.manager,:old.hiredate,
	                         :old.salary,:old.commission,
	                         :old.dno, sysdate);
end; 


select * from emp1_history;



select * from emp1 order by eno;


select nvl(max(eno),0)+1 from emp1 ;




