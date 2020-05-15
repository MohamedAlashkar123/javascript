create database SQLExamOnline
go
use SQLExamOnline
create table Department
(
dept_id int primary key identity,
dept_name nvarchar(max) not null,
)

create table student 
(
st_id int primary key identity ,
st_Fname nvarchar(max) not null,
st_Lname nvarchar(max) not null,
st_age int not null ,
st_address nvarchar(max) not null,
dept_id int foreign key references department(dept_id)
)
create table Instructor
(
ins_id int primary key,
ins_name nvarchar(max),
dept_id int foreign key references department(dept_id)
)
create table Course
(
crs_id int primary key ,
crs_name nvarchar(max)
)
create table instructor_course
(
crs_id int foreign key references course(crs_id),
ins_id int foreign key references Instructor(ins_id),
primary key(crs_id,ins_id)
)
create table student_course
(
crs_id int foreign key references course(crs_id),
st_id int foreign key references student(st_id),
primary key(crs_id,st_id)
)
create table Topics 
(
topic_id int primary key,
topic_name nvarchar(max),
crs_id int foreign key references course(crs_id),
)
create table Exam 
(
exam_id int primary key identity ,
exam_date datetime default getdate(),
grade int ,
st_id int foreign key references student(st_id),
)
create table Questoins 
(
Q_id int primary key,
question nvarchar(max) not null,
right_answer nvarchar(max) not null,
Ques_Type varchar(2) not null,
crs_id int foreign key references course(crs_id),
)
create table Q_multichoice
(
Q_id int foreign key references questoins(Q_id),
choice1 nvarchar(max) not null,
choice2 nvarchar(max) not null, 
choice3 nvarchar(max) not null, 
multichoice_id int primary key identity 
)
create table Questions_Exam
(
Q_id int foreign key references questoins(Q_id),
exam_id int foreign key references exam(exam_id),
primary key (Q_id,exam_id),
st_Answer nvarchar(max),

)
go
--------------------------------------------------------------------------
--tables stored procedures



-------------------------------student table -----------------------------------
------select----
create proc std_select @id int
as
if exists(select st_id from student where st_id = @id)
		select * from student
		where st_id = @id
else 
		select 'not found'




------insert-----
create proc std_insert(@id int, @fname varchar(50), @lname varchar(50),
 @age int, @add varchar(50), @dept_id int)
as 
begin
if not exists (select st_id from student where st_id =@id)
begin
	if exists(select dept_id from department where dept_id =@dept_id)
	begin
	insert into student
	Values(@fname,@lname,@age,@add,@dept_id)
	end
	else
		select 'invalid department_id'
end
else
	select 'duplicated student_id'
end


------------update----------
create proc std_update(@id int, @fname varchar(50), @lname varchar(50), 
@age int, @add varchar(50), @dept_id int)
as
if exists(select st_id from student where st_id =@id)
begin 
	update student set st_Fname=@fname, st_Lname=@lname, st_age=@age,
	st_address=@add, dept_id=@dept_id
	where st_id=@id
end
else
	select 'invalid student_id'



-----------delete -----------
create proc std_delete(@id int)
as
if exists(select st_id from student where st_id=@id)
	delete from student where st_id=@id
else
	select 'invalid student_id'



-----------------------------student course---------------------------------------
-----insert------
create proc insert_student_course @stid int ,@crid int
as
if exists (select st_id from student where st_id=@stid)
begin
	if exists (select crs_id from course where crs_id=@crid)
	begin
		insert into student_course(st_id,crs_id)values (@stid,@crid)
	end
	else 
		select 'invalid course id'
end
else
	select 'invalid student id'

-------------------------------------------------------
--select
create proc select_st_course @stid int
as
if exists (select st_id from student where st_id=@stid)
begin
	select *from student_course where st_id=@stid
end
else
	select 'invalid student id'


------------------------------------------------------------
--update
create proc update_course_student @stid int ,@crsid int
as
if exists (select st_id from student where st_id=@stid)
begin
	if exists (select crs_id from course where crs_id=@crsid)
	begin
		update student_course set crs_id=@crsid where st_id=@stid
	end
	else 
		select 'invalid course id'
end
else
	select 'invalid student id'


-------------------------------department table -----------------------------------
create proc dept_select @id int
as
if exists(select dept_id from Department where dept_id = @id)
		select * from Department
		where dept_id = @id
else 
		select 'not found'




------insert-----
create proc dept_insert(@id int, @deptname varchar(50)) 
as 
begin
if not exists (select dept_id from Department where dept_id =@id)
begin
	insert into Department
	Values(@deptname)
end
else
	select 'duplicated department_id'
end





------------update----------
create proc dept_update(@id int, @deptname varchar(50))
as
if exists(select dept_id from Department where dept_id =@id)
begin 
	update Department set dept_name=@deptname
	where dept_id=@id
