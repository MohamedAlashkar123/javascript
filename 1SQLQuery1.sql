
alter  proc collect
@stid int , 
@StdAnswer nvarchar(100) , @QesID int 
with encryption
as
begin 
/*insert data (questions & student answer ) in the tables witout question grade*/
declare @ExamID int
   set @ExamID  =  (select Top(1) exam_id from Exam  order by exam_id desc)
  set  @ExamID =@ExamID + 1
  insert into Exam values (@ExamID ,   getdate(),0 , @stid)
insert into Questions_Exam(exam_id ,Q_id , st_answer)  values (@ExamID ,@QesID , @StdAnswer)

/* calculate the grade for questions one by one */ 
UPDATE
   Questions_Exam
SET
    ques_grade = 1
FROM
    Questions_Exam  AS x
    INNER JOIN Questoins  AS q
        ON x.Q_id = Q.q_id

   where 
    st_answer = right_answer and x.Q_id = Q.q_id
	
	UPDATE
   Questions_Exam
SET
    ques_grade = 0
FROM
    Questions_Exam AS x
    INNER JOIN Questoins  AS q
        ON x.Q_id = Q.q_id

   where 
    st_answer != right_answer
	and  x.Q_id = Q.q_id

/*calculate the total exam grade to show for student and give him exam id */

	select count(ques_grade) as[your exam graade] , @ExamID  as [your exam id]
	from Questions_Exam
	where exam_id = @ExamID and ques_grade = 1
update Exam set  grade  = (select count(ques_grade) from Questions_Examwhere ques_grade=1 and 
exam_id=2) where exam_id=2

end