
alter proc  teststored @stid int , @crsID int , @TFN int , @MCN int
as 
begin
-----------------------------------------------------
declare @Ques nvarchar(MAX)
declare @Q_id int
declare @CH_1 nvarchar(MAX)
declare @CH_2 nvarchar(MAX)
declare @CH_3 nvarchar(MAX)
declare @ORDr bit
------------------------------------------------------
declare QuestionsForExam cursor for
select * 
from (select top (@MCN) s.question AS [Question],
						s.Q_id AS [QUESID] , 
						ms.choice1 AS [Answer One] ,
						ms.choice2 AS [Answer Two]  , 
						ms.choice3 AS [Answer Three] , 
						0 as ordinal
      from Questoins s , Q_multichoice ms
      where s.q_id = ms.q_id and  s.crs_id = @crsID
      order by NEWID()) AS A1
union
select * 
from (select top (@TFN) q.question AS [Question] , 
						q.Q_id AS [QUESID] ,
						'True' AS [Answer One] , 
						'False' AS [Answer Two], 
						' ' AS [Answer Three], 
						1 as ordinal
      from Questoins q
      where q.crs_id = @crsID
      order by NEWID()) AS A2

order by ordinal
----------------------------------------------------
declare @EX_id int 
----------------------------------------------------
set @EX_id  =  (select Top(1) exam_id from Exam  order by exam_id desc)
set  @EX_id = @EX_id + 1

insert into Exam values (@EX_id , getdate(), 0 , @stid)


create table #GatherQuestions
(
Question nvarchar(MAX),
ID int,
Choice1 nvarchar(MAX),
Choice2 nvarchar(MAX),
Choice3 nvarchar(MAX),
ORD bit
)

open QuestionsForExam 

fetch  QuestionsForExam into @Ques,@Q_id,@CH_1,@CH_2,@CH_3,@ORDr
  while( @@FETCH_STATUS = 0)
  begin
        insert into #GatherQuestions select @Ques,@Q_id,@CH_1,@CH_2,@CH_3,@ORDr 
		insert into Questions_Exam(Q_id ,exam_id ,st_Answer ,ques_grade) values ( @Q_id,@EX_id ,'',0 )
		fetch  QuestionsForExam into @Ques,@Q_id,@CH_1,@CH_2,@CH_3,@ORDr
  end 
  select * from #GatherQuestions
close QuestionsForExam 
deallocate QuestionsForExam
end
GO



teststored 23,3,3,3