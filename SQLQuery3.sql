select top (3) question , choice1  ,choice2 , choice3
from Questoins s , Q_multichoice  ms
where s.Q_id = ms.Q_id and  s.crs_id = 3 and s.Ques_Type = 'm' 
order by NEWID()
union
select top (3) question , 'true' , 'false'
from Questoins s
where s.crs_id = 3 and Ques_Type = 't' 
order by NEWID()