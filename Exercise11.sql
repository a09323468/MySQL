-- 01.請新建一個View，名為V_DEPT_ECOUNT，列出部門編號、部門人數
create view V_DEPT_ECOUNT
as 
select DEPTNO, COUNT(*) 
from EMP 
group by DEPTNO;

-- 02.請新建一個View，名為V_DEPT_ECOUNT2，基底資料表為第01題建立的檢視表
-- V_DEPT_ECOUNT，並將欄位依序命名為DEPARTMENT_NO、EMPLOYEE_COUNT
create view V_DEPT_ECOUNT2(DEPARTMENT_NO, EMPLOYEE_COUNT)
as 
select DEPTNO, COUNT(*) 
from V_DEPT_ECOUNT 
group by DEPTNO;

-- 03.請撰寫一select敘述，用第02題建立的檢視表V_DEPT_ECOUNT2，join資料表DEPT，
-- 列出部門名稱、部門人數
select 
	DNAME, 
    COUNT(*)
from V_DEPT_ECOUNT2
	natural join DEPT
group by DEPTNO;

-- 04.請新建一個View，名為V_EMP10，其內含有部門編號10的所有員工資料，並加上with 
-- check option限制DML
create view V_EMP10
as
select * from EMP where DEPTNO = 10
with check option;

-- 05.請修改檢視表V_DEPT_ECOUNT2，將欄位命名依序改為DEPT_NO、EMP_COUNT，
-- 其餘部分不變
alter view V_DEPT_ECOUNT2(DEPT_NO, EMP_COUNT)
as 
select * from V_DEPT_ECOUNT; 

-- 06.請移除檢視表V_DEPT_ECOUNT2
drop view if exists V_DEPT_ECOUNT2;


