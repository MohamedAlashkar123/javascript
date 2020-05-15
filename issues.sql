alter  proc collect
@stid int 
--i will comment with encryption to can see proc code not only proc param.
--with encryption
as
begin 
declare c1 cursor 
for select qq_id ,st_ans from #table4  readonly 
declare @o int 
   set @o  =  (select Top(1) exam_id from Exam  order by exam_id desc)
  set  @o =@o+ 1
  declare @qq_id int 
declare @st_ans nvarchar(100)
  insert into Exam values (@o ,   getdate(),0 , @stid)
  open c1 
  fetch  c1 into @qq_id ,@st_ans 
  while @@FETCH_STATUS =0
  begin
  select  @qq_id ,@st_ans 
  insert into Questions_Exam(Q_id ,exam_id ,st_Answer ,ques_grade)
      values ( @qq_id,@o ,@st_ans,0 )
  fetch  c1 into @qq_id ,@st_ans 
  end 
  close c1 
  deallocate c1
  --end of put student answer in the tables
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
	and exam_id = @o
	
	UPDATE
   Questions_Exam
SET
    ques_grade = 0
FROM
    Questions_Exam x
    INNER JOIN Questoins  AS q
        ON x.Q_id = Q.q_id

   where 
    st_answer != right_answer
	and  x.Q_id = Q.q_id
	and exam_id = @o

/*calculate the total exam grade to show for student and give him exam id */

	select count(ques_grade) as[your exam graade] , @o  as [your exam id]
	from Questions_Exam
	where exam_id = @o and ques_grade = 1
	-------------------------------------------
	/*update column grade in table exam */
update Exam      set  grade  = (select count(ques_grade)    from Questions_Exam where ques_grade=1 and exam_id= @o)where  exam_id= @o

end
create table #table4  ( qq_id int ,st_ans nvarchar(100))
insert into #table4 values (10,'true'),(11,'false') ,(12,'s')
execute collect  23  