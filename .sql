--------------------------------------------------------------
--------------------------------------------------------------
--create proc getQuesByExamID
--@examID int
--as 
--begin
--select q.question , qe.st_Answer
--from Questoins q inner join Questions_Exam qe
--on q.Q_id = qe.Q_id and qe.exam_id = @examID
--end
  


---sss
--getQuesByExamID 1;
--------------------------------------------------------
--exam id -->all exam ques --> 
							 --tf
							 --mc

-----------------------------------------------------
----------------------------------------------------
--create  proc generateexam
--@course int ,@m int , @t int 
--with encryption
--as
--begin 
--select top (@m) ques , a ,b , c
--from question s , multi ms
--where s.q_id = ms.q_id and  s.crs_id = @course and s.mt =0
--order by NEWID()

--select top (@t) ques , t , f
--from question q, t_f qq
--where q.q_id = qq.q_id and q.crs_id = @course and mt = 1
--order by NEWID()
--end

--execute generateexam @course = 1 , @m = 3 ,@t=3 

---------------------------------------------------------------
---------------------------------------------------------------
--create proc getQuesByExamIDStudID
--@examID int,@studID int
--as 
--begin
--select q.question , qe.st_Answer
--from Questoins q inner join Questions_Exam qe
--on q.Q_id = qe.Q_id and qe.exam_id = @examID
--inner join Exam ex 
--on qe.exam_id = ex.exam_id and ex.st_id =@studID
--end


--getQuesByExamIDStudID 2,1



----------------------------------------------------------------
----------------------------------------------------------------
--create proc getTopicsByCourseID
--@courseID int
--as 
--begin
--select t.topic_id,t.topic_name
--from Course c inner join Topics t
--on c.crs_id = t.crs_id and t.crs_id = @courseID
--end


--getTopicsByCourseID 1

--select * from Topics
--where crs_id = 1 and crs_id is not null
--------------------------------------------------------
--------------------------------------------------------







--create proc getQuestionsByExamID
--@examID int
--as 
--begin
--select q.question ,qm.choice1,qm.choice2,qm.choice3
--from Questoins q inner join Questions_Exam qe
--on q.Q_id = qe.Q_id and qe.exam_id = 1
--left join Q_multichoice qm
--on qm.Q_id = q.Q_id
--end





getQuestionsByExamID 1










--alter proc getQuestionsBExamID
--as 
--begin
--select q.question ,qm.choice1,qm.choice2,qm.choice3
--from Questoins q inner join Questions_Exam qe
--on q.Q_id = qe.Q_id and qe.exam_id = 1
--inner join Q_multichoice qm
--on qm.Q_id = q.Q_id and q.Ques_Type = 'mc'

--select q.question ,'true' as [true],'false' as [false]
--from Questoins q inner join Questions_Exam qe
--on q.Q_id = qe.Q_id and qe.exam_id = 1
--end











SELECT 
    value  
FROM 
    STRING_SPLIT('red,green,yellow,blue', ',');
   
































--declare @val varchar(2)
--with cte (Ques_Type) as
--(
--select q.Ques_Type
--from Questoins q inner join Questions_Exam qe
--on q.Q_id = qe.Q_id and qe.exam_id = 2
--)
--@val = (select * from cte ) 
--if @val = 'tf'
-- begin
--	select q.question , tf.False,tf.True
--	from Questoins q inner join Questions_Exam qe
--	on q.Q_id = qe.Q_id and qe.exam_id = 2
--	inner join Q_Tru_Fls tf
--	on q.Q_id = tf.q_id
-- end
--else
-- begin
--	select q.question , mc.choice1,mc.choice2,mc.choice3
--	from Questoins q inner join Questions_Exam qe
--	on q.Q_id = qe.Q_id and qe.exam_id = 2
--	inner join Q_multichoice mc
--	on q.Q_id = mc.q_id
-- end 




--select q.question , q.Ques_Type, typeval =
--								case Ques_Type
--								when 'tf' then 
--									select q.question , mc.choice1,mc.choice2,mc.choice3
--									from Questoins q inner join Questions_Exam qe
--									on q.Q_id = qe.Q_id and qe.exam_id = 2
--									inner join Q_multichoice mc
--									on q.Q_id = mc.q_id
--								when 'mc' then
--									select q.question , mc.choice1,mc.choice2,mc.choice3
--									from Questoins q inner join Questions_Exam qe
--									on q.Q_id = qe.Q_id and qe.exam_id = 2
--									inner join Q_multichoice mc
--									on q.Q_id = mc.q_id
--								end
--from Questoins q inner join Questions_Exam qe
--on q.Q_id = qe.Q_id and qe.exam_id = 2
--inner join Q_multichoice mc
--on q.Q_id = mc.q_id


--with cte (Ques_Type) as
--(
--select q.Ques_Type
--from Questoins q inner join Questions_Exam qe
--on q.Q_id = qe.Q_id and qe.exam_id = 2
--)
--select q.question , q.Ques_Type, typeval =
--								case Ques_Type
--								when 'tf' then 
--									select q.question , mc.choice1,mc.choice2,mc.choice3
--									from Questoins q inner join Questions_Exam qe
--									on q.Q_id = qe.Q_id and qe.exam_id = 2
--									inner join Q_multichoice mc
--									on q.Q_id = mc.q_id
--								when 'mc' then
--									select q.question , mc.choice1,mc.choice2,mc.choice3
--									from Questoins q inner join Questions_Exam qe
--									on q.Q_id = qe.Q_id and qe.exam_id = 2
--									inner join Q_multichoice mc
--									on q.Q_id = mc.q_id
--								end
--from cte
