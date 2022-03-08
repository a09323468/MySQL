-- 01.請列出薪資比所有SALESMAN還低的員工
select 
	ENAME, SAL, JOB 
from 
	EMP
where 
	SAL < (
		select min(SAL)
        from EMP
        where JOB = 'SALESMAN');

-- 02.請列出到職年(到職日之年)最早的兩年，那兩年到職的員工，並依到職日排序
select
	e.*
from
	EMP e
	join (
		select distinct
			YEAR(HIREDATE) as year
		from
			EMP
		order by
			YEAR(HIREDATE)
		limit
			2) t1
	on YEAR(e.HIREDATE) = t1.YEAR
order by
	e.HIREDATE;

-- 03.請列出主管的主管是KING 的員工
select
	*
from
	EMP
where
	MGR in(
		select
			EMPNO
		from
			EMP
		where
			MGR = (
				select
					EMPNO
				from
					EMP
				where
					ENAME = 'KING'));

-- 04.請列出部門內員工薪資有3種薪資等級之部門名稱、部門所在地
select
	DNAME, LOC
from
	DEPT
where
	DEPTNO in(
		select
			e.DEPTNO
		from
			EMP e
		    join SAL_LEVEL sl
				on e.SAL between sl.SAL_MIN and sl.SAL_MAX
		group by
			e.DEPTNO
		having
			count(distinct sl.LEVEL) = 3
	);

-- 05.請列出跟員工姓名最後一字元是S的員工同部門，該部門薪資最低的員工之部門名稱、姓名、
-- 薪資
select DNAME,ENAME,SAL
from EMP e
	left join DEPT d
		on e.DEPTNO = d.DEPTNO
where (e.DEPTNO,e.SAL) 
	in (select DEPTNO,MIN(SAL)
		from EMP
		where DEPTNO
			in(	select distinct DEPTNO
				from EMP
				where ENAME like'%S')
		group by DEPTNO
        );