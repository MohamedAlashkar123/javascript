USE [dbsql]
GO

/****** Object:  StoredProcedure [dbo].[std_select]    Script Date: 4/30/2020 4:51:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[std_select] @id int
as
if exists(select st_id from student where st_id = @id)
		select * from student
		where st_id = @id
else 
		select 'not found'
GO

create proc std_all_select
as
select * from student
GO



create proc allexams
as
select * from Exam



create proc std_exams 
@stid int
as
begin
select * from Exam
where st_id = @stid
end


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


getQuesByExamIDStudID 9,23

Fg


alter proc Course_Grade @st_id int
as
select crs_name as [Course], sum(grade )as [Student Grade]
from Student s ,Course c,student_course sc, Exam e
where @st_id=s.st_id and s.st_id=sc.st_id and c.crs_id=sc.crs_id
  and  e.st_id=s.st_id	   
group by  crs_name
return


Course_Grade 23




alter proc getQuestionsByExamID
@examID int
as 
begin
select q.question ,qm.choice1,qm.choice2,qm.choice3
from Questoins q inner join Questions_Exam qe
on q.Q_id = qe.Q_id and qe.exam_id = @examID
left join Q_multichoice qm
on qm.Q_id = q.Q_id
end

getQuestionsByExamID 9


select q.question ,qm.choice1,qm.choice2,qm.choice3
from Questoins q inner join Questions_Exam qe
on q.Q_id = qe.Q_id and qe.exam_id = 9
left join Q_multichoice qm
on qm.Q_id = q.Q_id













alter proc  Get_Ins_Crs @ins_id int
with encryption
as 
begin
select ins_name [Instructor Name ], crs_name as [Course Name],
																(select count(s.st_id)
																from course c , student s ,student_course sc 
																where s.st_id=sc.st_id and c.crs_id=sc.crs_id 
																group by sc.crs_id ) as [Number of Student]
from course c ,  Instructor i ,instructor_course ic
where @ins_id=i.ins_id   and
      i.ins_id=ic.ins_id and
	  c.crs_id=ic.crs_id 
end

select i.ins_name ,c.crs_name,(select count(sc.st_id) 
							   from student s inner join student_course sc
							   on s.st_id = sc.st_id 
							   inner join Course cc
							   on sc.crs_id = cc.crs_id )
from Instructor i inner join instructor_course ic
on i.ins_id = ic.ins_id and i.ins_id = 1
inner join Course c
on c.crs_id = ic.crs_id

create proc getallcourses
as
select *
from Course




select i.ins_name, c.crs_name , ( select count(s.st_id)
							from course c , student s ,student_course sc 
							where s.st_id = sc.st_id and c.crs_id = sc.crs_id 
                            group by sc.crs_id ) 
from course c ,  Instructor i ,instructor_course ic
where i.ins_id = ic.ins_id and c.crs_id = ic.crs_id and i.ins_id = 1 



create proc getallins
as
select * from Instructor





create  proc generateexam
@course int ,@m int , @t int 
with encryption
as
begin 
with cte as
(
select top (@m) s.question , ms.choice1 ,ms.choice2 , ms.choice3
from Questoins s , Q_multichoice ms
where s.q_id = ms.q_id and  s.crs_id = @course
order by NEWID()
)
select * from cte
union
select top (@t) q.question , 'True' , 'False' , ''
from Questoins q
where q.crs_id = @course
order by NEWID()
end 


with cte as
(
select top (3) s.question , ms.choice1 ,ms.choice2 , ms.choice3
from Questoins s , Q_multichoice ms
where s.q_id = ms.q_id and  s.crs_id = 3 
order by NEWID()
)
select * from cte
union
select top (3) q.question , 'True' , 'False' , ''
from Questoins q
where q.crs_id = 3
order by NEWID();

create  proc generatexam
@course int ,@m int , @t int 
with encryption
as
begin 
select top (@m) s.question , ms.choice1 ,ms.choice2 , ms.choice3
from Questoins s , Q_multichoice ms
where s.q_id = ms.q_id and  s.crs_id = @course and s.Q_id in (select top 99 percent Q_id from Questoins order by newid())
union
select  top (@t) question , 'True' , 'False' , ''
from Questoins 
where crs_id = @course and Q_id in (select top 99 percent Q_id from Questoins order by newid())
end



generatexam 3,5,5



alter proc  Get_Ins_Crss @ins_id int
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



select  * from [yourtable] where [yourPk] in 
(select top 10 percent [yourPk] from [yourtable] order by newid())





------------------------Generate Exam------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
select * 
from (select top 3 s.question AS [Question] , ms.choice1 AS [Answer One] ,ms.choice2 AS [Answer Two]  , ms.choice3 AS [Answer Three] , 0 as ordinal
      from Questoins s , Q_multichoice ms
      where s.q_id = ms.q_id and  s.crs_id = 3
      order by NEWID()) AS A1

union

select * 
from (select top 3 q.question AS [Question]  , 'True' AS [Answer One] , 'False' AS [Answer Two], ' ' AS [Answer Three], 1 as ordinal
      from Questoins q
      where q.crs_id = 3
      order by NEWID()) AS A2

order by ordinal

--GenerateExam 3 ,4 ,2

alter proc  GenerateExam @crsID int , @TFN int , @MCN int
as 
begin
select * 
from (select top (@MCN) s.question AS [Question] , ms.choice1 AS [Answer One] ,ms.choice2 AS [Answer Two]  , ms.choice3 AS [Answer Three] , 0 as ordinal
      from Questoins s , Q_multichoice ms
      where s.q_id = ms.q_id and  s.crs_id = @crsID
      order by NEWID()) AS A1

union

select * 
from (select top (@TFN) q.question AS [Question]  , 'True' AS [Answer One] , 'False' AS [Answer Two], ' ' AS [Answer Three], 1 as ordinal
      from Questoins q
      where q.crs_id = @crsID
      order by NEWID()) AS A2

order by ordinal
end
--------------------------------------------------------------
--------------------------------------------------------------

SELECT * 
FROM (SELECT TOP 10 s.st_Fname, 0 AS Ordinal
      FROM student s
      ORDER BY NEWID()) AS A1

UNION ALL

SELECT * 
FROM (SELECT TOP 3 s.st_Fname, 1 AS Ordinal
      FROM student s
      ORDER BY NEWID()) AS A2

ORDER BY Ordinal





create proc departmentstudents 
@dptID int
as
select * 
from student s
where s.dept_id = @dptID


















