USE [TestVOne]
GO

/****** Object:  StoredProcedure [dbo].[Generate_Exam]    Script Date: 5/6/2020 11:24:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE proc  [dbo].[Generate_Exam] @crsID int , @TFN int , @MCN int
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