end
else
	select 'invalid department_id'



-----------delete -----------
create proc dept_delete(@id int)
as
if exists(select dept_id from Department where dept_id=@id)
	delete from Department where dept_id=@id
else
	select 'invalid student_id'




-------------------------------course table -----------------------------------
------select----
create proc course_select @id int
as
if exists(select crs_id from Course where crs_id = @id)
		select * from Course
		where crs_id = @id
else 
		select 'not found'



------insert-----
create proc course_insert(@id int, @crs_name varchar(50)) 
as 
begin
if not exists (select crs_id from Course where crs_id=@id)
begin
	insert into Course
	Values(@id,@crs_name)
end
else
	select 'duplicated course'
end



------------update----------
create proc course_update(@id int, @crs_name varchar(50))
as
if exists(select crs_id from Course where crs_id =@id)
begin 
	update Course set crs_name=@crs_name
	where crs_id=@id
end
else
	select 'invalid course_id'



-----------delete -----------
create proc course_delete(@id int)
as
if exists(select crs_id from Course where crs_id=@id)
	delete from Course where crs_id=@id
else
	select 'invalid course_id'




-------------------------------instructor table -----------------------------------
------select----
create proc ins_select @id int
as
if exists(select ins_id from Instructor where ins_id = @id)
		select * from Instructor
		where ins_id = @id
else 
		select 'not found'




------insert-----
create proc ins_insert(@id int, @ins_name varchar(50), @dept_id int) 
as 
begin
if not exists(select ins_id from Instructor where ins_id=@id)
	begin
		if  exists (select dept_id from Department where dept_id =@id)
			insert into Instructor
			Values(@id, @ins_name, @dept_id)
		else
			select 'invalid department_id'
	end
else
	select 'duplicated instructor_id'
end





------------update----------
create proc ins_update(@id int, @ins_name varchar(50), @dept_id int)
as
if exists(select ins_id from Instructor where ins_id =@id)
begin 
	update Instructor set ins_name=@ins_name
	where ins_id=@id
end
else
	select 'invalid department_id'



-----------delete -----------
create proc ins_delete(@id int)
as
if exists(select ins_id from Instructor where ins_id=@id)
	delete from Instructor where ins_id=@id
else
	select 'invalid student_id'




-------------------------------course table -----------------------------------
------select----
create proc course_select @id int
as
if exists(select crs_id from Course where crs_id = @id)
		select * from Course
		where crs_id = @id
else 
		select 'not found'



------insert-----
alter proc course_insert(@id int, @crs_name varchar(50)) 
as 
begin
if not exists (select crs_id from Course where crs_id=@id)
begin
	insert into Course
	Values(@id,@crs_name)
end
else
	select 'duplicated course'
end


------------update----------
/*
create proc course_update(@id int, @crs_name varchar(50))
as
if exists(select crs_id from Course where crs_id =@id)
begin 
	update Course set crs_name=@crs_name
	where crs_id=@id
end
else
	select 'invalid course_id'



-----------delete -----------
create proc course_delete(@id int)
as
if exists(select crs_id from Course where crs_id=@id)
	delete from Course where crs_id=@id
else
	select 'invalid course_id'



*/

-------------------------------topic table -----------------------------------
------select----
create proc topic_select @id int
as
if exists(select topic_id from Topics where topic_id = @id)
		select * from Topics
		where topic_id = @id
else 
		select 'not found'



------insert-----
create proc  topic_insert(@id int, @topic_name varchar(50), @crs_id int) 
as 
begin
if not exists(select topic_id from Topics where topic_id=@id)
	begin
		if  exists (select crs_id from Course where crs_id =@crs_id)
			insert into Topics
			Values(@id, @topic_name, @crs_id)
		else
			select 'invalid course_id'
	end
else
	select 'duplicated topic_id'
end





------------update----------
create proc topic_update(@id int, @topic_name varchar(50), @crs_id int)
as
if exists(select topic_id from Topics where topic_id =@id)
begin 
	update Topics set topic_name=@topic_name,crs_id=@crs_id
	where topic_id=@id
end
else
	select 'invalid topic_id'


-----------delete -----------
create proc topic_delete(@id int)
as
if exists(select topic_id from Topics where topic_id=@id)
	delete from Topics where topic_id=@id
else
	select 'invalid topic_id'


-------------------------------exam table -----------------------------------
------select----
create proc exam_select @id int
as
if exists(select exam_id from Exam where exam_id = @id)
		select * from Exam
		where exam_id = @id
else 
		select 'not found'




