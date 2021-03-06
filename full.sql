USE [master]
GO
/****** Object:  Database [dbsql]    Script Date: 5/2/2020 11:47:43 PM ******/
CREATE DATABASE [dbsql]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbsql_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbsql.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbsql_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbsql.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbsql] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbsql].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbsql] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbsql] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbsql] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbsql] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbsql] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbsql] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbsql] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbsql] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbsql] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbsql] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbsql] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbsql] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbsql] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbsql] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbsql] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbsql] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbsql] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbsql] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbsql] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbsql] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbsql] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbsql] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbsql] SET RECOVERY FULL 
GO
ALTER DATABASE [dbsql] SET  MULTI_USER 
GO
ALTER DATABASE [dbsql] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbsql] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbsql] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbsql] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbsql] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbsql', N'ON'
GO
ALTER DATABASE [dbsql] SET QUERY_STORE = OFF
GO
USE [dbsql]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[crs_id] [int] NOT NULL,
	[crs_name] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[crs_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[dept_id] [int] IDENTITY(1,1) NOT NULL,
	[dept_name] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[exam_id] [int] NOT NULL,
	[exam_date] [datetime] NULL,
	[grade] [int] NULL,
	[st_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[ins_id] [int] NOT NULL,
	[ins_name] [nvarchar](max) NULL,
	[dept_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ins_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instructor_course]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor_course](
	[crs_id] [int] NOT NULL,
	[ins_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[crs_id] ASC,
	[ins_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Q_multichoice]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Q_multichoice](
	[Q_id] [int] NULL,
	[choice1] [nvarchar](max) NOT NULL,
	[choice2] [nvarchar](max) NOT NULL,
	[choice3] [nvarchar](max) NOT NULL,
	[multichoice_id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[multichoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions_Exam]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions_Exam](
	[Q_id] [int] NOT NULL,
	[exam_id] [int] NOT NULL,
	[st_Answer] [varchar](50) NULL,
	[ques_grade] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Q_id] ASC,
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questoins]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questoins](
	[Q_id] [int] NOT NULL,
	[question] [nvarchar](max) NOT NULL,
	[right_answer] [nvarchar](max) NOT NULL,
	[Ques_Type] [varchar](2) NOT NULL,
	[crs_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Q_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[st_id] [int] IDENTITY(1,1) NOT NULL,
	[st_Fname] [nvarchar](max) NOT NULL,
	[st_Lname] [nvarchar](max) NOT NULL,
	[st_age] [int] NOT NULL,
	[st_address] [nvarchar](max) NOT NULL,
	[dept_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[st_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_course]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_course](
	[crs_id] [int] NOT NULL,
	[st_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[crs_id] ASC,
	[st_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[topic_id] [int] NOT NULL,
	[topic_name] [nvarchar](max) NULL,
	[crs_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[topic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exam] ADD  DEFAULT (getdate()) FOR [exam_date]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD FOREIGN KEY([st_id])
REFERENCES [dbo].[student] ([st_id])
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD FOREIGN KEY([dept_id])
REFERENCES [dbo].[Department] ([dept_id])
GO
ALTER TABLE [dbo].[instructor_course]  WITH CHECK ADD FOREIGN KEY([crs_id])
REFERENCES [dbo].[Course] ([crs_id])
GO
ALTER TABLE [dbo].[instructor_course]  WITH CHECK ADD FOREIGN KEY([ins_id])
REFERENCES [dbo].[Instructor] ([ins_id])
GO
ALTER TABLE [dbo].[Q_multichoice]  WITH CHECK ADD FOREIGN KEY([Q_id])
REFERENCES [dbo].[Questoins] ([Q_id])
GO
ALTER TABLE [dbo].[Questions_Exam]  WITH CHECK ADD FOREIGN KEY([Q_id])
REFERENCES [dbo].[Questoins] ([Q_id])
GO
ALTER TABLE [dbo].[Questions_Exam]  WITH CHECK ADD FOREIGN KEY([exam_id])
REFERENCES [dbo].[Exam] ([exam_id])
GO
ALTER TABLE [dbo].[Questoins]  WITH CHECK ADD FOREIGN KEY([crs_id])
REFERENCES [dbo].[Course] ([crs_id])
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD FOREIGN KEY([dept_id])
REFERENCES [dbo].[Department] ([dept_id])
GO
ALTER TABLE [dbo].[student_course]  WITH CHECK ADD FOREIGN KEY([crs_id])
REFERENCES [dbo].[Course] ([crs_id])
GO
ALTER TABLE [dbo].[student_course]  WITH CHECK ADD FOREIGN KEY([st_id])
REFERENCES [dbo].[student] ([st_id])
GO
ALTER TABLE [dbo].[Topics]  WITH CHECK ADD FOREIGN KEY([crs_id])
REFERENCES [dbo].[Course] ([crs_id])
GO
/****** Object:  StoredProcedure [dbo].[alldepartments]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[alldepartments]
as
select * from Department
GO
/****** Object:  StoredProcedure [dbo].[allexams]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[allexams]
as
select * from Exam
GO
/****** Object:  StoredProcedure [dbo].[course_delete]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[course_delete](@id int)
as
if exists(select crs_id from Course where crs_id=@id)
	delete from Course where crs_id=@id
else
	select 'invalid course_id'
GO
/****** Object:  StoredProcedure [dbo].[Course_Grade]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Course_Grade] @st_id int
as
select crs_name as [Course], sum(grade )as [Student Grade]
from Student s ,Course c,student_course sc, Exam e
where @st_id=s.st_id and s.st_id=sc.st_id and c.crs_id=sc.crs_id
  and  e.st_id=s.st_id	   
group by  crs_name
return
GO
/****** Object:  StoredProcedure [dbo].[course_insert]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[course_insert](@id int, @crs_name varchar(50)) 
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
GO
/****** Object:  StoredProcedure [dbo].[course_select]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[course_select] @id int
as
if exists(select crs_id from Course where crs_id = @id)
		select * from Course
		where crs_id = @id
else 
		select 'not found'
GO
/****** Object:  StoredProcedure [dbo].[course_update]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[course_update](@id int, @crs_name varchar(50))
as
if exists(select crs_id from Course where crs_id =@id)
begin 
	update Course set crs_name=@crs_name
	where crs_id=@id
end
else
	select 'invalid course_id'
GO
/****** Object:  StoredProcedure [dbo].[departmentstudents]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[departmentstudents] 
@dptID int
as
select * 
from student s
where s.dept_id = @dptID
GO
/****** Object:  StoredProcedure [dbo].[dept_delete]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dept_delete](@id int)
as
if exists(select dept_id from Department where dept_id=@id)
	delete from Department where dept_id=@id
else
	select 'invalid student_id'
GO
/****** Object:  StoredProcedure [dbo].[dept_insert]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dept_insert](@id int, @deptname varchar(50)) 
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
GO
/****** Object:  StoredProcedure [dbo].[dept_select]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dept_select] @id int
as
if exists(select dept_id from Department where dept_id = @id)
		select * from Department
		where dept_id = @id
else 
		select 'not found'
GO
/****** Object:  StoredProcedure [dbo].[dept_update]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dept_update](@id int, @deptname varchar(50))
as
if exists(select dept_id from Department where dept_id =@id)
begin 
	update Department set dept_name=@deptname
	where dept_id=@id
end
else
	select 'invalid department_id'
GO
/****** Object:  StoredProcedure [dbo].[exam_delete]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[exam_delete](@id int)
as
if exists(select exam_id from Exam where exam_id=@id)
	delete from Exam where exam_id=@id
else
	select 'invalid exam_id'
GO
/****** Object:  StoredProcedure [dbo].[exam_select]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[exam_select] @id int
as
if exists(select exam_id from Exam where exam_id = @id)
		select * from Exam
		where exam_id = @id
else 
		select 'not found'
GO
/****** Object:  StoredProcedure [dbo].[exam_update]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[exam_update](@id int, @exam_date datetime, @st_id int)
as
if exists(select exam_id from Exam where exam_id =@id)
begin 
	update Exam set exam_date=@exam_date,st_id=@st_id
	where exam_id=@id
end
else
	select 'invalid exam_id'
GO
/****** Object:  StoredProcedure [dbo].[GenerateExam]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[GenerateExam] @crsID int , @TFN int , @MCN int
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
GO
/****** Object:  StoredProcedure [dbo].[Get_Ins_Crss]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[Get_Ins_Crss] @ins_id int
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
GO
/****** Object:  StoredProcedure [dbo].[getallcourses]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getallcourses]
as
select *
from Course
GO
/****** Object:  StoredProcedure [dbo].[getallins]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getallins]
as
select * from Instructor
GO
/****** Object:  StoredProcedure [dbo].[getQuesByExamIDStudID]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getQuesByExamIDStudID]
@examID int,@studID int
as 
begin
select q.question , qe.st_Answer
from Questoins q inner join Questions_Exam qe
on q.Q_id = qe.Q_id and qe.exam_id = @examID
inner join Exam ex 
on qe.exam_id = ex.exam_id and ex.st_id =@studID
end
GO
/****** Object:  StoredProcedure [dbo].[getQuestionsBExamID]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getQuestionsBExamID]
@examID int
as 
begin
select q.question ,qm.choice1,qm.choice2,qm.choice3
from Questoins q inner join Questions_Exam qe
on q.Q_id = qe.Q_id and qe.exam_id = @examID
inner join Q_multichoice qm
on qm.Q_id = q.Q_id and q.Ques_Type = 'm'
union
select q.question ,'true','false', '' 
from Questoins q inner join Questions_Exam qe
on q.Q_id = qe.Q_id and qe.exam_id = @examID
end
GO
/****** Object:  StoredProcedure [dbo].[getQuestionsByExamID]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getQuestionsByExamID]
@examID int
as 
begin
select q.question ,qm.choice1,qm.choice2,qm.choice3
from Questoins q inner join Questions_Exam qe
on q.Q_id = qe.Q_id and qe.exam_id = @examID
left join Q_multichoice qm
on qm.Q_id = q.Q_id
end
GO
/****** Object:  StoredProcedure [dbo].[getTopicsByCourseID]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTopicsByCourseID]
@courseID int
as 
begin
select t.topic_id,t.topic_name
from Course c inner join Topics t
on c.crs_id = t.crs_id and t.crs_id = @courseID
end
GO
/****** Object:  StoredProcedure [dbo].[ins_delete]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ins_delete](@id int)
as
if exists(select ins_id from Instructor where ins_id=@id)
	delete from Instructor where ins_id=@id
else
	select 'invalid student_id'
GO
/****** Object:  StoredProcedure [dbo].[ins_insert]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ins_insert](@id int, @ins_name varchar(50), @dept_id int) 
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
GO
/****** Object:  StoredProcedure [dbo].[ins_select]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ins_select] @id int
as
if exists(select ins_id from Instructor where ins_id = @id)
		select * from Instructor
		where ins_id = @id
else 
		select 'not found'
GO
/****** Object:  StoredProcedure [dbo].[ins_update]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ins_update](@id int, @ins_name varchar(50), @dept_id int)
as
if exists(select ins_id from Instructor where ins_id =@id)
begin 
	update Instructor set ins_name=@ins_name
	where ins_id=@id
end
else
	select 'invalid department_id'
GO
/****** Object:  StoredProcedure [dbo].[insert_student_course]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insert_student_course] @stid int ,@crid int
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
GO
/****** Object:  StoredProcedure [dbo].[select_st_course]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[select_st_course] @stid int
as
if exists (select st_id from student where st_id=@stid)
begin
	select *from student_course where st_id=@stid
end
else
	select 'invalid student id'
GO
/****** Object:  StoredProcedure [dbo].[std_all_select]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[std_all_select]
as
select * from student
GO
/****** Object:  StoredProcedure [dbo].[std_delete]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[std_delete](@id int)
as
if exists(select st_id from student where st_id=@id)
	delete from student where st_id=@id
else
	select 'invalid student_id'
GO
/****** Object:  StoredProcedure [dbo].[std_exams]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[std_exams]
@stid int
as
begin
select * from Exam
where st_id = @stid
end
GO
/****** Object:  StoredProcedure [dbo].[std_insert]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[std_insert](@id int, @fname varchar(50), @lname varchar(50),
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
GO
/****** Object:  StoredProcedure [dbo].[std_select]    Script Date: 5/2/2020 11:47:43 PM ******/
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
/****** Object:  StoredProcedure [dbo].[std_update]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[std_update](@id int, @fname varchar(50), @lname varchar(50), 
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
GO
/****** Object:  StoredProcedure [dbo].[students]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[students]
as
select *,  CONVERT(varchar,st_id) +'-'+ st_Fname + ' ' + st_Lname as [FullName] from student
GO
/****** Object:  StoredProcedure [dbo].[topic_delete]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[topic_delete](@id int)
as
if exists(select topic_id from Topics where topic_id=@id)
	delete from Topics where topic_id=@id
else
	select 'invalid topic_id'
GO
/****** Object:  StoredProcedure [dbo].[topic_insert]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc  [dbo].[topic_insert](@id int, @topic_name varchar(50), @crs_id int) 
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
GO
/****** Object:  StoredProcedure [dbo].[topic_select]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[topic_select] @id int
as
if exists(select topic_id from Topics where topic_id = @id)
		select * from Topics
		where topic_id = @id
else 
		select 'not found'
GO
/****** Object:  StoredProcedure [dbo].[topic_update]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[topic_update](@id int, @topic_name varchar(50), @crs_id int)
as
if exists(select topic_id from Topics where topic_id =@id)
begin 
	update Topics set topic_name=@topic_name,crs_id=@crs_id
	where topic_id=@id
end
else
	select 'invalid topic_id'
GO
/****** Object:  StoredProcedure [dbo].[update_course_student]    Script Date: 5/2/2020 11:47:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[update_course_student] @stid int ,@crsid int
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
GO
USE [master]
GO
ALTER DATABASE [dbsql] SET  READ_WRITE 
GO
