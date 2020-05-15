with MultiCoice as
(
select top 3 q.question , qm.choice1,qm.choice2,qm.choice3
from Questoins q inner join Q_multichoice qm 
on q.Q_id = qm.Q_id and q.crs_id = 3
order by NEWID()
) select * from MultiCoice
union
select top 3 q.question , 'True' , 'False' , ''
from Questoins q 
where q.crs_id = 3
order by NEWID()
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
with allques as
(
select  q.question , qm.choice1,qm.choice2,qm.choice3
from Questoins q inner join Q_multichoice qm 
on q.Q_id = qm.Q_id and q.crs_id = 3
union
select q.question , 'True' , 'False' , ''
from Questoins q 
where q.crs_id = 3
) select top 10 * from allques order by NEWID()

-------------------------------------------------------------
-------------------------------------------------------------
-------------------------------------------------------------
select * from 
(select top 3 q.question , qm.choice1,qm.choice2,qm.choice3
from Questoins q inner join Q_multichoice qm 
on q.Q_id = qm.Q_id and q.crs_id = 3
order by NEWID())
union 
select * from
(select top 3 q.question , 'True' , 'False' , ''
from Questoins q 
where q.crs_id = 3
order by NEWID())






