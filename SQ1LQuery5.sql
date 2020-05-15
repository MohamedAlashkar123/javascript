create  proc collect
@stid int,
@w nvarchar(100) , @e int 
with encryption
as
begin 
/*insert data (questions & student answer ) in the tables witout question grade*/
declare @o int 
   set @o  =  (select Top(1) exam_id from Exam  order by exam_id desc)
  set  @o =@o+ 1
  insert into Exam values (@o ,   getdate() ,0,@stid)
insert into Questions_Exam(exam_id ,Q_id , st_answer)  values (@o ,@e , @W)

/* calculate the grade for questions one by one */ 
UPDATE
   Questions_Exam
SET
    ques_grade = 1
FROM
    Questions_Exam  AS x
    INNER JOIN Questions  AS q
        ON x.Q_id = Q.q_id

   where 
    st_answer = right_answer and x.Q_id = Q.q_id

	UPDATE
   Questions_Exam
SET
    ques_grade = 0
FROM
    Questions_Exam AS x
    INNER JOIN Questions  AS q
        ON x.Q_id = Q.q_id

   where 
    st_answer != right_answer
	and  x.Q_id = Q.q_id

/*calculate the total exam grade to show for student and give him exam id */
declare @grad int
	select @grad = count(ques_grade) as[your exam graade] , @o  as [your exam id]
	from Questions_Exam qm
	where exam_id = @o and ques_grade = 1

	update Exam 
	set grade = @grad
	where 
end
