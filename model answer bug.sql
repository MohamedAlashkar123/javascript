USE [TestVOne]
GO

/****** Object:  StoredProcedure [dbo].[model]    Script Date: 5/5/2020 5:16:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Model_Answer]
@examid int  , @stid int
as
begin
select n.question ,n.right_answer, x.st_Answer
  from Exam e ,Questions_Exam x ,Questoins n 
  where e.st_id =23  and e.exam_id = 7  and x.Q_id = n.Q_id
 order by n.Q_id
end
GO
alter proc [dbo].[Model_Answer]
@examid int  , @stid int
/*i will comment with encryption to see code not only param.*/
--with encryption
as
begin
select n.Q_id,n.question ,n.right_answer, x.st_Answer
  from Exam e ,Questions_Exam x ,Questoins n 
  where e.st_id =23  and 
		e.exam_id = x.exam_id and 
		e.exam_id = 7  and 
		x.Q_id = n.Q_id
 order by n.Q_id
end
GO