alter proc students
as
select *,  CONVERT(varchar,st_id) +'-'+ st_Fname + ' ' + st_Lname as [FullName] from student