------insert-----
/*create proc  exam_insert(@id int, @exam_date datetime, @st_id int) 
as 
begin
if not exists(select exam_id from Exam where exam_id=@id)
	begin
		if  exists (select st_id  from student where st_id =@st_id)
			insert into Exam
			Values(@exam_date, @st_id)
		else
			select 'invalid student_id'
	end
else
	select 'duplicated exam_id'
end



*/
------------update----------
create proc exam_update(@id int, @exam_date datetime, @st_id int)
as
if exists(select exam_id from Exam where exam_id =@id)
begin 
	update Exam set exam_date=@exam_date,st_id=@st_id
	where exam_id=@id
end
else
	select 'invalid exam_id'



-----------delete -----------
create proc exam_delete(@id int)
as
if exists(select exam_id from Exam where exam_id=@id)
	delete from Exam where exam_id=@id
else
	select 'invalid exam_id'



----------------------------------------------------------------------------------------------------
--report stored procedures
-----------------------------------------
-- 1) return student information according to department number

create proc Get_Student_Data @dept_id int 
with encryption
as
select st_id as [Student ID] , CONCAT(st_Fname , ' ', st_Lname) as [Student Name],
st_age as [Age], st_address as [Address], dept_name as [Department]
from Student s ,Department d 
where @dept_id=d.dept_id and s.Dept_Id=d.Dept_Id
return


--------------------

-- 2) take student ID and return the grades of the student at all courses // ==>

alter proc Course_Grade @st_id int
as
select crs_name as [Course], sum(grade )as [Student Grade]
from Student s ,Course c,student_course sc, Exam e
where @st_id=s.st_id and s.st_id=sc.st_id and c.crs_id=sc.crs_id
  and  e.st_id=s.st_id	   
group by  crs_name
return


--------------------------------------------------------------------------------

--3) take instructor ID and return the name of the courses that he teaches and the number of student per course //==> 

create proc  Get_Ins_Crs @ins_id int
with encryption
as 
select ins_name [Instructor Name ], crs_name as [Course Name],
(select count(s.st_id)
from course c , student s ,student_course sc 
where s.st_id=sc.st_id and c.crs_id=sc.crs_id 
group by sc.crs_id ) as [Number of Student]
from course c ,  Instructor i ,instructor_course ic
where @ins_id=i.ins_id   and
      i.ins_id=ic.ins_id and
	  c.crs_id=ic.crs_id 

---------------------------------------------------------------
---------------------------------------------------------------
create proc getQuesByExamIDStudID
@examID int,@studID int
as 
begin
select q.question , qe.st_Answer
from Questoins q inner join Questions_Exam qe
on q.Q_id = qe.Q_id and qe.exam_id = @examID
inner join Exam ex 
on qe.exam_id = ex.exam_id and ex.st_id =@studID
end

----------------------------------------------------------------
----------------------------------------------------------------
create proc getTopicsByCourseID
@courseID int
as 
begin
select t.topic_id,t.topic_name
from Course c inner join Topics t
on c.crs_id = t.crs_id and t.crs_id = @courseID
end

------------------------------------------

alter proc getQuestionsBExamID
as 
begin
select q.question ,qm.choice1,qm.choice2,qm.choice3
from Questoins q inner join Questions_Exam qe
on q.Q_id = qe.Q_id and qe.exam_id = 1
inner join Q_multichoice qm
on qm.Q_id = q.Q_id and q.Ques_Type = 'mc'

select q.question ,'true' as [true],'false' as [false]
from Questoins q inner join Questions_Exam qe
on q.Q_id = qe.Q_id and qe.exam_id = 1
end




-----------------------------------------questoins-------------------------------------
------select
create proc ques_select @id int
as
if exists(select q_id from Questoins where Q_id = @id)
		select * from Questoins
		where Q_id = @id
else 
		select 'not found'
-
-----insert
alter proc ques_insert
(@id int, @question varchar(max), @right_answer varchar(max), @ques_type varchar(2),@crs_id int) 
as 
begin
if not exists(select q_id from Questoins where q_id=@id)
	begin
		if  exists (select crs_id from Course where crs_id =@crs_id)
			insert into Questoins
			Values(@id, @question, @right_answer,@ques_type,@crs_id)
		else
			select 'invalid course_id'
	end
else
	select 'duplicated topic_id'
end


execute ques_insert 26,'how are you','fine','t',3

--------update
create proc ques_update
(@id int, @question varchar(max), @right_answer varchar(max),@ques_type varchar(2),@crs_id int)
as
if exists(select q_id from Questoins where Q_id =@id)
begin 
	update Questoins set question=@question,right_answer=@right_answer,
						 Ques_Type=@ques_type,crs_id=@crs_id
	where Q_id=@id
end
else
	select 'invalid department_id'

ques_update 26,'how you','fe','m',16
else
	select 'invalid department_id'
------delete
create proc ques_delete(@id int)
as
if exists(select q_id from Questoins where q_id=@id)
	delete from Questoins where Q_id=@id
else
	select 'invalid student_id'