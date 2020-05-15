create procedure insertdept
@dept_id int,
@dept_name varchar(50)
as
begin
 insert into dbo.Department (dept_id,dept_name) values (@dept_id,@dept_name)
end

create procedure insertexam
@exam_id int,
@exam_date datetime,
@st_id int
as
begin
 insert into Exam (exam_id,exam_date,st_id) values (@exam_id,@exam_date,@st_id)
end

create procedure insertinstructor
@ins_id int,
@ins_name varchar (50),
@dept_id int
as
begin
 insert into Instructor(ins_id,ins_name,dept_id) values (@ins_id,@ins_name,@dept_id)
end

create procedure insertinstructor_course
@crs_id int,
@ins_id int
as
begin
 insert into instructor_course(crs_id,ins_id) values (@crs_id,@ins_id)
end

create procedure insertQ_multichoice
@Q_id int,
@choice1 varchar(50),
@choice2 varchar(50),
@choice3 varchar(50),
@multichoice_id int
as
begin
 insert into Q_multichoice(Q_id,choice1,choice2,choice3,multichoice_id)
 values (@Q_id,@choice1,@choice2,@choice3,@multichoice_id)
end


create procedure insertQ_Tru_Fls
@q_id int,
@True varchar(50),
@False varchar(50),
@Tru_Fls_id int
as
begin
 insert into Q_Tru_Fls(q_id,True,False,Tru_Fls_id)
 values (@q_id,@True,@False,@Tru_Fls_id)
end

create procedure insertquestionexam
@q_id int,
@exam_id int,
@st_Answer varchar(50)
as
begin
 insert into Questions_Exam(q_id,exam_id,st_Answer)
 values (@q_id,@exam_id,@st_Answer)
end

create procedure insertquestions
@Q_id int,
@question varchar (100) ,
@right_answer varchar(50),
@Ques_Type varchar(2),
@crs_id int
as
begin
 insert into Questoins(Q_id,question,right_answer,Ques_Type,crs_id)
 values (@Q_id,@question,@right_answer,@Ques_Type,@crs_id)
end


create procedure insertstudent
@st_id int,
@st_Fname varchar (100) ,
@st_Lname varchar(50),
@st_age int,
@st_address varchar (50),
@dept_id int
as
begin
 insert into student(st_id,st_Fname,st_Lname,st_age,st_address,dept_id)
 values (@st_id,@st_Fname,@st_Lname,@st_age,@st_address,@dept_id)
end


create procedure insertstudentcourse
@crs_id int,
@st_id int
as
begin
 insert into student_course(crs_id,st_id)
 values (@crs_id,@st_id)
end


create procedure inserttopics
@topic_id int ,
@topic_name varchar(50),
@crs_id int
as
begin
 insert into Topics (topic_id,topic_name,crs_id)
 values (@topic_id,@topic_name,@crs_id)
end

create procedure insertcourse
@crs_id int,
@crs_name varchar(50)
as
begin
 insert into Course(crs_id,crs_name)
 values (@crs_id,@crs_name)
end
----------------------------------------------
--update--

create procedure updtecourse1
@crs_id int,
@crs_name varchar(50)
as
begin
  update Course set 
  crs_name=@crs_name
  where crs_id=@crs_id 
end


create procedure updtdept1
@dept_id int,
@dept_name varchar(50)
as
begin
  update Department set
  dept_name=@dept_name
  where dept_id =@dept_id 
end


create procedure updtexam1
@exam_id int,
@exam_date datetime,
@st_id int
as
begin
 update Exam set 
 exam_date=@exam_date
 where exam_id=@exam_id   and     st_id=@st_id
end


create procedure updteinstuctor1
@ins_id int,
@ins_name varchar (50),
@dept_id int
as
begin
 update Instructor set 
 ins_name=@ins_name
 where ins_id=@ins_id and dept_id=@dept_id
end


create procedure updteinscrs
@crs_id int,
@ins_id int
as
begin
 update instructor_course set
 crs_id=@crs_id ,ins_id=@ins_id
end

create procedure updtq_mltchoic
@Q_id int,
@choice1 varchar(50),
@choice2 varchar(50),
@choice3 varchar(50),
@multichoice_id int
as
begin
 update Q_multichoice set
 choice1=@choice1 ,choice2=@choice2,choice3=@choice3
 where multichoice_id=@multichoice_id and Q_id=@Q_id 
end


create procedure updtq_trfls
@q_id int,
@True varchar(50),
@False varchar(50),
@True_Fls_id int 
as
begin
 update Q_Tru_Fls set 
 True=@True ,False=@False
 where Tru_Fls_id=@True_Fls_id and q_id=@q_id 
end
 


create procedure updtquesexam1
@exam_id int,
@st_Answer varchar(50)
as
begin
 update Questions_Exam set
st_Answer=@st_Answer
where exam_id=@exam_id
end

create procedure updtques1
@Q_id int,
@question varchar (100) ,
@right_answer varchar(50),
@Ques_Type varchar(2),
@crs_id int
as
begin
 update Questoins set
 question=@question,right_answer=@right_answer,Ques_Type=@Ques_Type
 where Q_id=@Q_id  and   crs_id=@crs_id
end


create procedure updtstud1
@st_Fname varchar (100) ,
@st_Lname varchar(50),
@st_age int,
@st_address varchar (50),
@dept_id int,
@ID int
as
begin
 update student set
 st_Fname=@st_Fname,st_Lname=@st_Lname,st_age=@st_age,st_address=@st_address,dept_id=@dept_id
 where st_id=@ID
end

create procedure updtstudcrss
@crs_id int,
@st_id int
as
begin
 update student_course set
 crs_id=@crs_id,st_id=@st_id where crs_id=@crs_id and st_id=@st_id
end
drop proc updtstudcrs
 
create procedure updttopice
@topic_id int ,
@topic_name varchar(50),
@crs_id int
as
begin
 update Topics set
 topic_name=@topic_name
 where topic_id=@topic_id and crs_id=@crs_id
end

-------------------------------------------------------
 create proc delcourse
 @crs_id int
 as
 begin 
 delete Course where crs_id=@crs_id
 end

 create procedure deldept
@dept_id int
as
begin
   delete Department 
  where dept_id =@dept_id 
end

create procedure delexam
@exam_id int,
@st_id int
as
begin
 delete Exam
 where exam_id=@exam_id   and     st_id=@st_id
end

create procedure delinstructor
@ins_id int,
@dept_id int
as
begin
 delete Instructor
 where ins_id=@ins_id and dept_id=@dept_id
end

create procedure delmultichoice
@Q_id int,
@multichoice_id int
as
begin
 delete Q_multichoice 
 where multichoice_id=@multichoice_id and Q_id=@Q_id
end


create procedure delq_trfls1
@q_id int,
@True_Fls_id int 
as
begin
 delete Q_Tru_Fls
 where Tru_Fls_id=@True_Fls_id and q_id=@q_id
end

create procedure delquesexam1
@exam_id int
as
begin
 delete Questions_Exam
where exam_id=@exam_id
end

create procedure delques
@Q_id int,
@crs_id int
as
begin
 delete Questoins
 where Q_id=@Q_id  and   crs_id=@crs_id
end

create procedure delstud1
@ID int
as
begin
 delete student 
 where st_id=@ID
end

create procedure delstudcrs
@crs_id int,
@st_id int
as
begin
 delete student_course where crs_id=@crs_id and st_id=@st_id
end

create procedure deltopice
@topic_id int ,
@crs_id int
as
begin
 delete Topics
 where topic_id=@topic_id and crs_id=@crs_id
end